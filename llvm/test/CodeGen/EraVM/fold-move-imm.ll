; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O3 < %s | FileCheck %s

target datalayout = "E-p:256:256-i256:256:256-S32-a:256:256"
target triple = "eravm"

define i256 @test_pos(i256 %arg) {
; CHECK-LABEL: test_pos:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sub! r1, r0, r2
; CHECK-NEXT:    jump.eq @.BB0_1
; CHECK-NEXT:  ; %bb.2: ; %loop-bb1.preheader
; CHECK-NEXT:    add r0, r0, r8
; CHECK-NEXT:    add r0, r0, r2
; CHECK-NEXT:    jump @.BB0_4
; CHECK-NEXT:  .BB0_8: ; %loop-bb5
; CHECK-NEXT:    ; in Loop: Header=BB0_4 Depth=1
; CHECK-NEXT:    add 47, r0, r9
; CHECK-NEXT:  .BB0_9: ; %loop-bb6
; CHECK-NEXT:    ; in Loop: Header=BB0_4 Depth=1
; CHECK-NEXT:    add r2, r9, r2
; CHECK-NEXT:    add 1, r8, r8
; CHECK-NEXT:    sub! r8, r1, r9
; CHECK-NEXT:    jump.eq @.BB0_3
; CHECK-NEXT:  .BB0_4: ; %loop-bb1
; CHECK-NEXT:    ; =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sub.s! 3, r8, r9
; CHECK-NEXT:    add 100, r0, r9
; CHECK-NEXT:    jump.le @JTI0_0[r8]
; CHECK-NEXT:    jump @.BB0_9
; CHECK-NEXT:  .BB0_5: ; %loop-bb2
; CHECK-NEXT:    ; in Loop: Header=BB0_4 Depth=1
; CHECK-NEXT:    add 114, r0, r9
; CHECK-NEXT:    jump @.BB0_9
; CHECK-NEXT:  .BB0_6: ; %loop-bb3
; CHECK-NEXT:    ; in Loop: Header=BB0_4 Depth=1
; CHECK-NEXT:    add 25, r0, r9
; CHECK-NEXT:    jump @.BB0_9
; CHECK-NEXT:  .BB0_7: ; %loop-bb4
; CHECK-NEXT:    ; in Loop: Header=BB0_4 Depth=1
; CHECK-NEXT:    add 36, r0, r9
; CHECK-NEXT:    jump @.BB0_9
; CHECK-NEXT:  .BB0_3: ; %exit
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
; CHECK-NEXT:  .BB0_1:
; CHECK-NEXT:    add r0, r0, r2
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    .rodata
; CHECK-NEXT:    .p2align 5
; CHECK-NEXT:  JTI0_0:
; CHECK-NEXT:  .cell @.BB0_5
; CHECK-NEXT:  .cell @.BB0_6
; CHECK-NEXT:  .cell @.BB0_7
; CHECK-NEXT:  .cell @.BB0_8
entry:
  %cmp1 = icmp eq i256 %arg, 0
  br i1 %cmp1, label %exit, label %loop-bb1

exit:
  %ret = phi i256 [ 0, %entry ], [ %add1, %loop-bb6 ]
  ret i256 %ret

loop-bb1:
  %phi1 = phi i256 [ %add2, %loop-bb6 ], [ 0, %entry ]
  %phi2 = phi i256 [ %add1, %loop-bb6 ], [ 0, %entry ]
  switch i256 %phi1, label %loop-bb6 [
    i256 0, label %loop-bb2
    i256 1, label %loop-bb3
    i256 2, label %loop-bb4
    i256 3, label %loop-bb5
  ]

loop-bb2:
  br label %loop-bb6

loop-bb3:
  br label %loop-bb6

loop-bb4:
  br label %loop-bb6

loop-bb5:
  br label %loop-bb6

loop-bb6:
  %phi3 = phi i256 [ 47, %loop-bb5 ], [ 36, %loop-bb4 ], [ 25, %loop-bb3 ], [ 114, %loop-bb2 ], [ 100, %loop-bb1 ]
  %add1 = add i256 %phi2, %phi3
  %add2 = add nuw i256 %phi1, 1
  %cmp2 = icmp eq i256 %add2, %arg
  br i1 %cmp2, label %exit, label %loop-bb1
}

