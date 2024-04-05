//===-- EraVMInstPrinter.cpp - EraVM instr printer --------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This class prints an EraVM MCInst to a .s file.
//
//===----------------------------------------------------------------------===//

#include "EraVMInstPrinter.h"
#include "EraVM.h"
#include "EraVMMCTargetDesc.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FormattedStream.h"
using namespace llvm;

#define DEBUG_TYPE "asm-printer"

// Include the auto-generated portion of the assembly writer.
#define PRINT_ALIAS_INSTR
#include "EraVMGenAsmWriter.inc"

void EraVMInstPrinter::printInst(const MCInst *MI, uint64_t Address,
                                 StringRef Annot, const MCSubtargetInfo &STI,
                                 raw_ostream &O) {
  unsigned Opcode = MI->getOpcode();

  // Print some default versions here and there
  if (Opcode == EraVM::NEAR_CALL_default_unwind) {
    const MCOperand &Reg = MI->getOperand(0);

    O << "\tnear_call";
    printCCOperand(MI, 2, O);
    O << '\t';
    if (Reg.getReg() != EraVM::R0) {
      printOperand(MI, 0, O);
      O << ",\t";
    }
    printOperand(MI, 1, O);
    O << ",\t@DEFAULT_UNWIND_DEST";

    printAnnotation(O, Annot);
    return;
  }

  if (!printAliasInstr(MI, Address, O))
    printInstruction(MI, Address, O);
  printAnnotation(O, Annot);
}

void EraVMInstPrinter::printPCRelImmOperand(const MCInst *MI, unsigned OpNo,
                                            raw_ostream &O) {
  llvm_unreachable("Not implemented yet!");
}

void EraVMInstPrinter::printOperand(const MCInst *MI, unsigned OpNo,
                                    raw_ostream &O, const char *Modifier) {
  assert((Modifier == nullptr || Modifier[0] == 0) && "No modifiers supported");
  const MCOperand &Op = MI->getOperand(OpNo);
  if (Op.isReg()) {
    O << getRegisterName(Op.getReg());
  } else if (Op.isImm()) {
    O << Op.getImm();
  } else {
    assert(Op.isExpr() && "expected expression");
    Op.getExpr()->print(O, &MAI);
  }
}

void EraVMInstPrinter::printCCOperand(const MCInst *MI, unsigned OpNo,
                                      raw_ostream &O) {
  unsigned CC = MI->getOperand(OpNo).getImm();

  switch (CC) {
  default:
    llvm_unreachable("Unsupported CC code");
  case EraVMCC::COND_E:
    O << ".eq";
    break;
  case EraVMCC::COND_LT:
  case EraVMCC::COND_OF:
    O << ".lt";
    break;
  case EraVMCC::COND_GT:
    O << ".gt";
    break;
  case EraVMCC::COND_NE:
    O << ".ne";
    break;
  case EraVMCC::COND_GE:
    O << ".ge";
    break;
  case EraVMCC::COND_LE:
    O << ".le";
    break;
  case EraVMCC::COND_GTOrLT:
    O << ".gtlt";
    break;
  case EraVMCC::COND_NONE:
    break;
  }
}

void EraVMInstPrinter::printMemOperand(const MCInst *MI, unsigned OpNo,
                                       raw_ostream &O) {
  unsigned BaseReg = 0;
  const MCSymbol *Symbol = nullptr;
  int Addend = 0;
  EraVM::analyzeMCOperandsCode(*MI, OpNo, BaseReg, Symbol, Addend);

  if (Symbol)
    O << "@" << Symbol->getName();
  else
    O << "code";

  if (!BaseReg)
    BaseReg = EraVM::R0;

  if (BaseReg == EraVM::R0 && Addend == 0) {
    O << "[0]";
  } else {
    O << "[";
    O << getRegisterName(BaseReg);
    if (Addend) {
      O << (Addend < 0 ? "-" : "+");
      O << std::abs(Addend);
    }
    O << "]";
  }
}

template <bool IsInput>
void EraVMInstPrinter::printStackOperand(const MCInst *MI, unsigned OpNo,
                                         raw_ostream &O) {
  const MCOperand &Base1 = MI->getOperand(OpNo);
  const MCOperand &Base2 = MI->getOperand(OpNo + 1);
  const MCOperand &Disp = MI->getOperand(OpNo + 2);

  // FIXME
  bool ExprPermitted = !Base1.isReg();
  if (Base1.isReg()) {
    switch (Base1.getReg()) {
    case EraVM::SP:
      O << "stack-[";
      break;
    case EraVM::R0:
      O << (IsInput ? "stack-=[" : "stack+=[");
      break;
    default:
      llvm_unreachable("unexpected register operand");
    }
  } else {
    O << "stack[";
  }

  if (Base2.isReg()) {
    if (!ExprPermitted) {
      // stack-[disp + reg];
      // FIXME Check if any machine pass actually emits Disp < 0,
      //       as it was asserted before.
      assert(Disp.isImm() && Disp.getImm() >= 0); // don't support expr yet
      O << Disp.getImm() << " + " << getRegisterName(Base2.getReg());
    } else {
      // print absolute address in format stack[disp + reg]:
      if (Disp.isImm()) {
        // skip the sign if disp is 0
        if (Disp.getImm() > 0)
          O << Disp.getImm();
        else if (Disp.getImm() < 0)
          O << " - " << std::abs(Disp.getImm());

        // if disp is 0, don't print the + sign
        if (Disp.getImm() != 0)
          O << " + ";
      } else {
        assert(Disp.isExpr());
        Disp.getExpr()->print(O, &MAI);
        O << " + ";
      }
      O << getRegisterName(Base2.getReg());
    }
  } else {
    // Print displacement first
    if (Disp.isExpr())
      Disp.getExpr()->print(O, &MAI);
    else {
      assert(Disp.isImm() && "Expected immediate in displacement field");
      O << std::abs(Disp.getImm());
    }
  }
  O << "]";
}
