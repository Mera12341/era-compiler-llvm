//===- LowerMemIntrinsics.cpp ----------------------------------*- C++ -*--===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "llvm/Transforms/Utils/LowerMemIntrinsics.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/MDBuilder.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include <optional>

#define DEBUG_TYPE "lower-mem-intrinsics"

using namespace llvm;

void llvm::createMemCpyLoopKnownSize(
    Instruction *InsertBefore, Value *SrcAddr, Value *DstAddr,
    ConstantInt *CopyLen, Align SrcAlign, Align DstAlign, bool SrcIsVolatile,
    bool DstIsVolatile, bool CanOverlap, const TargetTransformInfo &TTI,
    std::optional<uint32_t> AtomicElementSize) {
  // No need to expand zero length copies.
  if (CopyLen->isZero())
    return;

  BasicBlock *PreLoopBB = InsertBefore->getParent();
  BasicBlock *PostLoopBB = nullptr;
  Function *ParentFunc = PreLoopBB->getParent();
  LLVMContext &Ctx = PreLoopBB->getContext();
  const DataLayout &DL = ParentFunc->getParent()->getDataLayout();
  MDBuilder MDB(Ctx);
  MDNode *NewDomain = MDB.createAnonymousAliasScopeDomain("MemCopyDomain");
  StringRef Name = "MemCopyAliasScope";
  MDNode *NewScope = MDB.createAnonymousAliasScope(NewDomain, Name);

  unsigned SrcAS = cast<PointerType>(SrcAddr->getType())->getAddressSpace();
  unsigned DstAS = cast<PointerType>(DstAddr->getType())->getAddressSpace();

  Type *TypeOfCopyLen = CopyLen->getType();
  Type *LoopOpType = TTI.getMemcpyLoopLoweringType(
      Ctx, CopyLen, SrcAS, DstAS, SrcAlign.value(), DstAlign.value(),
      AtomicElementSize);
  assert((!AtomicElementSize || !LoopOpType->isVectorTy()) &&
         "Atomic memcpy lowering is not supported for vector operand type");

  unsigned LoopOpSize = DL.getTypeStoreSize(LoopOpType);
  assert((!AtomicElementSize || LoopOpSize % *AtomicElementSize == 0) &&
      "Atomic memcpy lowering is not supported for selected operand size");

  uint64_t LoopEndCount = CopyLen->getZExtValue() / LoopOpSize;

  if (LoopEndCount != 0) {
    // Split
    PostLoopBB = PreLoopBB->splitBasicBlock(InsertBefore, "memcpy-split");
    BasicBlock *LoopBB =
        BasicBlock::Create(Ctx, "load-store-loop", ParentFunc, PostLoopBB);
    PreLoopBB->getTerminator()->setSuccessor(0, LoopBB);

    IRBuilder<> PLBuilder(PreLoopBB->getTerminator());

    // Cast the Src and Dst pointers to pointers to the loop operand type (if
    // needed).
    PointerType *SrcOpType = PointerType::get(LoopOpType, SrcAS);
    PointerType *DstOpType = PointerType::get(LoopOpType, DstAS);
    if (SrcAddr->getType() != SrcOpType) {
      SrcAddr = PLBuilder.CreateBitCast(SrcAddr, SrcOpType);
    }
    if (DstAddr->getType() != DstOpType) {
      DstAddr = PLBuilder.CreateBitCast(DstAddr, DstOpType);
    }

    Align PartDstAlign(commonAlignment(DstAlign, LoopOpSize));
    Align PartSrcAlign(commonAlignment(SrcAlign, LoopOpSize));

    IRBuilder<> LoopBuilder(LoopBB);
    PHINode *LoopIndex = LoopBuilder.CreatePHI(TypeOfCopyLen, 2, "loop-index");
    LoopIndex->addIncoming(ConstantInt::get(TypeOfCopyLen, 0U), PreLoopBB);
    // Loop Body
    Value *SrcGEP =
        LoopBuilder.CreateInBoundsGEP(LoopOpType, SrcAddr, LoopIndex);
    LoadInst *Load = LoopBuilder.CreateAlignedLoad(LoopOpType, SrcGEP,
                                                   PartSrcAlign, SrcIsVolatile);
    if (!CanOverlap) {
      // Set alias scope for loads.
      Load->setMetadata(LLVMContext::MD_alias_scope,
                        MDNode::get(Ctx, NewScope));
    }
    Value *DstGEP =
        LoopBuilder.CreateInBoundsGEP(LoopOpType, DstAddr, LoopIndex);
    StoreInst *Store = LoopBuilder.CreateAlignedStore(
        Load, DstGEP, PartDstAlign, DstIsVolatile);
    if (!CanOverlap) {
      // Indicate that stores don't overlap loads.
      Store->setMetadata(LLVMContext::MD_noalias, MDNode::get(Ctx, NewScope));
    }
    if (AtomicElementSize) {
      Load->setAtomic(AtomicOrdering::Unordered);
      Store->setAtomic(AtomicOrdering::Unordered);
    }
    Value *NewIndex =
        LoopBuilder.CreateAdd(LoopIndex, ConstantInt::get(TypeOfCopyLen, 1U));
    LoopIndex->addIncoming(NewIndex, LoopBB);

    // Create the loop branch condition.
    Constant *LoopEndCI = ConstantInt::get(TypeOfCopyLen, LoopEndCount);
    LoopBuilder.CreateCondBr(LoopBuilder.CreateICmpULT(NewIndex, LoopEndCI),
                             LoopBB, PostLoopBB);
  }

  uint64_t BytesCopied = LoopEndCount * LoopOpSize;
  uint64_t RemainingBytes = CopyLen->getZExtValue() - BytesCopied;
  if (RemainingBytes) {
    IRBuilder<> RBuilder(PostLoopBB ? PostLoopBB->getFirstNonPHI()
                                    : InsertBefore);

    SmallVector<Type *, 5> RemainingOps;
    TTI.getMemcpyLoopResidualLoweringType(RemainingOps, Ctx, RemainingBytes,
                                          SrcAS, DstAS, SrcAlign.value(),
                                          DstAlign.value(), AtomicElementSize);

    for (auto *OpTy : RemainingOps) {
      Align PartSrcAlign(commonAlignment(SrcAlign, BytesCopied));
      Align PartDstAlign(commonAlignment(DstAlign, BytesCopied));

      // Calculate the new index
      unsigned OperandSize = DL.getTypeStoreSize(OpTy);
      assert(
          (!AtomicElementSize || OperandSize % *AtomicElementSize == 0) &&
          "Atomic memcpy lowering is not supported for selected operand size");

      uint64_t GepIndex = BytesCopied / OperandSize;
      assert(GepIndex * OperandSize == BytesCopied &&
             "Division should have no Remainder!");
      // Cast source to operand type and load
      PointerType *SrcPtrType = PointerType::get(OpTy, SrcAS);
      Value *CastedSrc = SrcAddr->getType() == SrcPtrType
                             ? SrcAddr
                             : RBuilder.CreateBitCast(SrcAddr, SrcPtrType);
      Value *SrcGEP = RBuilder.CreateInBoundsGEP(
          OpTy, CastedSrc, ConstantInt::get(TypeOfCopyLen, GepIndex));
      LoadInst *Load =
          RBuilder.CreateAlignedLoad(OpTy, SrcGEP, PartSrcAlign, SrcIsVolatile);
      if (!CanOverlap) {
        // Set alias scope for loads.
        Load->setMetadata(LLVMContext::MD_alias_scope,
                          MDNode::get(Ctx, NewScope));
      }
      // Cast destination to operand type and store.
      PointerType *DstPtrType = PointerType::get(OpTy, DstAS);
      Value *CastedDst = DstAddr->getType() == DstPtrType
                             ? DstAddr
                             : RBuilder.CreateBitCast(DstAddr, DstPtrType);
      Value *DstGEP = RBuilder.CreateInBoundsGEP(
          OpTy, CastedDst, ConstantInt::get(TypeOfCopyLen, GepIndex));
      StoreInst *Store = RBuilder.CreateAlignedStore(Load, DstGEP, PartDstAlign,
                                                     DstIsVolatile);
      if (!CanOverlap) {
        // Indicate that stores don't overlap loads.
        Store->setMetadata(LLVMContext::MD_noalias, MDNode::get(Ctx, NewScope));
      }
      if (AtomicElementSize) {
        Load->setAtomic(AtomicOrdering::Unordered);
        Store->setAtomic(AtomicOrdering::Unordered);
      }
      BytesCopied += OperandSize;
    }
  }
  assert(BytesCopied == CopyLen->getZExtValue() &&
         "Bytes copied should match size in the call!");
}

