; RUN: llc < %s | FileCheck %s

target datalayout = "E-p:256:256-i256:256:256-S32-a:256:256"
target triple = "eravm"

; CHECK-LABEL: .text

; CHECK-LABEL: materialize_zero
define i256 @materialize_zero() nounwind {
  ; CHECK: add r0, r0, r1
  ret i256 0
}

; CHECK-LABEL: materialize_small_imm
define i256 @materialize_small_imm() nounwind {
  ; CHECK: add 65535, r0, r1
  ret i256 65535
}

; CHECK-LABEL: materialize_big_imm
define i256 @materialize_big_imm() nounwind {
  ; CHECK: add @CPI{{[0-9]}}_0[0], r0, r1
  ret i256 65536
}

; CHECK-LABEL: materialize_negative_imm
define i256 @materialize_negative_imm(i256 %par) nounwind {
  ; CHECK: sub.s 1, r0, r1
  ret i256 -1
}

; CHECK-LABEL: materialize_negative_imm_2
define i256 @materialize_negative_imm_2(i256 %par) nounwind {
  ; CHECK: sub.s 32767, r0, r1
  ret i256 -32767
}

; CHECK-LABEL: materialize_negative_imm_3
define i256 @materialize_negative_imm_3(i256 %par) nounwind {
  ; CHECK: sub.s 65535, r0, r1
  ret i256 -65535
}

; CHECK-LABEL: materialize_smallimm_in_operation
define i256 @materialize_smallimm_in_operation(i256 %par) nounwind {
  ; CHECK: add 42, r1, r1
  %res = add i256 %par, 42
  ret i256 %res
}

; CHECK-LABEL: materialize_small_negimm_in_operation
define i256 @materialize_small_negimm_in_operation(i256 %par) nounwind {
  ; CHECK: sub.s 42, r1, r1
  %res = add i256 %par, -42
  ret i256 %res
}

; CHECK-LABEL: materialize_small_negimm_in_operation_2
define i256 @materialize_small_negimm_in_operation_2(i256 %par) nounwind {
  ; CHECK: sub.s 42, r1, r1
  %res = add i256 -42, %par
  ret i256 %res
}

; CHECK-LABEL: materialize_bigimm_in_and_operation
define i256 @materialize_bigimm_in_and_operation(i256 %par) nounwind {
  ; CHECK: and @CPI9_0[0], r1, r1
  %res = and i256 %par, -42
  ret i256 %res
}

; CHECK-LABEL: materialize_bigimm_in_xor_operation
define i256 @materialize_bigimm_in_xor_operation(i256 %par) nounwind {
  ; CHECK: xor @CPI10_0[0], r1, r1
  %res = xor i256 -42, %par
  ret i256 %res
}

; CHECK-LABEL: materialize_bigimm_in_sub_operation
define i256 @materialize_bigimm_in_sub_operation(i256 %par) nounwind {
  ; CHECK: add 42, r1, r1
  %res = sub i256 %par, -42
  ret i256 %res
}

; CHECK-LABEL: materialize_bigimm_in_sub_operation_2
define i256 @materialize_bigimm_in_sub_operation_2(i256 %par) nounwind {
  ; CHECK: sub @CPI12_0[0], r1, r1
  %res = sub i256 -42, %par
  ret i256 %res
}

; CHECK-LABEL: materialize_bigimm_in_sub_operation_2_minsize
define i256 @materialize_bigimm_in_sub_operation_2_minsize(i256 %par) nounwind minsize {
  ; CHECK: sub.s 42, r0, r2
  ; CHECK: sub r2, r1, r1
  %res = sub i256 -42, %par
  ret i256 %res
}

; CHECK-LABEL: materialize_bigimm_1
define i256 @materialize_bigimm_1(i256 %par) nounwind {
  ; CHECK: sub @CPI14_0[0], r1, r1
  %res = sub i256 12345678901234567890, %par
  ret i256 %res
}

; CHECK-LABEL: materialize_bigimm_2
define i256 @materialize_bigimm_2(i256 %par) nounwind {
  ; CHECK: sub @CPI15_0[0], r1, r1
  %res = sub i256 12345678901234567890, %par
  ret i256 %res
}

; The follow checks constant pool emitting

; CHECK-LABEL: .rodata

; materialize_big_imm
; CHECK-LABEL: CPI2_0:
; CHECK: .cell 65536

; materialize_bigimm_in_and_operation
; materialize_bigimm_in_xor_operation
; materialize_bigimm_in_sub_operation_2
; CHECK: CPI9_0:
; CHECK: CPI10_0:
; CHECK: CPI12_0:
; CHECK:  .cell -42

; materialize_negative_imm_3
; CHECK-NOT: CPI5_0:
; CHECK-NOT: .cell -65535
