; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 2
; RUN: llc < %s | FileCheck %s

target datalayout = "E-p:256:256-i256:256:256-S32-a:256:256"
target triple = "eravm"

declare { i256, i1 } @llvm.uadd.with.overflow.i256(i256, i256)
declare { i256, i1 } @llvm.usub.with.overflow.i256(i256, i256)
declare { i256, i1 } @llvm.umul.with.overflow.i256(i256, i256)

@val = addrspace(4) global i256 42
@val2 = addrspace(4) global i256 17

define i256 @add_test(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r3
; CHECK-NEXT:    add.lt r1, r0, r2
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %a, i256 %b
  ret i256 %selected
}

define i256 @add_test_1(i256 %a, i256 %b, i256 %c, i256 %x, i256 %y, i256 %z) {
; CHECK-LABEL: add_test_1:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r4, r5, r6
; CHECK-NEXT:    add r2, r0, r6
; CHECK-NEXT:    add.lt r1, r0, r6
; CHECK-NEXT:    add r4, r5, r4
; CHECK-NEXT:    sub! r1, r2, r1
; CHECK-NEXT:    add.lt r3, r0, r4
; CHECK-NEXT:    add r4, r6, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %val = extractvalue {i256, i1} %res1, 0
  %cmp = icmp uge i256 %a, %b
  %input1 = select i1 %cmp, i256 %val, i256 %c
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %a, i256 %b
  %sum = add i256 %input1, %selected
  ret i256 %sum
}

define i256 @add_test_2(i256 %a, i256 %b, i256 %c, i256 %x, i256 %y, i256 %z) {
; CHECK-LABEL: add_test_2:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add r4, r5, r7
; CHECK-NEXT:    sub! r1, r2, r1
; CHECK-NEXT:    add.lt r3, r0, r7
; CHECK-NEXT:    add! r4, r5, r1
; CHECK-NEXT:    add.lt r7, r0, r2
; CHECK-NEXT:    add r6, r2, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %val = extractvalue {i256, i1} %res1, 0
  %cmp = icmp uge i256 %a, %b
  %input1 = select i1 %cmp, i256 %val, i256 %c
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %input1, i256 %b
  %sum = add i256 %z, %selected
  ret i256 %sum
}

define i256 @add_test_large_imm(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_large_imm:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! @CPI3_0[0], r3, r3
; CHECK-NEXT:    add.lt r1, r0, r2
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 26959946660873538059280334323183841250350249843923952699046031785980)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %a, i256 %b
  ret i256 %selected
}

define i256 @add_test_crr(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_crr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r2
; CHECK-NEXT:    add @val[0], r0, r2
; CHECK-NEXT:    add.lt r1, r0, r2
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %const = load i256, i256 addrspace(4)* @val
  %selected = select i1 %overflow, i256 %a, i256 %const
  ret i256 %selected
}

define i256 @add_test_crr_zero_cp(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_crr_zero_cp:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add r0, r0, r1
; CHECK-NEXT:    add.lt @CPI5_0[0], r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 123456789, i256 0
  ret i256 %selected
}

define i256 @add_test_crr_cp(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_crr_cp:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add r0, r0, r1
; CHECK-NEXT:    add.lt @CPI6_0[0], r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 123456789, i256 0
  ret i256 %selected
}

define i256 @add_test_srr(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_srr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r2
; CHECK-NEXT:    add.lt stack-[1], r0, r1
; CHECK-NEXT:    ret
entry:
  %data = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %val = load i256, i256* %data
  %selected = select i1 %overflow, i256 %val, i256 %a
  ret i256 %selected
}

define i256 @add_test_rir(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_rir:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r2
; CHECK-NEXT:    add 42, r0, r2
; CHECK-NEXT:    add.lt r1, r0, r2
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %a, i256 42
  ret i256 %selected
}

define i256 @add_test_iir(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_iir:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add 42, r0, r1
; CHECK-NEXT:    add.lt 17, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 17, i256 42
  ret i256 %selected
}

define i256 @add_test_cir(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_cir:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add 42, r0, r1
; CHECK-NEXT:    add.lt @val[0], r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %const = load i256, i256 addrspace(4)* @val
  %selected = select i1 %overflow, i256 %const, i256 42
  ret i256 %selected
}