void llvm::createMemCpyLoopUnknownSize(
    Instruction *InsertBefore, Value *SrcAddr, Value *DstAddr, Value *CopyLen,
    Align SrcAlign, Align DstAlign, bool SrcIsVolatile, bool DstIsVolatile,
    bool CanOverlap, const TargetTransformInfo &TTI,
    std::optional<uint32_t> AtomicElementSize) {
  BasicBlock *PreLoopBB = InsertBefore->getParent();
  BasicBlock *PostLoopBB =
      PreLoopBB->splitBasicBlock(InsertBefore, "post-loop-memcpy-expansion");

  Function *ParentFunc = PreLoopBB->getParent();
  const DataLayout &DL = ParentFunc->getParent()->getDataLayout();
  LLVMContext &Ctx = PreLoopBB->getContext();
  MDBuilder MDB(Ctx);
  MDNode *NewDomain = MDB.createAnonymousAliasScopeDomain("MemCopyDomain");
  StringRef Name = "MemCopyAliasScope";
  MDNode *NewScope = MDB.createAnonymousAliasScope(NewDomain, Name);

  unsigned SrcAS = cast<PointerType>(SrcAddr->getType())->getAddressSpace();
  unsigned DstAS = cast<PointerType>(DstAddr->getType())->getAddressSpace();

  Type *LoopOpType = TTI.getMemcpyLoopLoweringType(
      Ctx, CopyLen, SrcAS, DstAS, SrcAlign.value(), DstAlign.value(),
      AtomicElementSize);
  assert((!AtomicElementSize || !LoopOpType->isVectorTy()) &&
         "Atomic memcpy lowering is not supported for vector operand type");
  unsigned LoopOpSize = DL.getTypeStoreSize(LoopOpType);
  assert((!AtomicElementSize || LoopOpSize % *AtomicElementSize == 0) &&
         "Atomic memcpy lowering is not supported for selected operand size");

  IRBuilder<> PLBuilder(PreLoopBB->getTerminator());

  PointerType *SrcOpType = PointerType::get(LoopOpType, SrcAS);
  PointerType *DstOpType = PointerType::get(LoopOpType, DstAS);
  if (SrcAddr->getType() != SrcOpType) {
    SrcAddr = PLBuilder.CreateBitCast(SrcAddr, SrcOpType);
  }
  if (DstAddr->getType() != DstOpType) {
    DstAddr = PLBuilder.CreateBitCast(DstAddr, DstOpType);
  }

  // Calculate the loop trip count, and remaining bytes to copy after the loop.
  Type *CopyLenType = CopyLen->getType();
  IntegerType *ILengthType = dyn_cast<IntegerType>(CopyLenType);
  assert(ILengthType &&
         "expected size argument to memcpy to be an integer type!");
  Type *Int8Type = Type::getInt8Ty(Ctx);
  bool LoopOpIsInt8 = LoopOpType == Int8Type;
  ConstantInt *CILoopOpSize = ConstantInt::get(ILengthType, LoopOpSize);
  Value *RuntimeLoopCount = LoopOpIsInt8 ?
                            CopyLen :
                            PLBuilder.CreateUDiv(CopyLen, CILoopOpSize);
  BasicBlock *LoopBB =
      BasicBlock::Create(Ctx, "loop-memcpy-expansion", ParentFunc, PostLoopBB);
  IRBuilder<> LoopBuilder(LoopBB);

  Align PartSrcAlign(commonAlignment(SrcAlign, LoopOpSize));
  Align PartDstAlign(commonAlignment(DstAlign, LoopOpSize));

  PHINode *LoopIndex = LoopBuilder.CreatePHI(CopyLenType, 2, "loop-index");
  LoopIndex->addIncoming(ConstantInt::get(CopyLenType, 0U), PreLoopBB);

  Value *SrcGEP = LoopBuilder.CreateInBoundsGEP(LoopOpType, SrcAddr, LoopIndex);
  LoadInst *Load = LoopBuilder.CreateAlignedLoad(LoopOpType, SrcGEP,
                                                 PartSrcAlign, SrcIsVolatile);
  if (!CanOverlap) {
    // Set alias scope for loads.
    Load->setMetadata(LLVMContext::MD_alias_scope, MDNode::get(Ctx, NewScope));
  }
  Value *DstGEP = LoopBuilder.CreateInBoundsGEP(LoopOpType, DstAddr, LoopIndex);
  StoreInst *Store =
      LoopBuilder.CreateAlignedStore(Load, DstGEP, PartDstAlign, DstIsVolatile);
  if (!CanOverlap) {
    // Indicate that stores don't overlap loads.
    Store->setMetadata(LLVMContext::MD_noalias, MDNode::get(Ctx, NewScope));
  }
  if (AtomicElementSize) {
    Load->setAtomic(AtomicOrdering::Unordered);
    Store->setAtomic(AtomicOrdering::Unordered);
  }
  Value *NewIndex =
      LoopBuilder.CreateAdd(LoopIndex, ConstantInt::get(CopyLenType, 1U));
  LoopIndex->addIncoming(NewIndex, LoopBB);

  bool requiresResidual =
      !LoopOpIsInt8 && !(AtomicElementSize && LoopOpSize == AtomicElementSize);
  if (requiresResidual) {
    Type *ResLoopOpType = AtomicElementSize
                              ? Type::getIntNTy(Ctx, *AtomicElementSize * 8)
                              : Int8Type;
    unsigned ResLoopOpSize = DL.getTypeStoreSize(ResLoopOpType);
    assert((ResLoopOpSize == AtomicElementSize ? *AtomicElementSize : 1) &&
           "Store size is expected to match type size");

    // Add in the
    Value *RuntimeResidual = PLBuilder.CreateURem(CopyLen, CILoopOpSize);
    Value *RuntimeBytesCopied = PLBuilder.CreateSub(CopyLen, RuntimeResidual);

    // Loop body for the residual copy.
    BasicBlock *ResLoopBB = BasicBlock::Create(Ctx, "loop-memcpy-residual",
                                               PreLoopBB->getParent(),
                                               PostLoopBB);
    // Residual loop header.
    BasicBlock *ResHeaderBB = BasicBlock::Create(
        Ctx, "loop-memcpy-residual-header", PreLoopBB->getParent(), nullptr);

    // Need to update the pre-loop basic block to branch to the correct place.
    // branch to the main loop if the count is non-zero, branch to the residual
    // loop if the copy size is smaller then 1 iteration of the main loop but
    // non-zero and finally branch to after the residual loop if the memcpy
    //  size is zero.
    ConstantInt *Zero = ConstantInt::get(ILengthType, 0U);
    PLBuilder.CreateCondBr(PLBuilder.CreateICmpNE(RuntimeLoopCount, Zero),
                           LoopBB, ResHeaderBB);
    PreLoopBB->getTerminator()->eraseFromParent();

    LoopBuilder.CreateCondBr(
        LoopBuilder.CreateICmpULT(NewIndex, RuntimeLoopCount), LoopBB,
        ResHeaderBB);

    // Determine if we need to branch to the residual loop or bypass it.
    IRBuilder<> RHBuilder(ResHeaderBB);
    RHBuilder.CreateCondBr(RHBuilder.CreateICmpNE(RuntimeResidual, Zero),
                           ResLoopBB, PostLoopBB);

    // Copy the residual with single byte load/store loop.
    IRBuilder<> ResBuilder(ResLoopBB);
    PHINode *ResidualIndex =
        ResBuilder.CreatePHI(CopyLenType, 2, "residual-loop-index");
    ResidualIndex->addIncoming(Zero, ResHeaderBB);

    Value *SrcAsResLoopOpType = ResBuilder.CreateBitCast(
        SrcAddr, PointerType::get(ResLoopOpType, SrcAS));
    Value *DstAsResLoopOpType = ResBuilder.CreateBitCast(
        DstAddr, PointerType::get(ResLoopOpType, DstAS));
    Value *FullOffset = ResBuilder.CreateAdd(RuntimeBytesCopied, ResidualIndex);
    Value *SrcGEP = ResBuilder.CreateInBoundsGEP(
        ResLoopOpType, SrcAsResLoopOpType, FullOffset);
    LoadInst *Load = ResBuilder.CreateAlignedLoad(ResLoopOpType, SrcGEP,
                                                  PartSrcAlign, SrcIsVolatile);
    if (!CanOverlap) {
      // Set alias scope for loads.
      Load->setMetadata(LLVMContext::MD_alias_scope,
                        MDNode::get(Ctx, NewScope));
    }
    Value *DstGEP = ResBuilder.CreateInBoundsGEP(
        ResLoopOpType, DstAsResLoopOpType, FullOffset);
    StoreInst *Store = ResBuilder.CreateAlignedStore(Load, DstGEP, PartDstAlign,
                                                     DstIsVolatile);
    if (!CanOverlap) {
      // Indicate that stores don't overlap loads.
      Store->setMetadata(LLVMContext::MD_noalias, MDNode::get(Ctx, NewScope));
    }
    if (AtomicElementSize) {
      Load->setAtomic(AtomicOrdering::Unordered);
      Store->setAtomic(AtomicOrdering::Unordered);
    }
    Value *ResNewIndex = ResBuilder.CreateAdd(
        ResidualIndex, ConstantInt::get(CopyLenType, ResLoopOpSize));
    ResidualIndex->addIncoming(ResNewIndex, ResLoopBB);

    // Create the loop branch condition.
    ResBuilder.CreateCondBr(
        ResBuilder.CreateICmpULT(ResNewIndex, RuntimeResidual), ResLoopBB,
        PostLoopBB);
  } else {
    // In this case the loop operand type was a byte, and there is no need for a
    // residual loop to copy the remaining memory after the main loop.
    // We do however need to patch up the control flow by creating the
    // terminators for the preloop block and the memcpy loop.
    ConstantInt *Zero = ConstantInt::get(ILengthType, 0U);
    PLBuilder.CreateCondBr(PLBuilder.CreateICmpNE(RuntimeLoopCount, Zero),
                           LoopBB, PostLoopBB);
    PreLoopBB->getTerminator()->eraseFromParent();
    LoopBuilder.CreateCondBr(
        LoopBuilder.CreateICmpULT(NewIndex, RuntimeLoopCount), LoopBB,
        PostLoopBB);
  }
}

