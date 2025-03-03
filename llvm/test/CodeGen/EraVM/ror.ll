; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc --disable-eravm-scalar-opt-passes < %s | FileCheck %s

target datalayout = "E-p:256:256-i256:256:256-S32-a:256:256"
target triple = "eravm"

@val = addrspace(4) global i256 42

define i256 @rorrrr(i256 %rs1, i256 %rs2) {
; CHECK-LABEL: rorrrr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    ror r1, r2, r1
; CHECK-NEXT:    ret
entry:
  %sub = sub i256 256, %rs2
  %lshr = lshr i256 %rs1, %rs2
  %shl = shl i256 %rs1, %sub
  %or = or i256 %shl, %lshr
  ret i256 %or
}

define i256 @rorirr(i256 %rs1) {
; CHECK-LABEL: rorirr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    ror 20, r1, r1
; CHECK-NEXT:    ret
entry:
  %sub = sub i256 256, %rs1
  %lshr = lshr i256 20, %rs1
  %shl = shl i256 20, %sub
  %or = or i256 %shl, %lshr
  ret i256 %or
}

define i256 @rorxrr(i256 %rs1) {
; CHECK-LABEL: rorxrr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    ror.s 20, r1, r1
; CHECK-NEXT:    ret
entry:
  %fshr = call i256 @llvm.fshr.i256(i256 %rs1, i256 %rs1, i256 20)
  ret i256 %fshr
}

define i256 @rorcrr(i256 %rs1) {
; CHECK-LABEL: rorcrr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    ror @val[0], r1, r1
; CHECK-NEXT:    ret
entry:
  %val = load i256, i256 addrspace(4)* @val
  %sub = sub i256 256, %rs1
  %lshr = lshr i256 %val, %rs1
  %shl = shl i256 %val, %sub
  %or = or i256 %shl, %lshr
  ret i256 %or
}

define i256 @roryrr(i256 %rs1) {
; CHECK-LABEL: roryrr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    ror.s @val[0], r1, r1
; CHECK-NEXT:    ret
entry:
  %val = load i256, i256 addrspace(4)* @val
  %sub = sub i256 256, %val
  %lshr = lshr i256 %rs1, %val
  %shl = shl i256 %rs1, %sub
  %or = or i256 %shl, %lshr
  ret i256 %or
}

define i256 @rorsrr(i256 %rs1) {
; CHECK-LABEL: rorsrr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    ror stack-[1], r1, r1
; CHECK-NEXT:    ret
entry:
  %valptr = alloca i256
  %val = load i256, i256* %valptr
  %sub = sub i256 256, %rs1
  %lshr = lshr i256 %val, %rs1
  %shl = shl i256 %val, %sub
  %or = or i256 %shl, %lshr
  ret i256 %or
}

define i256 @rorzrr(i256 %rs1) {
; CHECK-LABEL: rorzrr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    ror.s stack-[1], r1, r1
; CHECK-NEXT:    ret
entry:
  %valptr = alloca i256
  %val = load i256, i256* %valptr
  %sub = sub i256 256, %val
  %lshr = lshr i256 %rs1, %val
  %shl = shl i256 %rs1, %sub
  %or = or i256 %shl, %lshr
  ret i256 %or
}

define void @rorrrs(i256 %rs1, i256 %rs2) {
; CHECK-LABEL: rorrrs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    ror r1, r2, stack-[1]
; CHECK-NEXT:    ret
entry:
  %destptr = alloca i256
  %sub = sub i256 256, %rs2
  %lshr = lshr i256 %rs1, %rs2
  %shl = shl i256 %rs1, %sub
  %or = or i256 %shl, %lshr
  store i256 %or, i256* %destptr
  ret void
}

define void @rorirs(i256 %rs1) {
; CHECK-LABEL: rorirs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    ror 20, r1, stack-[1]
; CHECK-NEXT:    ret
entry:
  %destptr = alloca i256
  %sub = sub i256 256, %rs1
  %lshr = lshr i256 20, %rs1
  %shl = shl i256 20, %sub
  %or = or i256 %shl, %lshr
  store i256 %or, i256* %destptr
  ret void
}

define void @rorxrs(i256 %rs1) {
; CHECK-LABEL: rorxrs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    ror.s 20, r1, stack-[1]
; CHECK-NEXT:    ret
entry:
  %destptr = alloca i256
  %fshr = call i256 @llvm.fshr.i256(i256 %rs1, i256 %rs1, i256 20)
  store i256 %fshr, i256* %destptr
  ret void
}

define void @rorcrs(i256 %rs1) {
; CHECK-LABEL: rorcrs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    ror @val[0], r1, stack-[1]
; CHECK-NEXT:    ret
entry:
  %destptr = alloca i256
  %val = load i256, i256 addrspace(4)* @val
  %sub = sub i256 256, %rs1
  %lshr = lshr i256 %val, %rs1
  %shl = shl i256 %val, %sub
  %or = or i256 %shl, %lshr
  store i256 %or, i256* %destptr
  ret void
}

define void @roryrs(i256 %rs1) {
; CHECK-LABEL: roryrs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[1 + r0]
; CHECK-NEXT:    ror.s @val[0], r1, stack-[1]
; CHECK-NEXT:    ret
entry:
  %destptr = alloca i256
  %val = load i256, i256 addrspace(4)* @val
  %sub = sub i256 256, %val
  %lshr = lshr i256 %rs1, %val
  %shl = shl i256 %rs1, %sub
  %or = or i256 %shl, %lshr
  store i256 %or, i256* %destptr
  ret void
}

define void @rorsrs(i256 %rs1) {
; CHECK-LABEL: rorsrs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[2 + r0]
; CHECK-NEXT:    ror stack-[1], r1, stack-[2]
; CHECK-NEXT:    ret
entry:
  %destptr = alloca i256
  %valptr = alloca i256
  %val = load i256, i256* %valptr
  %sub = sub i256 256, %rs1
  %lshr = lshr i256 %val, %rs1
  %shl = shl i256 %val, %sub
  %or = or i256 %shl, %lshr
  store i256 %or, i256* %destptr
  ret void
}

define void @rorzrs(i256 %rs1) {
; CHECK-LABEL: rorzrs:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    nop stack+=[2 + r0]
; CHECK-NEXT:    ror.s stack-[1], r1, stack-[2]
; CHECK-NEXT:    ret
entry:
  %destptr = alloca i256
  %valptr = alloca i256
  %val = load i256, i256* %valptr
  %sub = sub i256 256, %val
  %lshr = lshr i256 %rs1, %val
  %shl = shl i256 %rs1, %sub
  %or = or i256 %shl, %lshr
  store i256 %or, i256* %destptr
  ret void
}

declare i256 @llvm.fshr.i256(i256, i256, i256)
