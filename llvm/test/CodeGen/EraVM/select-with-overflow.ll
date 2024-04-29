; RUN: llc -O3 < %s | FileCheck %s

target datalayout = "E-p:256:256-i8:256:256:256-i256:256:256-S32-a:256:256"
target triple = "eravm"

declare { i256, i1 } @llvm.uadd.with.overflow.i256(i256, i256)

define i256 @add_test(i256 %a, i256 %b, i256 %c, i256 %x, i256 %y, i256 %z) {
; CHECK-LABEL: add_test
; CHECK-NOT: add!    r4, r5, r4
; CHECK-NOT: sub!    r1, r2, r5
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