// EraVM local begin
void llvm::createEraVMMemCpyLoopKnownSize(Instruction *InsertBefore,
                                          Value *SrcAddr, Value *DstAddr,
                                          ConstantInt *CopyLen, Align SrcAlign,
                                          Align DstAlign, bool SrcIsVolatile,
                                          bool DstIsVolatile,
                                          const TargetTransformInfo &TTI) {
  // No need to expand zero length copies.
  if (CopyLen->isZero())
    return;

  BasicBlock *PreLoopBB = InsertBefore->getParent();
  BasicBlock *PostLoopBB = nullptr;
  Function *ParentFunc = PreLoopBB->getParent();
  LLVMContext &Ctx = PreLoopBB->getContext();
  const DataLayout &DL = ParentFunc->getParent()->getDataLayout();

  unsigned SrcAS = cast<PointerType>(SrcAddr->getType())->getAddressSpace();
  unsigned DstAS = cast<PointerType>(DstAddr->getType())->getAddressSpace();

  Type *TypeOfCopyLen = IntegerType::getInt256Ty(Ctx);
  Type *LoopOpType = TTI.getMemcpyLoopLoweringType(
      Ctx, CopyLen, SrcAS, DstAS, SrcAlign.value(), DstAlign.value());

  unsigned LoopOpSize = DL.getTypeStoreSize(LoopOpType);

  APInt CopyLenVal = CopyLen->getValue().zext(256);
  APInt LoopEndCount = CopyLenVal.udiv(APInt(256, LoopOpSize));

  if (LoopEndCount != 0) {
    // Split
    PostLoopBB = PreLoopBB->splitBasicBlock(InsertBefore, "memcpy-split");
    BasicBlock *LoopBB =
        BasicBlock::Create(Ctx, "load-store-loop", ParentFunc, PostLoopBB);
    PreLoopBB->getTerminator()->setSuccessor(0, LoopBB);

    IRBuilder<> PLBuilder(PreLoopBB->getTerminator());

    PointerType *SrcOpType = PointerType::get(LoopOpType, SrcAS);
    PointerType *DstOpType = PointerType::get(LoopOpType, DstAS);
    if (SrcAddr->getType() != SrcOpType)
      SrcAddr = PLBuilder.CreateBitCast(SrcAddr, SrcOpType);
    if (DstAddr->getType() != DstOpType)
      DstAddr = PLBuilder.CreateBitCast(DstAddr, DstOpType);

    Align PartDstAlign(commonAlignment(DstAlign, LoopOpSize));
    Align PartSrcAlign(commonAlignment(SrcAlign, LoopOpSize));

    IRBuilder<> LoopBuilder(LoopBB);
    PHINode *LoopIndex = LoopBuilder.CreatePHI(TypeOfCopyLen, 2, "loop-index");
    LoopIndex->addIncoming(ConstantInt::get(TypeOfCopyLen, 0U), PreLoopBB);

    // Loop Body
    Value *SrcGEP =
        LoopBuilder.CreateInBoundsGEP(LoopOpType, SrcAddr, LoopIndex);
    Value *Load = LoopBuilder.CreateAlignedLoad(LoopOpType, SrcGEP,
                                                PartSrcAlign, SrcIsVolatile);
    Value *DstGEP =
        LoopBuilder.CreateInBoundsGEP(LoopOpType, DstAddr, LoopIndex);
    LoopBuilder.CreateAlignedStore(Load, DstGEP, PartDstAlign, DstIsVolatile);

    Value *NewIndex =
        LoopBuilder.CreateAdd(LoopIndex, ConstantInt::get(TypeOfCopyLen, 1U));
    LoopIndex->addIncoming(NewIndex, LoopBB);

    // Create the loop branch condition.
    Constant *LoopEndCI = ConstantInt::get(TypeOfCopyLen, LoopEndCount);
    LoopBuilder.CreateCondBr(LoopBuilder.CreateICmpULT(NewIndex, LoopEndCI),
                             LoopBB, PostLoopBB);
  }

  APInt BytesCopied = LoopEndCount * LoopOpSize;
  APInt RemainingBytes = CopyLenVal - BytesCopied;
  if (RemainingBytes != 0) {
    IRBuilder<> RBuilder(PostLoopBB ? PostLoopBB->getFirstNonPHI()
                                    : InsertBefore);
    APInt GepIndex = BytesCopied.udiv(32);
    SrcAddr = RBuilder.CreateInBoundsGEP(LoopOpType, SrcAddr,
                                         RBuilder.getInt(GepIndex));

    Value *Load = RBuilder.CreateAlignedLoad(LoopOpType, SrcAddr, SrcAlign,
                                             SrcIsVolatile);
    Value *RuntimeResidual = RBuilder.getInt(8 * RemainingBytes);
    Value *RuntimeResidualI = RBuilder.getInt(256 - 8 * RemainingBytes);
    Value *LoadMask = RBuilder.CreateShl(RBuilder.getInt(APInt(256, -1, true)),
                                         RuntimeResidualI);
    Load = RBuilder.CreateAnd(Load, LoadMask);

    DstAddr = RBuilder.CreateInBoundsGEP(LoopOpType, DstAddr,
                                         RBuilder.getInt(GepIndex));

    Value *Origin = RBuilder.CreateAlignedLoad(LoopOpType, DstAddr, DstAlign,
                                               DstIsVolatile);
    Value *OriginMask = RBuilder.CreateLShr(
        RBuilder.getInt(APInt(256, -1, true)), RuntimeResidual);
    Origin = RBuilder.CreateAnd(Origin, OriginMask);
    Load = RBuilder.CreateOr(Load, Origin);
    RBuilder.CreateAlignedStore(Load, DstAddr, DstAlign, DstIsVolatile);
    BytesCopied += RemainingBytes;
  }
  assert(BytesCopied == CopyLenVal &&
         "Bytes copied should match size in the call!");
}