define i256 @add_test_cir_cp(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_cir_cp:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add 42, r0, r1
; CHECK-NEXT:    add.lt @CPI11_0[0], r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 123456789, i256 42
  ret i256 %selected
}

define i256 @add_test_sir(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_sir:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add 42, r0, r1
; CHECK-NEXT:    add.lt stack-[1], r0, r1
; CHECK-NEXT:    ret
entry:
  %data = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %val = load i256, i256* %data
  %selected = select i1 %overflow, i256 %val, i256 42
  ret i256 %selected
}

define i256 @add_test_rcr(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_rcr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r2
; CHECK-NEXT:    add @val[0], r0, r2
; CHECK-NEXT:    add.lt r1, r0, r2
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %const = load i256, i256 addrspace(4)* @val
  %selected = select i1 %overflow, i256 %a, i256 %const
  ret i256 %selected
}

define i256 @add_test_rcr_zero_cp(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_rcr_zero_cp:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add @CPI14_0[0], r0, r1
; CHECK-NEXT:    add.lt r0, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 0, i256 123456789
  ret i256 %selected
}

define i256 @add_test_rcr_cp(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_rcr_cp:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r2
; CHECK-NEXT:    add @CPI15_0[0], r0, r2
; CHECK-NEXT:    add.lt r1, r0, r2
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %a, i256 123456789
  ret i256 %selected
}

define i256 @add_test_icr(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_icr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add @val[0], r0, r1
; CHECK-NEXT:    add.lt 42, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %const = load i256, i256 addrspace(4)* @val
  %selected = select i1 %overflow, i256 42, i256 %const
  ret i256 %selected
}

define i256 @add_test_icr_cp(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_icr_cp:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add @CPI17_0[0], r0, r1
; CHECK-NEXT:    add.lt 42, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 42, i256 123456789
  ret i256 %selected
}

define i256 @add_test_ccr_cl_cl(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_ccr_cl_cl:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add @val[0], r0, r1
; CHECK-NEXT:    add.lt @val2[0], r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %const = load i256, i256 addrspace(4)* @val
  %const2 = load i256, i256 addrspace(4)* @val2
  %selected = select i1 %overflow, i256 %const2, i256 %const
  ret i256 %selected
}

define i256 @add_test_ccr_cl_cp(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_ccr_cl_cp:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add @CPI19_0[0], r0, r1
; CHECK-NEXT:    add.lt @val[0], r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %const = load i256, i256 addrspace(4)* @val
  %selected = select i1 %overflow, i256 %const, i256 12345678
  ret i256 %selected
}

define i256 @add_test_ccr_cp_cl(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_ccr_cp_cl:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add @val[0], r0, r1
; CHECK-NEXT:    add.lt @CPI20_0[0], r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %const = load i256, i256 addrspace(4)* @val
  %selected = select i1 %overflow, i256 12345678, i256 %const
  ret i256 %selected
}

define i256 @add_test_ccr_cp_cp(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_ccr_cp_cp:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add @CPI21_1[0], r0, r1
; CHECK-NEXT:    add.lt @CPI21_0[0], r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 12345678, i256 123456789
  ret i256 %selected
}

define i256 @add_test_scr(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_scr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add @val[0], r0, r1
; CHECK-NEXT:    add.lt stack-[1], r0, r1
; CHECK-NEXT:    ret
entry:
  %ptr = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %const = load i256, i256 addrspace(4)* @val
  %val2 = load i256, i256* %ptr
  %selected = select i1 %overflow, i256 %val2, i256 %const
  ret i256 %selected
}

define i256 @add_test_scr_cp(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_scr_cp:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add @CPI23_0[0], r0, r1
; CHECK-NEXT:    add.lt stack-[1], r0, r1
; CHECK-NEXT:    ret
entry:
  %ptr = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %val2 = load i256, i256* %ptr
  %selected = select i1 %overflow, i256 %val2, i256 123456789
  ret i256 %selected
}

define i256 @add_test_rsr(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_rsr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r2
; CHECK-NEXT:    add stack-[1], r0, r2
; CHECK-NEXT:    add.lt r1, r0, r2
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %data = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %val = load i256, i256* %data
  %selected = select i1 %overflow, i256 %a, i256 %val
  ret i256 %selected
}

