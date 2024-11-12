; ModuleID = 'C:/Users/gudtj/OneDrive/Desktop/24-2/SoC/HTL_Practice/241107/dataflow/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_dataflow_ir(i8* noalias nocapture nonnull readonly %input, i8* noalias nocapture nonnull readonly %weight, i32* noalias nocapture nonnull %output) local_unnamed_addr #0 {
entry:
  %input_copy = alloca [64 x i8], align 512
  %weight_copy = alloca [64 x i8], align 512
  %output_copy = alloca [64 x i32], align 512
  %0 = bitcast i8* %input to [64 x i8]*
  %1 = bitcast i8* %weight to [64 x i8]*
  %2 = bitcast i32* %output to [64 x i32]*
  call fastcc void @copy_in([64 x i8]* nonnull %0, [64 x i8]* nonnull align 512 %input_copy, [64 x i8]* nonnull %1, [64 x i8]* nonnull align 512 %weight_copy, [64 x i32]* nonnull %2, [64 x i32]* nonnull align 512 %output_copy)
  %3 = getelementptr inbounds [64 x i8], [64 x i8]* %input_copy, i32 0, i32 0
  %4 = getelementptr inbounds [64 x i8], [64 x i8]* %weight_copy, i32 0, i32 0
  %5 = getelementptr inbounds [64 x i32], [64 x i32]* %output_copy, i32 0, i32 0
  call void @apatb_dataflow_hw(i8* %3, i8* %4, i32* %5)
  call void @copy_back([64 x i8]* %0, [64 x i8]* %input_copy, [64 x i8]* %1, [64 x i8]* %weight_copy, [64 x i32]* %2, [64 x i32]* %output_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([64 x i8]* noalias readonly, [64 x i8]* noalias align 512, [64 x i8]* noalias readonly, [64 x i8]* noalias align 512, [64 x i32]* noalias readonly, [64 x i32]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a64i8([64 x i8]* align 512 %1, [64 x i8]* %0)
  call fastcc void @onebyonecpy_hls.p0a64i8([64 x i8]* align 512 %3, [64 x i8]* %2)
  call fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* align 512 %5, [64 x i32]* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a64i8([64 x i8]* noalias align 512, [64 x i8]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [64 x i8]* %0, null
  %3 = icmp eq [64 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [64 x i8], [64 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [64 x i8], [64 x i8]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i8, i8* %src.addr, align 1
  store i8 %5, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 64
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* noalias align 512, [64 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [64 x i32]* %0, null
  %3 = icmp eq [64 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [64 x i32], [64 x i32]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [64 x i32], [64 x i32]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i32, i32* %src.addr, align 4
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 64
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([64 x i8]* noalias, [64 x i8]* noalias readonly align 512, [64 x i8]* noalias, [64 x i8]* noalias readonly align 512, [64 x i32]* noalias, [64 x i32]* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a64i8([64 x i8]* %0, [64 x i8]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a64i8([64 x i8]* %2, [64 x i8]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* %4, [64 x i32]* align 512 %5)
  ret void
}

declare void @apatb_dataflow_hw(i8*, i8*, i32*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([64 x i8]* noalias, [64 x i8]* noalias readonly align 512, [64 x i8]* noalias, [64 x i8]* noalias readonly align 512, [64 x i32]* noalias, [64 x i32]* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* %4, [64 x i32]* align 512 %5)
  ret void
}

define void @dataflow_hw_stub_wrapper(i8*, i8*, i32*) #4 {
entry:
  %3 = bitcast i8* %0 to [64 x i8]*
  %4 = bitcast i8* %1 to [64 x i8]*
  %5 = bitcast i32* %2 to [64 x i32]*
  call void @copy_out([64 x i8]* null, [64 x i8]* %3, [64 x i8]* null, [64 x i8]* %4, [64 x i32]* null, [64 x i32]* %5)
  %6 = bitcast [64 x i8]* %3 to i8*
  %7 = bitcast [64 x i8]* %4 to i8*
  %8 = bitcast [64 x i32]* %5 to i32*
  call void @dataflow_hw_stub(i8* %6, i8* %7, i32* %8)
  call void @copy_in([64 x i8]* null, [64 x i8]* %3, [64 x i8]* null, [64 x i8]* %4, [64 x i32]* null, [64 x i32]* %5)
  ret void
}

declare void @dataflow_hw_stub(i8*, i8*, i32*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