void llvm::createEraVMMemCpyLoopUnknownSize(Instruction *InsertBefore,
                                            Value *SrcAddr, Value *DstAddr,
                                            Value *CopyLen, Align SrcAlign,
                                            Align DstAlign, bool SrcIsVolatile,
                                            bool DstIsVolatile,
                                            const TargetTransformInfo &TTI) {
  BasicBlock *PreLoopBB = InsertBefore->getParent();
  BasicBlock *PostLoopBB =
      PreLoopBB->splitBasicBlock(InsertBefore, "memcpy-split");

  Function *ParentFunc = PreLoopBB->getParent();
  const DataLayout &DL = ParentFunc->getParent()->getDataLayout();
  LLVMContext &Ctx = PreLoopBB->getContext();
  unsigned SrcAS = cast<PointerType>(SrcAddr->getType())->getAddressSpace();
  unsigned DstAS = cast<PointerType>(DstAddr->getType())->getAddressSpace();

  Type *LoopOpType = TTI.getMemcpyLoopLoweringType(
      Ctx, CopyLen, SrcAS, DstAS, SrcAlign.value(), DstAlign.value());
  unsigned LoopOpSize = DL.getTypeStoreSize(LoopOpType);

  IRBuilder<> PLBuilder(PreLoopBB->getTerminator());

  PointerType *SrcOpType = PointerType::get(LoopOpType, SrcAS);
  PointerType *DstOpType = PointerType::get(LoopOpType, DstAS);
  if (SrcAddr->getType() != SrcOpType)
    SrcAddr = PLBuilder.CreateBitCast(SrcAddr, SrcOpType);
  if (DstAddr->getType() != DstOpType)
    DstAddr = PLBuilder.CreateBitCast(DstAddr, DstOpType);

  // Calculate the loop trip count, and remaining bytes to copy after the loop.
  Type *CopyLenType = CopyLen->getType();
  IntegerType *ILengthType = dyn_cast<IntegerType>(CopyLenType);

  ConstantInt *CILoopOpSize = ConstantInt::get(ILengthType, LoopOpSize);
  Value *LoopCount = PLBuilder.CreateUDiv(CopyLen, CILoopOpSize, "loop-count");
  Value *ResidualBytes =
      PLBuilder.CreateURem(CopyLen, CILoopOpSize, "residual-bytes");
  // Create an empty preheader BB for load-store-loop since in this loop
  // we can use indexed instructions and EraVMIndexedMemOpsPrepare
  // requires loops to be in a simplify form.
  BasicBlock *LoopPreheaderBB = BasicBlock::Create(
      Ctx, "load-store-loop-preheader", ParentFunc, PostLoopBB);
  BasicBlock *LoopBB =
      BasicBlock::Create(Ctx, "load-store-loop", ParentFunc, PostLoopBB);
  // Create an empty exit BB for load-store-loop since in this loop
  // we can use indexed instructions and EraVMIndexedMemOpsPrepare
  // requires loops to be in a simplify form.
  BasicBlock *LoopExitBB =
      BasicBlock::Create(Ctx, "load-store-loop-exit", ParentFunc, PostLoopBB);
  IRBuilder<> LoopBuilder(LoopBB);

  Align PartSrcAlign(commonAlignment(SrcAlign, LoopOpSize));
  Align PartDstAlign(commonAlignment(DstAlign, LoopOpSize));

  PHINode *LoopIndex = LoopBuilder.CreatePHI(CopyLenType, 2, "loop-index");
  LoopIndex->addIncoming(ConstantInt::get(CopyLenType, 0U), LoopPreheaderBB);

  Value *SrcGEP = LoopBuilder.CreateInBoundsGEP(LoopOpType, SrcAddr, LoopIndex);
  Value *Load = LoopBuilder.CreateAlignedLoad(LoopOpType, SrcGEP, PartSrcAlign,
                                              SrcIsVolatile);
  Value *DstGEP = LoopBuilder.CreateInBoundsGEP(LoopOpType, DstAddr, LoopIndex);
  LoopBuilder.CreateAlignedStore(Load, DstGEP, PartDstAlign, DstIsVolatile);

  Value *NewIndex =
      LoopBuilder.CreateAdd(LoopIndex, ConstantInt::get(CopyLenType, 1U));
  LoopIndex->addIncoming(NewIndex, LoopBB);
  LoopBuilder.CreateCondBr(LoopBuilder.CreateICmpULT(NewIndex, LoopCount),
                           LoopBB, LoopExitBB);

  // Condition check if residual copy is needed.
  BasicBlock *ResCondBB = BasicBlock::Create(
      Ctx, "memcpy-residual-cond", PreLoopBB->getParent(), PostLoopBB);
  // BB for the residual copy.
  BasicBlock *ResBB = BasicBlock::Create(Ctx, "memcpy-residual",
                                         PreLoopBB->getParent(), PostLoopBB);

  BranchInst::Create(LoopBB, LoopPreheaderBB);
  BranchInst::Create(ResCondBB, LoopExitBB);

  // Need to update the pre-loop basic block to branch to the correct place.
  // branch to the loop preheader if the count is non-zero, branch to the
  // residual condition if the copy size is smaller then 1 iteration of the
  // main loop but non-zero and finally branch to after the residual copy
  // if the memcpy size is zero.
  ConstantInt *Zero = ConstantInt::get(ILengthType, 0U);
  PLBuilder.CreateCondBr(PLBuilder.CreateICmpNE(LoopCount, Zero),
                         LoopPreheaderBB, ResCondBB);
  PreLoopBB->getTerminator()->eraseFromParent();

  // Determine if we need to branch to the residual copy or bypass it.
  IRBuilder<> RHBuilder(ResCondBB);

  RHBuilder.CreateCondBr(RHBuilder.CreateICmpNE(ResidualBytes, Zero), ResBB,
                         PostLoopBB);

  // Copy the residual load/store and bitwise operations.
  IRBuilder<> ResBuilder(ResBB);

  SrcAddr = ResBuilder.CreateInBoundsGEP(LoopOpType, SrcAddr, LoopCount);
  Load = ResBuilder.CreateAlignedLoad(LoopOpType, SrcAddr, PartSrcAlign,
                                      SrcIsVolatile);
  Value *ResidualBits = ResBuilder.CreateMul(
      ResBuilder.getInt(APInt(256, 8, false)), ResidualBytes);
  Value *ResidualBitsI = ResBuilder.CreateSub(
      ResBuilder.getInt(APInt(256, 256, false)), ResidualBits);
  Value *LoadMask = ResBuilder.CreateShl(
      ResBuilder.getInt(APInt(256, -1, true)), ResidualBitsI);
  Load = ResBuilder.CreateAnd(Load, LoadMask);

  DstAddr = ResBuilder.CreateInBoundsGEP(LoopOpType, DstAddr, LoopCount);
  Value *Origin = ResBuilder.CreateAlignedLoad(LoopOpType, DstAddr,
                                               PartDstAlign, DstIsVolatile);
  Value *OriginMask = ResBuilder.CreateLShr(
      ResBuilder.getInt(APInt(256, -1, true)), ResidualBits);
  Origin = ResBuilder.CreateAnd(Origin, OriginMask);
  Load = ResBuilder.CreateOr(Load, Origin);
  ResBuilder.CreateAlignedStore(Load, DstAddr, PartDstAlign, DstIsVolatile);
  ResBuilder.CreateBr(PostLoopBB);
}
// EraVM local end