define i256 @add_test_isr(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_isr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add stack-[1], r0, r1
; CHECK-NEXT:    add.lt 42, r0, r1
; CHECK-NEXT:    ret
entry:
  %data = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %val = load i256, i256* %data
  %selected = select i1 %overflow, i256 42, i256 %val
  ret i256 %selected
}

define i256 @add_test_csr(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_csr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add stack-[1], r0, r1
; CHECK-NEXT:    add.lt @val[0], r0, r1
; CHECK-NEXT:    ret
entry:
  %data = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %val = load i256, i256* %data
  %const = load i256, i256 addrspace(4)* @val
  %selected = select i1 %overflow, i256 %const, i256 %val
  ret i256 %selected
}

define i256 @add_test_csr_cp(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_csr_cp:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add stack-[1], r0, r1
; CHECK-NEXT:    add.lt @CPI27_0[0], r0, r1
; CHECK-NEXT:    ret
entry:
  %data = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %val = load i256, i256* %data
  %selected = select i1 %overflow, i256 123456789, i256 %val
  ret i256 %selected
}

define i256 @add_test_ssr(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_ssr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[2 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add stack-[2], r0, r1
; CHECK-NEXT:    add.lt stack-[1], r0, r1
; CHECK-NEXT:    ret
entry:
  %data1 = alloca i256
  %data2 = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %val = load i256, i256* %data1
  %val2 = load i256, i256* %data2
  %selected = select i1 %overflow, i256 %val2, i256 %val
  ret i256 %selected
}

define i256 @add_test_rrs(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_rrs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r3
; CHECK-NEXT:    add.lt r1, r0, r2
; CHECK-NEXT:    add r2, r0, stack-[1]
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %a, i256 %b
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_irs(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_irs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    add! r3, r4, r2
; CHECK-NEXT:    add.lt 42, r0, r1
; CHECK-NEXT:    add r1, r0, stack-[1]
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 42, i256 %b
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_crs(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_crs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    add! r3, r4, r2
; CHECK-NEXT:    add.lt @val[0], r0, r1
; CHECK-NEXT:    add r1, r0, stack-[1]
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %const = load i256, i256 addrspace(4)* @val
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %const, i256 %b
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_srs(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_srs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[2 + r0]
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    add! r3, r4, r2
; CHECK-NEXT:    add.lt stack-[1], r0, r1
; CHECK-NEXT:    add r1, r0, stack-[2]
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %data = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %val = load i256, i256* %data
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %val, i256 %b
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_ris(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_ris:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r2
; CHECK-NEXT:    add 42, r0, r2
; CHECK-NEXT:    add.lt r1, r0, r2
; CHECK-NEXT:    add r2, r0, stack-[1]
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %a, i256 42
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_iis(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_iis:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add 42, r0, r1
; CHECK-NEXT:    add.lt 17, r0, r1
; CHECK-NEXT:    add r1, r0, stack-[1]
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 17, i256 42
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_cis(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_cis:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add 42, r0, r1
; CHECK-NEXT:    add.lt @val[0], r0, r1
; CHECK-NEXT:    add r1, r0, stack-[1]
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %const = load i256, i256 addrspace(4)* @val
  %selected = select i1 %overflow, i256 %const, i256 42
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_sis(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_sis:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[2 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add 42, r0, r1
; CHECK-NEXT:    add.lt stack-[1], r0, r1
; CHECK-NEXT:    add r1, r0, stack-[2]
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %data = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %val = load i256, i256* %data
  %selected = select i1 %overflow, i256 %val, i256 42
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_rcs(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_rcs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r2
; CHECK-NEXT:    add @val[0], r0, r2
; CHECK-NEXT:    add.lt r1, r0, r2
; CHECK-NEXT:    add r2, r0, stack-[1]
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %const = load i256, i256 addrspace(4)* @val
  %selected = select i1 %overflow, i256 %a, i256 %const
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_ics(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_ics:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add @val[0], r0, r1
; CHECK-NEXT:    add.lt 42, r0, r1
; CHECK-NEXT:    add r1, r0, stack-[1]
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %const = load i256, i256 addrspace(4)* @val
  %selected = select i1 %overflow, i256 42, i256 %const
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_ccs(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_ccs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add @val[0], r0, r1
; CHECK-NEXT:    add.lt @val2[0], r0, r1
; CHECK-NEXT:    add r1, r0, stack-[1]
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %const = load i256, i256 addrspace(4)* @val
  %const2 = load i256, i256 addrspace(4)* @val2
  %selected = select i1 %overflow, i256 %const2, i256 %const
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_scs(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_scs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[2 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add @val[0], r0, r1
; CHECK-NEXT:    add.lt stack-[1], r0, r1
; CHECK-NEXT:    add r1, r0, stack-[2]
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %ptr = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %const = load i256, i256 addrspace(4)* @val
  %val2 = load i256, i256* %ptr
  %selected = select i1 %overflow, i256 %val2, i256 %const
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_rss(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_rss:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[2 + r0]
; CHECK-NEXT:    add! r3, r4, r2
; CHECK-NEXT:    add stack-[1], r0, r2
; CHECK-NEXT:    add.lt r1, r0, r2
; CHECK-NEXT:    add r2, r0, stack-[2]
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %data = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %val = load i256, i256* %data
  %selected = select i1 %overflow, i256 %a, i256 %val
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_iss(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_iss:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[2 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add stack-[1], r0, r1
; CHECK-NEXT:    add.lt 42, r0, r1
; CHECK-NEXT:    add r1, r0, stack-[2]
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %data = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %val = load i256, i256* %data
  %selected = select i1 %overflow, i256 42, i256 %val
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_css(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_css:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[2 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add stack-[1], r0, r1
; CHECK-NEXT:    add.lt @val[0], r0, r1
; CHECK-NEXT:    add r1, r0, stack-[2]
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %data = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %val = load i256, i256* %data
  %const = load i256, i256 addrspace(4)* @val
  %selected = select i1 %overflow, i256 %const, i256 %val
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @add_test_sss(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: add_test_sss:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[3 + r0]
; CHECK-NEXT:    add! r3, r4, r1
; CHECK-NEXT:    add stack-[2], r0, r1
; CHECK-NEXT:    add.lt stack-[1], r0, r1
; CHECK-NEXT:    add r1, r0, stack-[3]
; CHECK-NEXT:    ret
entry:
  %resptr = alloca i256
  %data1 = alloca i256
  %data2 = alloca i256
  %res1 = call {i256, i1} @llvm.uadd.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %val = load i256, i256* %data1
  %val2 = load i256, i256* %data2
  %selected = select i1 %overflow, i256 %val2, i256 %val
  store i256 %selected, i256* %resptr
  ret i256 %selected
}

define i256 @sub_test(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: sub_test:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sub! r3, r4, r3
; CHECK-NEXT:    add.ge r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.usub.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %a, i256 %b
  ret i256 %selected
}

define i256 @sub_test_large_imm(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: sub_test_large_imm:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sub.s! @CPI46_0[0], r3, r3
; CHECK-NEXT:    add.ge r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.usub.with.overflow.i256(i256 %x, i256 26959946660873538059280334323183841250350249843923952699046031785980)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %a, i256 %b
  ret i256 %selected
}

define i256 @sub_test_large_immx(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: sub_test_large_immx:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sub! @CPI47_0[0], r1, r3
; CHECK-NEXT:    add.ge r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.usub.with.overflow.i256(i256 26959946660873538059280334323183841250350249843923952699046031785980, i256 %a)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %a, i256 %b
  ret i256 %selected
}

define i256 @mul_test(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: mul_test:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    mul! r3, r4, r3, r4
; CHECK-NEXT:    add.lt r1, r0, r2
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.umul.with.overflow.i256(i256 %x, i256 %y)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %a, i256 %b
  ret i256 %selected
}

define i256 @mul_test_large_imm(i256 %a, i256 %b, i256 %x, i256 %y) {
; CHECK-LABEL: mul_test_large_imm:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    mul! @CPI49_0[0], r3, r3, r4
; CHECK-NEXT:    add.lt r1, r0, r2
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
entry:
  %res1 = call {i256, i1} @llvm.umul.with.overflow.i256(i256 %x, i256 26959946660873538059280334323183841250350249843923952699046031785980)
  %overflow = extractvalue {i256, i1} %res1, 1
  %selected = select i1 %overflow, i256 %a, i256 %b
  ret i256 %selected
}