; TODO: CPR-1669 We can avoid creating constant pool entries.
define i256 @test_neg(i256 %arg) {
; CHECK-LABEL: test_neg:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sub! r1, r0, r2
; CHECK-NEXT:    jump.eq @.BB1_1
; CHECK-NEXT:  ; %bb.2: ; %loop-bb1.preheader
; CHECK-NEXT:    add r0, r0, r8
; CHECK-NEXT:    add r0, r0, r2
; CHECK-NEXT:    jump @.BB1_4
; CHECK-NEXT:  .BB1_8: ; %loop-bb5
; CHECK-NEXT:    ; in Loop: Header=BB1_4 Depth=1
; CHECK-NEXT:    add @CPI1_4[0], r0, r9
; CHECK-NEXT:  .BB1_9: ; %loop-bb6
; CHECK-NEXT:    ; in Loop: Header=BB1_4 Depth=1
; CHECK-NEXT:    add r2, r9, r2
; CHECK-NEXT:    add 1, r8, r8
; CHECK-NEXT:    sub! r8, r1, r9
; CHECK-NEXT:    jump.eq @.BB1_3
; CHECK-NEXT:  .BB1_4: ; %loop-bb1
; CHECK-NEXT:    ; =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    sub.s! 3, r8, r9
; CHECK-NEXT:    add @CPI1_0[0], r0, r9
; CHECK-NEXT:    jump.le @JTI1_0[r8]
; CHECK-NEXT:    jump @.BB1_9
; CHECK-NEXT:  .BB1_5: ; %loop-bb2
; CHECK-NEXT:    ; in Loop: Header=BB1_4 Depth=1
; CHECK-NEXT:    add @CPI1_1[0], r0, r9
; CHECK-NEXT:    jump @.BB1_9
; CHECK-NEXT:  .BB1_6: ; %loop-bb3
; CHECK-NEXT:    ; in Loop: Header=BB1_4 Depth=1
; CHECK-NEXT:    add @CPI1_2[0], r0, r9
; CHECK-NEXT:    jump @.BB1_9
; CHECK-NEXT:  .BB1_7: ; %loop-bb4
; CHECK-NEXT:    ; in Loop: Header=BB1_4 Depth=1
; CHECK-NEXT:    add @CPI1_3[0], r0, r9
; CHECK-NEXT:    jump @.BB1_9
; CHECK-NEXT:  .BB1_3: ; %exit
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
; CHECK-NEXT:  .BB1_1:
; CHECK-NEXT:    add r0, r0, r2
; CHECK-NEXT:    add r2, r0, r1
; CHECK-NEXT:    ret
; CHECK-NEXT:    .rodata
; CHECK-NEXT:    .p2align 5
; CHECK-NEXT:  JTI1_0:
; CHECK-NEXT:  .cell @.BB1_5
; CHECK-NEXT:  .cell @.BB1_6
; CHECK-NEXT:  .cell @.BB1_7
; CHECK-NEXT:  .cell @.BB1_8
entry:
  %cmp1 = icmp eq i256 %arg, 0
  br i1 %cmp1, label %exit, label %loop-bb1

exit:
  %ret = phi i256 [ 0, %entry ], [ %add1, %loop-bb6 ]
  ret i256 %ret

loop-bb1:
  %phi1 = phi i256 [ %add2, %loop-bb6 ], [ 0, %entry ]
  %phi2 = phi i256 [ %add1, %loop-bb6 ], [ 0, %entry ]
  switch i256 %phi1, label %loop-bb6 [
    i256 0, label %loop-bb2
    i256 1, label %loop-bb3
    i256 2, label %loop-bb4
    i256 3, label %loop-bb5
  ]

loop-bb2:
  br label %loop-bb6

loop-bb3:
  br label %loop-bb6

loop-bb4:
  br label %loop-bb6

loop-bb5:
  br label %loop-bb6

loop-bb6:
  %phi3 = phi i256 [ -47, %loop-bb5 ], [ -36, %loop-bb4 ], [ -25, %loop-bb3 ], [ -114, %loop-bb2 ], [ -100, %loop-bb1 ]
  %add1 = add i256 %phi2, %phi3
  %add2 = add nuw i256 %phi1, 1
  %cmp2 = icmp eq i256 %add2, %arg
  br i1 %cmp2, label %exit, label %loop-bb1
}

; CHECK: CPI1_0:
; CHECK:  .cell -100
; CHECK: CPI1_1:
; CHECK:  .cell -114
; CHECK: CPI1_2:
; CHECK:  .cell -25
; CHECK: CPI1_3:
; CHECK:  .cell -36
; CHECK: CPI1_4:
; CHECK:  .cell -47