// Lower memmove to IR. memmove is required to correctly copy overlapping memory
// regions; therefore, it has to check the relative positions of the source and
// destination pointers and choose the copy direction accordingly.
//
// The code below is an IR rendition of this C function:
//
// void* memmove(void* dst, const void* src, size_t n) {
//   unsigned char* d = dst;
//   const unsigned char* s = src;
//   if (s < d) {
//     // copy backwards
//     while (n--) {
//       d[n] = s[n];
//     }
//   } else {
//     // copy forward
//     for (size_t i = 0; i < n; ++i) {
//       d[i] = s[i];
//     }
//   }
//   return dst;
// }
static void createMemMoveLoop(Instruction *InsertBefore, Value *SrcAddr,
                              Value *DstAddr, Value *CopyLen, Align SrcAlign,
                              Align DstAlign, bool SrcIsVolatile,
                              bool DstIsVolatile,
                              const TargetTransformInfo &TTI) {
  Type *TypeOfCopyLen = CopyLen->getType();
  BasicBlock *OrigBB = InsertBefore->getParent();
  Function *F = OrigBB->getParent();
  const DataLayout &DL = F->getParent()->getDataLayout();
  // TODO: Use different element type if possible?
  Type *EltTy = Type::getInt8Ty(F->getContext());

  // Create the a comparison of src and dst, based on which we jump to either
  // the forward-copy part of the function (if src >= dst) or the backwards-copy
  // part (if src < dst).
  // SplitBlockAndInsertIfThenElse conveniently creates the basic if-then-else
  // structure. Its block terminators (unconditional branches) are replaced by
  // the appropriate conditional branches when the loop is built.
  ICmpInst *PtrCompare = new ICmpInst(InsertBefore, ICmpInst::ICMP_ULT,
                                      SrcAddr, DstAddr, "compare_src_dst");
  Instruction *ThenTerm, *ElseTerm;
  SplitBlockAndInsertIfThenElse(PtrCompare, InsertBefore, &ThenTerm,
                                &ElseTerm);

  // Each part of the function consists of two blocks:
  //   copy_backwards:        used to skip the loop when n == 0
  //   copy_backwards_loop:   the actual backwards loop BB
  //   copy_forward:          used to skip the loop when n == 0
  //   copy_forward_loop:     the actual forward loop BB
  BasicBlock *CopyBackwardsBB = ThenTerm->getParent();
  CopyBackwardsBB->setName("copy_backwards");
  BasicBlock *CopyForwardBB = ElseTerm->getParent();
  CopyForwardBB->setName("copy_forward");
  BasicBlock *ExitBB = InsertBefore->getParent();
  ExitBB->setName("memmove_done");

  unsigned PartSize = DL.getTypeStoreSize(EltTy);
  Align PartSrcAlign(commonAlignment(SrcAlign, PartSize));
  Align PartDstAlign(commonAlignment(DstAlign, PartSize));

  // Initial comparison of n == 0 that lets us skip the loops altogether. Shared
  // between both backwards and forward copy clauses.
  ICmpInst *CompareN =
      new ICmpInst(OrigBB->getTerminator(), ICmpInst::ICMP_EQ, CopyLen,
                   ConstantInt::get(TypeOfCopyLen, 0), "compare_n_to_0");

  // Copying backwards.
  BasicBlock *LoopBB =
    BasicBlock::Create(F->getContext(), "copy_backwards_loop", F, CopyForwardBB);
  IRBuilder<> LoopBuilder(LoopBB);

  PHINode *LoopPhi = LoopBuilder.CreatePHI(TypeOfCopyLen, 0);
  Value *IndexPtr = LoopBuilder.CreateSub(
      LoopPhi, ConstantInt::get(TypeOfCopyLen, 1), "index_ptr");
  Value *Element = LoopBuilder.CreateAlignedLoad(
      EltTy, LoopBuilder.CreateInBoundsGEP(EltTy, SrcAddr, IndexPtr),
      PartSrcAlign, "element");
  LoopBuilder.CreateAlignedStore(
      Element, LoopBuilder.CreateInBoundsGEP(EltTy, DstAddr, IndexPtr),
      PartDstAlign);
  LoopBuilder.CreateCondBr(
      LoopBuilder.CreateICmpEQ(IndexPtr, ConstantInt::get(TypeOfCopyLen, 0)),
      ExitBB, LoopBB);
  LoopPhi->addIncoming(IndexPtr, LoopBB);
  LoopPhi->addIncoming(CopyLen, CopyBackwardsBB);
  BranchInst::Create(ExitBB, LoopBB, CompareN, ThenTerm);
  ThenTerm->eraseFromParent();

  // Copying forward.
  BasicBlock *FwdLoopBB =
    BasicBlock::Create(F->getContext(), "copy_forward_loop", F, ExitBB);
  IRBuilder<> FwdLoopBuilder(FwdLoopBB);
  PHINode *FwdCopyPhi = FwdLoopBuilder.CreatePHI(TypeOfCopyLen, 0, "index_ptr");
  Value *SrcGEP = FwdLoopBuilder.CreateInBoundsGEP(EltTy, SrcAddr, FwdCopyPhi);
  Value *FwdElement =
      FwdLoopBuilder.CreateAlignedLoad(EltTy, SrcGEP, PartSrcAlign, "element");
  Value *DstGEP = FwdLoopBuilder.CreateInBoundsGEP(EltTy, DstAddr, FwdCopyPhi);
  FwdLoopBuilder.CreateAlignedStore(FwdElement, DstGEP, PartDstAlign);
  Value *FwdIndexPtr = FwdLoopBuilder.CreateAdd(
      FwdCopyPhi, ConstantInt::get(TypeOfCopyLen, 1), "index_increment");
  FwdLoopBuilder.CreateCondBr(FwdLoopBuilder.CreateICmpEQ(FwdIndexPtr, CopyLen),
                              ExitBB, FwdLoopBB);
  FwdCopyPhi->addIncoming(FwdIndexPtr, FwdLoopBB);
  FwdCopyPhi->addIncoming(ConstantInt::get(TypeOfCopyLen, 0), CopyForwardBB);

  BranchInst::Create(ExitBB, FwdLoopBB, CompareN, ElseTerm);
  ElseTerm->eraseFromParent();
}

