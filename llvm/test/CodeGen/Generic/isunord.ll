; UNSUPPORTED: target=eravm{{.*}}, target=evm{{.*}}
; EraVM doesn't support floats.
; RUN: llc < %s

declare i1 @llvm.isunordered.f64(double, double)

define i1 @test(double %X, double %Y) {
        %tmp27 = fcmp uno double %X, %Y         ; <i1> [#uses=1]
        ret i1 %tmp27
}

