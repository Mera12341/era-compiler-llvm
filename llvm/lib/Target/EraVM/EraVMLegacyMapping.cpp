//===-- EraVMLegacyLowering.cpp - EraVM Legacy Instruction Format Migration pass -----------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This pass migrates legacy generated instructions to the new instruction format
//
//===----------------------------------------------------------------------===//

#include "EraVM.h"

#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/TargetInstrInfo.h"
#include "llvm/Support/Debug.h"

#include "EraVMSubtarget.h"

using namespace llvm;

#define DEBUG_TYPE "eravm-legacy-mapping"
#define ERAVM_LEGACY_MAPPING_NAME "EraVM legacy mapping"

namespace {

class EraVMLegacyMapping : public MachineFunctionPass {
public:
  static char ID;
  EraVMLegacyMapping() : MachineFunctionPass(ID) {
    initializeEraVMLegacyMappingPass(*PassRegistry::getPassRegistry());
  }

  bool runOnMachineFunction(MachineFunction &MF) override;

  StringRef getPassName() const override { return ERAVM_LEGACY_MAPPING_NAME; }

private:
  const TargetInstrInfo *TII{};
};

char EraVMLegacyMapping::ID = 0;

} // namespace

INITIALIZE_PASS(EraVMLegacyMapping, DEBUG_TYPE, ERAVM_LEGACY_MAPPING_NAME,
                false, false)

bool EraVMLegacyMapping::runOnMachineFunction(MachineFunction &MF) {
  LLVM_DEBUG(
      dbgs() << "********** EraVM MAP LEGACY INSTRUCTION TO NEW INSTRUCTION FORMAT **********\n"
             << "********** Function: " << MF.getName() << '\n');

  bool Changed = false;
  TII = MF.getSubtarget<EraVMSubtarget>().getInstrInfo();
  assert(TII && "TargetInstrInfo must be a valid object");

  for (MachineBasicBlock &MBB : MF)
    for (MachineInstr &MI : MBB) {
      auto mappedOpcode = llvm::EraVM::getNewOpcode(MI.getOpcode());
      if (mappedOpcode == -1) {
        continue;
      }

      MI.setDesc(TII->get(mappedOpcode));
      // MI.addOperand(MachineOperand::CreateImm(0));
      Changed = true;
    }

  return Changed;
}

/// createEraVMLegacyMappingPass - returns an instance of the pseudo
/// instruction expansion pass.
FunctionPass *llvm::createEraVMLegacyMappingPass() {
  return new EraVMLegacyMapping();
}