static void createMemSetLoop(Instruction *InsertBefore, Value *DstAddr,
                             Value *CopyLen, Value *SetValue, Align DstAlign,
                             bool IsVolatile) {
  Type *TypeOfCopyLen = CopyLen->getType();
  BasicBlock *OrigBB = InsertBefore->getParent();
  Function *F = OrigBB->getParent();
  const DataLayout &DL = F->getParent()->getDataLayout();
  BasicBlock *NewBB =
      OrigBB->splitBasicBlock(InsertBefore, "split");
  BasicBlock *LoopBB
    = BasicBlock::Create(F->getContext(), "loadstoreloop", F, NewBB);

  IRBuilder<> Builder(OrigBB->getTerminator());

  // Cast pointer to the type of value getting stored
  unsigned dstAS = cast<PointerType>(DstAddr->getType())->getAddressSpace();
  DstAddr = Builder.CreateBitCast(DstAddr,
                                  PointerType::get(SetValue->getType(), dstAS));

  Builder.CreateCondBr(
      Builder.CreateICmpEQ(ConstantInt::get(TypeOfCopyLen, 0), CopyLen), NewBB,
      LoopBB);
  OrigBB->getTerminator()->eraseFromParent();

  unsigned PartSize = DL.getTypeStoreSize(SetValue->getType());
  Align PartAlign(commonAlignment(DstAlign, PartSize));

  IRBuilder<> LoopBuilder(LoopBB);
  PHINode *LoopIndex = LoopBuilder.CreatePHI(TypeOfCopyLen, 0);
  LoopIndex->addIncoming(ConstantInt::get(TypeOfCopyLen, 0), OrigBB);

  LoopBuilder.CreateAlignedStore(
      SetValue,
      LoopBuilder.CreateInBoundsGEP(SetValue->getType(), DstAddr, LoopIndex),
      PartAlign, IsVolatile);

  Value *NewIndex =
      LoopBuilder.CreateAdd(LoopIndex, ConstantInt::get(TypeOfCopyLen, 1));
  LoopIndex->addIncoming(NewIndex, LoopBB);

  LoopBuilder.CreateCondBr(LoopBuilder.CreateICmpULT(NewIndex, CopyLen), LoopBB,
                           NewBB);
}

