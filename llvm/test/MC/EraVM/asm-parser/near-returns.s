; RUN: llvm-mc -triple eravm -filetype=asm %s -o - | FileCheck %s

  .text
foo:

; mnemonics
  ret           ; aliased to ret.ok r1
  ret.ok r1
  ret.ok r3
  revert        ; aliased to ret.revert r1
  ret.revert r1
  ret.revert r3
  panic
  ret.ok.to_label @label
  ret.revert.to_label @label
  ret.panic.to_label @label

; modifiers (condition)
  ret.lt
  revert.lt
  ret.ok.lt r3
  ret.revert.lt r3
  panic.lt
  ret.ok.to_label.lt @label
  ret.revert.to_label.lt @label
  ret.panic.to_label.lt @label

; aliases
  ret.ok.to_label         r1, @label
  ret.revert.to_label     r1, @label
  ret.ok.to_label.lt      r1, @label
  ret.revert.to_label.lt  r1, @label
; generic case
  ret.ok.to_label         r3, @label
  ret.revert.to_label     r3, @label
  ret.ok.to_label.lt      r3, @label
  ret.revert.to_label.lt  r3, @label

; COM: Autogenerated checks below, see README.md.
; CHECK:  .text
; CHECK:foo:

; CHECK:  ret
; CHECK:  ret
; CHECK:  ret.ok r3
; CHECK:  revert
; CHECK:  revert
; CHECK:  ret.revert r3
; CHECK:  panic
; CHECK:  ret.ok.to_label  r1, @label
; CHECK:  revert.to_label  r1, @label
; CHECK:  panic.to_label   @label

; CHECK:  ret.lt
; CHECK:  revert.lt
; CHECK:  ret.ok.lt r3
; CHECK:  ret.revert.lt r3
; CHECK:  panic.lt
; CHECK:  ret.ok.to_label.lt r1, @label
; CHECK:  ret.revert.to_label.lt r1, @label
; CHECK:  panic.to_label.lt @label

; CHECK:  ret.ok.to_label       r1, @label
; CHECK:  ret.revert.to_label   r1, @label
; CHECK:  ret.ok.to_label.lt    r1, @label
; CHECK:  ret.revert.to_label.lt        r1, @label
; CHECK:  ret.ok.to_label       r3, @label
; CHECK:  ret.revert.to_label   r3, @label
; CHECK:  ret.ok.to_label.lt    r3, @label
; CHECK:  ret.revert.to_label.lt        r3, @label
