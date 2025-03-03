; RUN: llvm-mc -triple eravm -filetype=asm %s -o - | FileCheck %s

  .text
foo:

; mnemonics
  mul       r1, r2, r3, r4

; modifiers (all combinations of "!" and ".condition", ordered exactly like this, ".s" is not supported)
  mul       r1, r2, r3, r4
  mul!      r1, r2, r3, r4
  mul.lt    r1, r2, r3, r4
  mul!.lt   r1, r2, r3, r4

; operands (6 src modes x 4 dst modes)
  mul       r1, r2, r3, r4
  mul       42, r2, r3, r4
  mul       stack[r1 + 1], r2, r3, r4
  mul       stack-[r1 + 1], r2, r3, r4
  mul       stack-=[r1 + 1], r2, r3, r4
  mul       code[r1 + 1], r2, r3, r4
  mul       r1, r2, stack[r3 + 1], r4
  mul       42, r2, stack[r3 + 1], r4
  mul       stack[r1 + 1], r2, stack[r3 + 1], r4
  mul       stack-[r1 + 1], r2, stack[r3 + 1], r4
  mul       stack-=[r1 + 1], r2, stack[r3 + 1], r4
  mul       code[r1 + 1], r2, stack[r3 + 1], r4
  mul       r1, r2, stack-[r3 + 1], r4
  mul       42, r2, stack-[r3 + 1], r4
  mul       stack[r1 + 1], r2, stack-[r3 + 1], r4
  mul       stack-[r1 + 1], r2, stack-[r3 + 1], r4
  mul       stack-=[r1 + 1], r2, stack-[r3 + 1], r4
  mul       code[r1 + 1], r2, stack-[r3 + 1], r4
  mul       r1, r2, stack+=[r3 + 1], r4
  mul       42, r2, stack+=[r3 + 1], r4
  mul       stack[r1 + 1], r2, stack+=[r3 + 1], r4
  mul       stack-[r1 + 1], r2, stack+=[r3 + 1], r4
  mul       stack-=[r1 + 1], r2, stack+=[r3 + 1], r4
  mul       code[r1 + 1], r2, stack+=[r3 + 1], r4


; COM: Autogenerated checks below, see README.md.
; CHECK:  .text
; CHECK:foo:

; CHECK:  mul  r1, r2, r3, r4

; CHECK:  mul  r1, r2, r3, r4
; CHECK:  mul! r1, r2, r3, r4
; CHECK:  mul.lt       r1, r2, r3, r4
; CHECK:  mul!.lt      r1, r2, r3, r4

; CHECK:  mul  r1, r2, r3, r4
; CHECK:  mul  42, r2, r3, r4
; CHECK:  mul  stack[1 + r1], r2, r3, r4
; CHECK:  mul  stack-[1 + r1], r2, r3, r4
; CHECK:  mul  stack-=[1 + r1], r2, r3, r4
; CHECK:  mul  code[r1+1], r2, r3, r4
; CHECK:  mul  r1, r2, stack[1 + r3], r4
; CHECK:  mul  42, r2, stack[1 + r3], r4
; CHECK:  mul  stack[1 + r1], r2, stack[1 + r3], r4
; CHECK:  mul  stack-[1 + r1], r2, stack[1 + r3], r4
; CHECK:  mul  stack-=[1 + r1], r2, stack[1 + r3], r4
; CHECK:  mul  code[r1+1], r2, stack[1 + r3], r4
; CHECK:  mul  r1, r2, stack-[1 + r3], r4
; CHECK:  mul  42, r2, stack-[1 + r3], r4
; CHECK:  mul  stack[1 + r1], r2, stack-[1 + r3], r4
; CHECK:  mul  stack-[1 + r1], r2, stack-[1 + r3], r4
; CHECK:  mul  stack-=[1 + r1], r2, stack-[1 + r3], r4
; CHECK:  mul  code[r1+1], r2, stack-[1 + r3], r4
; CHECK:  mul  r1, r2, stack+=[1 + r3], r4
; CHECK:  mul  42, r2, stack+=[1 + r3], r4
; CHECK:  mul  stack[1 + r1], r2, stack+=[1 + r3], r4
; CHECK:  mul  stack-[1 + r1], r2, stack+=[1 + r3], r4
; CHECK:  mul  stack-=[1 + r1], r2, stack+=[1 + r3], r4
; CHECK:  mul  code[r1+1], r2, stack+=[1 + r3], r4