template <typename T>
static bool canOverlap(MemTransferBase<T> *Memcpy, ScalarEvolution *SE) {
  if (SE) {
    auto *SrcSCEV = SE->getSCEV(Memcpy->getRawSource());
    auto *DestSCEV = SE->getSCEV(Memcpy->getRawDest());
    if (SE->isKnownPredicateAt(CmpInst::ICMP_NE, SrcSCEV, DestSCEV, Memcpy))
      return false;
  }
  return true;
}

void llvm::expandMemCpyAsLoop(MemCpyInst *Memcpy,
                              const TargetTransformInfo &TTI,
                              ScalarEvolution *SE) {
  bool CanOverlap = canOverlap(Memcpy, SE);
  if (ConstantInt *CI = dyn_cast<ConstantInt>(Memcpy->getLength())) {
    createMemCpyLoopKnownSize(
        /* InsertBefore */ Memcpy,
        /* SrcAddr */ Memcpy->getRawSource(),
        /* DstAddr */ Memcpy->getRawDest(),
        /* CopyLen */ CI,
        /* SrcAlign */ Memcpy->getSourceAlign().valueOrOne(),
        /* DestAlign */ Memcpy->getDestAlign().valueOrOne(),
        /* SrcIsVolatile */ Memcpy->isVolatile(),
        /* DstIsVolatile */ Memcpy->isVolatile(),
        /* CanOverlap */ CanOverlap,
        /* TargetTransformInfo */ TTI);
  } else {
    createMemCpyLoopUnknownSize(
        /* InsertBefore */ Memcpy,
        /* SrcAddr */ Memcpy->getRawSource(),
        /* DstAddr */ Memcpy->getRawDest(),
        /* CopyLen */ Memcpy->getLength(),
        /* SrcAlign */ Memcpy->getSourceAlign().valueOrOne(),
        /* DestAlign */ Memcpy->getDestAlign().valueOrOne(),
        /* SrcIsVolatile */ Memcpy->isVolatile(),
        /* DstIsVolatile */ Memcpy->isVolatile(),
        /* CanOverlap */ CanOverlap,
        /* TargetTransformInfo */ TTI);
  }
}

bool llvm::expandMemMoveAsLoop(MemMoveInst *Memmove,
                               const TargetTransformInfo &TTI) {
  Value *CopyLen = Memmove->getLength();
  Value *SrcAddr = Memmove->getRawSource();
  Value *DstAddr = Memmove->getRawDest();
  Align SrcAlign = Memmove->getSourceAlign().valueOrOne();
  Align DstAlign = Memmove->getDestAlign().valueOrOne();
  bool SrcIsVolatile = Memmove->isVolatile();
  bool DstIsVolatile = SrcIsVolatile;
  IRBuilder<> CastBuilder(Memmove);

  unsigned SrcAS = SrcAddr->getType()->getPointerAddressSpace();
  unsigned DstAS = DstAddr->getType()->getPointerAddressSpace();
  if (SrcAS != DstAS) {
    if (!TTI.addrspacesMayAlias(SrcAS, DstAS)) {
      // We may not be able to emit a pointer comparison, but we don't have
      // to. Expand as memcpy.
      if (ConstantInt *CI = dyn_cast<ConstantInt>(CopyLen)) {
        createMemCpyLoopKnownSize(/*InsertBefore=*/Memmove, SrcAddr, DstAddr,
                                  CI, SrcAlign, DstAlign, SrcIsVolatile,
                                  DstIsVolatile,
                                  /*CanOverlap=*/false, TTI);
      } else {
        createMemCpyLoopUnknownSize(/*InsertBefore=*/Memmove, SrcAddr, DstAddr,
                                    CopyLen, SrcAlign, DstAlign, SrcIsVolatile,
                                    DstIsVolatile,
                                    /*CanOverlap=*/false, TTI);
      }

      return true;
    }

    if (TTI.isValidAddrSpaceCast(DstAS, SrcAS))
      DstAddr = CastBuilder.CreateAddrSpaceCast(DstAddr, SrcAddr->getType());
    else if (TTI.isValidAddrSpaceCast(SrcAS, DstAS))
      SrcAddr = CastBuilder.CreateAddrSpaceCast(SrcAddr, DstAddr->getType());
    else {
      // We don't know generically if it's legal to introduce an
      // addrspacecast. We need to know either if it's legal to insert an
      // addrspacecast, or if the address spaces cannot alias.
      LLVM_DEBUG(
          dbgs() << "Do not know how to expand memmove between different "
                    "address spaces\n");
      return false;
    }
  }

  createMemMoveLoop(
      /*InsertBefore=*/Memmove, SrcAddr, DstAddr, CopyLen, SrcAlign, DstAlign,
      SrcIsVolatile, DstIsVolatile, TTI);
  return true;
}

void llvm::expandMemSetAsLoop(MemSetInst *Memset) {
  createMemSetLoop(/* InsertBefore */ Memset,
                   /* DstAddr */ Memset->getRawDest(),
                   /* CopyLen */ Memset->getLength(),
                   /* SetValue */ Memset->getValue(),
                   /* Alignment */ Memset->getDestAlign().valueOrOne(),
                   Memset->isVolatile());
}

void llvm::expandAtomicMemCpyAsLoop(AtomicMemCpyInst *AtomicMemcpy,
                                    const TargetTransformInfo &TTI,
                                    ScalarEvolution *SE) {
  if (ConstantInt *CI = dyn_cast<ConstantInt>(AtomicMemcpy->getLength())) {
    createMemCpyLoopKnownSize(
        /* InsertBefore */ AtomicMemcpy,
        /* SrcAddr */ AtomicMemcpy->getRawSource(),
        /* DstAddr */ AtomicMemcpy->getRawDest(),
        /* CopyLen */ CI,
        /* SrcAlign */ AtomicMemcpy->getSourceAlign().valueOrOne(),
        /* DestAlign */ AtomicMemcpy->getDestAlign().valueOrOne(),
        /* SrcIsVolatile */ AtomicMemcpy->isVolatile(),
        /* DstIsVolatile */ AtomicMemcpy->isVolatile(),
        /* CanOverlap */ false, // SrcAddr & DstAddr may not overlap by spec.
        /* TargetTransformInfo */ TTI,
        /* AtomicCpySize */ AtomicMemcpy->getElementSizeInBytes());
  } else {
    createMemCpyLoopUnknownSize(
        /* InsertBefore */ AtomicMemcpy,
        /* SrcAddr */ AtomicMemcpy->getRawSource(),
        /* DstAddr */ AtomicMemcpy->getRawDest(),
        /* CopyLen */ AtomicMemcpy->getLength(),
        /* SrcAlign */ AtomicMemcpy->getSourceAlign().valueOrOne(),
        /* DestAlign */ AtomicMemcpy->getDestAlign().valueOrOne(),
        /* SrcIsVolatile */ AtomicMemcpy->isVolatile(),
        /* DstIsVolatile */ AtomicMemcpy->isVolatile(),
        /* CanOverlap */ false, // SrcAddr & DstAddr may not overlap by spec.
        /* TargetTransformInfo */ TTI,
        /* AtomicCpySize */ AtomicMemcpy->getElementSizeInBytes());
  }
}
