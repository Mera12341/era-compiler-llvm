; RUN: llc < %s | FileCheck %s

; ModuleID = 'tests/solidity/complex/defi/Mooniswap/MooniswapPool/Mooniswap.sol:Mooniswap'
source_filename = "tests/solidity/complex/defi/Mooniswap/MooniswapPool/Mooniswap.sol:Mooniswap"
target datalayout = "E-p:256:256-i256:256:256-S32-a:256:256"
target triple = "syncvm-unknown-unknown"

@calldatasize = private unnamed_addr global i256 0
@returndatasize = private unnamed_addr global i256 0
; CHECK: returndatasize
@ptr_calldata = private unnamed_addr global ptr addrspace(3) null
; CHECK: ptr_calldata
@ptr_return_data = private unnamed_addr global ptr addrspace(3) null

; Function Attrs: nofree nosync nounwind readnone
declare i256 @llvm.syncvm.this() #0

; Function Attrs: nofree nosync nounwind readnone
declare i256 @llvm.syncvm.caller() #0

; Function Attrs: nounwind
declare i256 @llvm.syncvm.gasleft() #1

; Function Attrs: nounwind
declare i256 @llvm.syncvm.getu128() #1

; Function Attrs: nofree nounwind readonly
declare i256 @llvm.syncvm.sload(i256) #2

; Function Attrs: writeonly
declare void @llvm.syncvm.sstore(i256, i256) #3

; Function Attrs: noreturn nounwind
declare void @llvm.syncvm.return(i256) #4

; Function Attrs: noreturn nounwind
declare void @llvm.syncvm.revert(i256) #4

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) noalias nocapture writeonly, ptr addrspace(3) noalias nocapture readonly, i256, i1 immarg) #5

declare i32 @__personality()

; Function Attrs: nofree null_pointer_is_valid
declare { ptr addrspace(3), i1 } @__farcall(i256, i256, i256, i256, i256, i256, i256, i256, i256, i256, i256, i256) local_unnamed_addr #6

; Function Attrs: nofree null_pointer_is_valid
declare { ptr addrspace(3), i1 } @__staticcall(i256, i256, i256, i256, i256, i256, i256, i256, i256, i256, i256, i256) local_unnamed_addr #6

; Function Attrs: nofree null_pointer_is_valid
define i256 @__entry(ptr addrspace(3) %0, i256 %1, i256 %2, i256 %3, i256 %4, i256 %5, i256 %6, i256 %7, i256 %8, i256 %9, i256 %10, i256 %11) local_unnamed_addr #6 personality ptr @__personality {
entry:
  store i256 0, ptr @calldatasize, align 32
  store i256 0, ptr @returndatasize, align 32
  store ptr addrspace(3) %0, ptr @ptr_calldata, align 32
  %abi_pointer_value = ptrtoint ptr addrspace(3) %0 to i256
  %abi_pointer_value_shifted = lshr i256 %abi_pointer_value, 96
  %abi_length_value = and i256 %abi_pointer_value_shifted, 4294967295
  store i256 %abi_length_value, ptr @calldatasize, align 32
  %return_data_abi_initializer = getelementptr i8, ptr addrspace(3) %0, i256 %abi_length_value
  store ptr addrspace(3) %return_data_abi_initializer, ptr @ptr_return_data, align 32
  %is_deploy_code_call_flag_truncated = and i256 %1, 1
  %is_deploy_code_call_flag.not = icmp eq i256 %is_deploy_code_call_flag_truncated, 0
  br i1 %is_deploy_code_call_flag.not, label %runtime_code_call_block, label %deploy_code_call_block

deploy_code_call_block:                           ; preds = %entry
  tail call fastcc void @__deploy()
  unreachable

runtime_code_call_block:                          ; preds = %entry
  store i256 128, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %calldatasize.i = load i256, ptr @calldatasize, align 32
  %comparison_result.i = icmp ugt i256 %calldatasize.i, 3
  br i1 %comparison_result.i, label %if_main.i, label %if_join.i

if_main.i:                                        ; preds = %runtime_code_call_block
  %calldata_pointer.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_value.i = load i256, ptr addrspace(3) %calldata_pointer.i, align 32
  %shift_right_non_overflow_result.i = lshr i256 %calldata_value.i, 224
  %trunc.i = trunc i256 %shift_right_non_overflow_result.i to i32
  switch i32 %trunc.i, label %if_join.i [
    i32 117300739, label %switch_case_branch_1_block.i
    i32 157198259, label %switch_case_branch_2_block.i
    i32 273580543, label %switch_case_branch_3_block.i
    i32 404098525, label %switch_case_branch_4_block.i
    i32 435385185, label %switch_case_branch_5_block.i
    i32 504627704, label %switch_case_branch_6_block.i
    i32 599290589, label %switch_case_branch_7_block.i
    i32 820017310, label %switch_case_branch_8_block.i
    i32 826074471, label %switch_case_branch_9_block.i
    i32 961581905, label %switch_case_branch_10_block.i
    i32 1222016539, label %switch_case_branch_11_block.i
    i32 1315881543, label %switch_case_branch_12_block.i
    i32 1331999422, label %switch_case_branch_13_block.i
    i32 1494603782, label %switch_case_branch_14_block.i
    i32 1591285101, label %switch_case_branch_15_block.i
    i32 1633807128, label %switch_case_branch_16_block.i
    i32 1859922953, label %switch_case_branch_17_block.i
    i32 1889567281, label %switch_case_branch_18_block.i
    i32 1901074598, label %switch_case_branch_19_block.i
    i32 2028151119, label %switch_case_branch_20_block.i
    i32 -1918514341, label %switch_case_branch_21_block.i
    i32 -1887364580, label %switch_case_branch_22_block.i
    i32 -1780966591, label %switch_case_branch_23_block.i
    i32 -1537752361, label %switch_case_branch_24_block.i
    i32 -1459249989, label %switch_case_branch_25_block.i
    i32 -1435719672, label %switch_case_branch_26_block.i
    i32 -1309914048, label %switch_case_branch_27_block.i
    i32 -1306830303, label %switch_case_branch_28_block.i
    i32 -1158596086, label %switch_case_branch_29_block.i
    i32 -1000734379, label %switch_case_branch_30_block.i
    i32 -892092797, label %switch_case_branch_31_block.i
    i32 -709051979, label %switch_case_branch_32_block.i
    i32 -684223831, label %switch_case_branch_33_block.i
    i32 -673994059, label %switch_case_branch_34_block.i
    i32 -580719298, label %switch_case_branch_35_block.i
    i32 -573948093, label %switch_case_branch_36_block.i
    i32 -402701623, label %switch_case_branch_37_block.i
    i32 -232552358, label %switch_case_branch_38_block.i
    i32 -218242165, label %switch_case_branch_39_block.i
  ]

if_join.i:                                        ; preds = %if_main.i, %runtime_code_call_block
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

switch_case_branch_1_block.i:                     ; preds = %if_main.i
  %get_u128_value.i.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i.i = icmp eq i256 %get_u128_value.i.i, 0
  br i1 %if_condition_compared.not.i.i, label %if_join.i.i, label %if_main.i.i

if_main.i.i:                                      ; preds = %switch_case_branch_1_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i.i:                                      ; preds = %switch_case_branch_1_block.i
  %calldatasize.i.i = load i256, ptr @calldatasize, align 32
  %addition_result.i.i = add i256 %calldatasize.i.i, -4
  %comparison_result.i.i = icmp slt i256 %addition_result.i.i, 0
  br i1 %comparison_result.i.i, label %if_main3.i.i, label %if_join4.i.i

if_main3.i.i:                                     ; preds = %if_join.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join4.i.i:                                     ; preds = %if_join.i.i
  %memory_load_result.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %storage_load.i.i = tail call i256 @llvm.syncvm.sload(i256 3)
  %shift_right_non_overflow_result.i.i = lshr i256 %storage_load.i.i, 1
  %and_result.i.i = and i256 %storage_load.i.i, 1
  %comparison_result14.i.i = icmp eq i256 %and_result.i.i, 0
  %and_result20.i.i = and i256 %shift_right_non_overflow_result.i.i, 127
  %storemerge86.i.i = select i1 %comparison_result14.i.i, i256 %and_result20.i.i, i256 %shift_right_non_overflow_result.i.i
  %comparison_result23.i.i = icmp ugt i256 %storemerge86.i.i, 31
  %12 = icmp ne i256 %and_result.i.i, 0
  %comparison_result26.i.i = xor i1 %12, %comparison_result23.i.i
  br i1 %comparison_result26.i.i, label %if_main29.i.i, label %if_join30.i.i

if_main29.i.i:                                    ; preds = %if_join4.i.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 34, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join30.i.i:                                    ; preds = %if_join4.i.i
  %memory_store_pointer.i.i.i = inttoptr i256 %memory_load_result.i.i to ptr addrspace(1)
  store i256 %storemerge86.i.i, ptr addrspace(1) %memory_store_pointer.i.i.i, align 1
  %addition_result.i.i.i = add i256 %memory_load_result.i.i, 32
  br i1 %comparison_result14.i.i, label %switch_case_branch_1_block.i.i, label %switch_case_branch_2_block.i.i

switch_join_block.i.i:                            ; preds = %for_body.i.i, %switch_case_branch_2_block.i.i, %switch_case_branch_1_block.i.i
  %storemerge.pn.i.i = phi i256 [ %shift_left_non_overflow_result.i.i, %switch_case_branch_1_block.i.i ], [ 0, %switch_case_branch_2_block.i.i ], [ %addition_result68.i.i, %for_body.i.i ]
  %subtraction_result.i.i = add i256 %storemerge.pn.i.i, 32
  tail call fastcc void @finalize_allocation(i256 %memory_load_result.i.i, i256 %subtraction_result.i.i)
  %memory_load_result75.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %abi_encode_string_call.i.i = tail call fastcc i256 @abi_encode_string(i256 %memory_load_result75.i.i, i256 %memory_load_result.i.i)
  %subtraction_result79.i.i = sub i256 %abi_encode_string_call.i.i, %memory_load_result75.i.i
  %13 = tail call i256 @llvm.umin.i256(i256 %memory_load_result75.i.i, i256 4294967295)
  %14 = tail call i256 @llvm.umin.i256(i256 %subtraction_result79.i.i, i256 4294967295)
  %exit_offset_shifted.i83.i.i = shl nuw nsw i256 %13, 64
  %exit_length_shifted.i.i.i = shl nuw nsw i256 %14, 96
  %exit_abi_data_add_heap_auxiliary_marker.i.i.i = or i256 %exit_length_shifted.i.i.i, %exit_offset_shifted.i83.i.i
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i.i)
  unreachable

switch_case_branch_1_block.i.i:                   ; preds = %if_join30.i.i
  %and_result37.i.i = and i256 %storage_load.i.i, -256
  %memory_store_pointer39.i.i = inttoptr i256 %addition_result.i.i.i to ptr addrspace(1)
  store i256 %and_result37.i.i, ptr addrspace(1) %memory_store_pointer39.i.i, align 1
  %comparison_result41.not.i.i = icmp eq i256 %storemerge86.i.i, 0
  %shift_left_non_overflow_result.i.i = select i1 %comparison_result41.not.i.i, i256 0, i256 32
  br label %switch_join_block.i.i

switch_case_branch_2_block.i.i:                   ; preds = %if_join30.i.i
  store i256 3, ptr addrspace(1) null, align 4294967296
  %comparison_result5588.not.i.i = icmp eq i256 %storemerge86.i.i, 0
  br i1 %comparison_result5588.not.i.i, label %switch_join_block.i.i, label %for_body.i.i

for_body.i.i:                                     ; preds = %switch_case_branch_2_block.i.i, %for_body.i.i
  %storemerge90.i.i = phi i256 [ %addition_result68.i.i, %for_body.i.i ], [ 0, %switch_case_branch_2_block.i.i ]
  %addition_result658789.i.i = phi i256 [ %addition_result65.i.i, %for_body.i.i ], [ -27889059366240281169193357100633332908378892778709981755071813198463099602853, %switch_case_branch_2_block.i.i ]
  %storage_load58.i.i = tail call i256 @llvm.syncvm.sload(i256 %addition_result658789.i.i)
  %addition_result61.i.i = add i256 %storemerge90.i.i, %addition_result.i.i.i
  %memory_store_pointer62.i.i = inttoptr i256 %addition_result61.i.i to ptr addrspace(1)
  store i256 %storage_load58.i.i, ptr addrspace(1) %memory_store_pointer62.i.i, align 1
  %addition_result65.i.i = add nuw nsw i256 %addition_result658789.i.i, 1
  %addition_result68.i.i = add nuw i256 %storemerge90.i.i, 32
  %comparison_result55.i.i = icmp ult i256 %addition_result68.i.i, %storemerge86.i.i
  br i1 %comparison_result55.i.i, label %for_body.i.i, label %switch_join_block.i.i

switch_case_branch_2_block.i:                     ; preds = %if_main.i
  %get_u128_value.i3.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i4.i = icmp eq i256 %get_u128_value.i3.i, 0
  br i1 %if_condition_compared.not.i4.i, label %if_join.i9.i, label %if_main.i5.i

if_main.i5.i:                                     ; preds = %switch_case_branch_2_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i9.i:                                     ; preds = %switch_case_branch_2_block.i
  %calldatasize.i6.i = load i256, ptr @calldatasize, align 32
  %addition_result.i7.i = add i256 %calldatasize.i6.i, -4
  %comparison_result.i8.i = icmp slt i256 %addition_result.i7.i, 64
  br i1 %comparison_result.i8.i, label %if_main2.i.i, label %if_join3.i.i

if_main2.i.i:                                     ; preds = %if_join.i9.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i.i:                                     ; preds = %if_join.i9.i
  %calldata_pointer.i.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i.i, i256 4
  %calldata_value.i.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i.i, align 32
  %15 = icmp ugt i256 %calldata_value.i.i, 1461501637330902918203684832716283019655932542975
  br i1 %15, label %if_main.i.i.i, label %validator_revert_address.exit.i.i

if_main.i.i.i:                                    ; preds = %if_join3.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i.i:                ; preds = %if_join3.i.i
  %calldata_pointer_with_offset6.i.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i.i, i256 36
  %calldata_value7.i.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset6.i.i, align 32
  %caller.i.i = tail call i256 @llvm.syncvm.caller()
  tail call fastcc void @fun_approve(i256 %caller.i.i, i256 %calldata_value.i.i, i256 %calldata_value7.i.i)
  %memory_load_result.i10.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i = inttoptr i256 %memory_load_result.i10.i to ptr addrspace(1)
  store i256 1, ptr addrspace(1) %memory_store_pointer.i.i, align 1
  %16 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i10.i, i256 4294967295)
  %exit_offset_shifted.i.i.i = shl nuw nsw i256 %16, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i11.i = or i256 %exit_offset_shifted.i.i.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i11.i)
  unreachable

switch_case_branch_3_block.i:                     ; preds = %if_main.i
  %get_u128_value.i12.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i13.i = icmp eq i256 %get_u128_value.i12.i, 0
  br i1 %if_condition_compared.not.i13.i, label %if_join.i18.i, label %if_main.i14.i

if_main.i14.i:                                    ; preds = %switch_case_branch_3_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i18.i:                                    ; preds = %switch_case_branch_3_block.i
  %calldatasize.i15.i = load i256, ptr @calldatasize, align 32
  %abi_decode_addresst_addresst_uint256_call.i.i = tail call fastcc { i256, i256, i256 } @abi_decode_addresst_addresst_uint256(i256 %calldatasize.i15.i)
  %abi_decode_addresst_addresst_uint256_call.elt.i.i = extractvalue { i256, i256, i256 } %abi_decode_addresst_addresst_uint256_call.i.i, 0
  %abi_decode_addresst_addresst_uint256_call.elt2.i.i = extractvalue { i256, i256, i256 } %abi_decode_addresst_addresst_uint256_call.i.i, 1
  %abi_decode_addresst_addresst_uint256_call.elt4.i.i = extractvalue { i256, i256, i256 } %abi_decode_addresst_addresst_uint256_call.i.i, 2
  tail call fastcc void @fun_approve(i256 %abi_decode_addresst_addresst_uint256_call.elt.i.i, i256 %abi_decode_addresst_addresst_uint256_call.elt2.i.i, i256 %abi_decode_addresst_addresst_uint256_call.elt4.i.i)
  %memory_load_result.i16.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %17 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i16.i, i256 4294967295)
  %exit_offset_shifted.i.i17.i = shl nuw nsw i256 %17, 64
  tail call void @llvm.syncvm.return(i256 %exit_offset_shifted.i.i17.i)
  unreachable

switch_case_branch_4_block.i:                     ; preds = %if_main.i
  %get_u128_value.i19.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i20.i = icmp eq i256 %get_u128_value.i19.i, 0
  br i1 %if_condition_compared.not.i20.i, label %if_join.i25.i, label %if_main.i21.i

if_main.i21.i:                                    ; preds = %switch_case_branch_4_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i25.i:                                    ; preds = %switch_case_branch_4_block.i
  %calldatasize.i22.i = load i256, ptr @calldatasize, align 32
  %addition_result.i23.i = add i256 %calldatasize.i22.i, -4
  %comparison_result.i24.i = icmp slt i256 %addition_result.i23.i, 0
  br i1 %comparison_result.i24.i, label %if_main2.i26.i, label %if_join3.i32.i

if_main2.i26.i:                                   ; preds = %if_join.i25.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i32.i:                                   ; preds = %if_join.i25.i
  %storage_load.i27.i = tail call i256 @llvm.syncvm.sload(i256 2)
  %memory_load_result.i28.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i29.i = inttoptr i256 %memory_load_result.i28.i to ptr addrspace(1)
  store i256 %storage_load.i27.i, ptr addrspace(1) %memory_store_pointer.i29.i, align 1
  %18 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i28.i, i256 4294967295)
  %exit_offset_shifted.i.i30.i = shl nuw nsw i256 %18, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i31.i = or i256 %exit_offset_shifted.i.i30.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i31.i)
  unreachable

switch_case_branch_5_block.i:                     ; preds = %if_main.i
  %get_u128_value.i33.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i34.i = icmp eq i256 %get_u128_value.i33.i, 0
  br i1 %if_condition_compared.not.i34.i, label %if_join.i39.i, label %if_main.i35.i

if_main.i35.i:                                    ; preds = %switch_case_branch_5_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i39.i:                                    ; preds = %switch_case_branch_5_block.i
  %calldatasize.i36.i = load i256, ptr @calldatasize, align 32
  %addition_result.i37.i = add i256 %calldatasize.i36.i, -4
  %comparison_result.i38.i = icmp slt i256 %addition_result.i37.i, 32
  br i1 %comparison_result.i38.i, label %if_main2.i40.i, label %if_join3.i44.i

if_main2.i40.i:                                   ; preds = %if_join.i39.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i44.i:                                   ; preds = %if_join.i39.i
  %calldata_pointer.i41.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i42.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i41.i, i256 4
  %calldata_value.i43.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i42.i, align 32
  %19 = icmp ugt i256 %calldata_value.i43.i, 1461501637330902918203684832716283019655932542975
  br i1 %19, label %if_main.i.i45.i, label %validator_revert_address.exit.i52.i

if_main.i.i45.i:                                  ; preds = %if_join3.i44.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i52.i:              ; preds = %if_join3.i44.i
  %and_result.i46.i = and i256 %calldata_value.i43.i, 1461501637330902918203684832716283019655932542975
  store i256 %and_result.i46.i, ptr addrspace(1) null, align 4294967296
  store i256 9, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %keccak256_call.i.i = tail call fastcc i256 @__keccak256(i256 64)
  %storage_load.i47.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_call.i.i)
  %and_result6.i.i = and i256 %storage_load.i47.i, 255
  %memory_load_result.i48.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %comparison_result8.i.i = icmp ne i256 %and_result6.i.i, 0
  %comparison_result_extended11.i.i = zext i1 %comparison_result8.i.i to i256
  %memory_store_pointer.i49.i = inttoptr i256 %memory_load_result.i48.i to ptr addrspace(1)
  store i256 %comparison_result_extended11.i.i, ptr addrspace(1) %memory_store_pointer.i49.i, align 1
  %20 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i48.i, i256 4294967295)
  %exit_offset_shifted.i.i50.i = shl nuw nsw i256 %20, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i51.i = or i256 %exit_offset_shifted.i.i50.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i51.i)
  unreachable

switch_case_branch_6_block.i:                     ; preds = %if_main.i
  %get_u128_value.i53.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i54.i = icmp eq i256 %get_u128_value.i53.i, 0
  br i1 %if_condition_compared.not.i54.i, label %if_join.i59.i, label %if_main.i55.i

if_main.i55.i:                                    ; preds = %switch_case_branch_6_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i59.i:                                    ; preds = %switch_case_branch_6_block.i
  %calldatasize.i56.i = load i256, ptr @calldatasize, align 32
  %addition_result.i57.i = add i256 %calldatasize.i56.i, -4
  %comparison_result.i58.i = icmp slt i256 %addition_result.i57.i, 96
  br i1 %comparison_result.i58.i, label %if_main2.i60.i, label %if_join3.i64.i

if_main2.i60.i:                                   ; preds = %if_join.i59.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i64.i:                                   ; preds = %if_join.i59.i
  %calldata_pointer.i61.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i62.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i61.i, i256 4
  %calldata_value.i63.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i62.i, align 32
  %21 = icmp ugt i256 %calldata_value.i63.i, 1461501637330902918203684832716283019655932542975
  br i1 %21, label %if_main.i.i65.i, label %validator_revert_address.exit.i68.i

if_main.i.i65.i:                                  ; preds = %if_join3.i64.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i68.i:              ; preds = %if_join3.i64.i
  %calldata_pointer_with_offset6.i66.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i61.i, i256 36
  %calldata_value7.i67.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset6.i66.i, align 32
  %22 = icmp ugt i256 %calldata_value7.i67.i, 1461501637330902918203684832716283019655932542975
  br i1 %22, label %if_main.i21.i.i, label %validator_revert_address.exit22.i.i

if_main.i21.i.i:                                  ; preds = %validator_revert_address.exit.i68.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit22.i.i:              ; preds = %validator_revert_address.exit.i68.i
  %fun_getBalanceForAddition_call.i.i = tail call fastcc i256 @fun_getBalanceForAddition(i256 %calldata_value.i63.i)
  %fun_getBalanceForRemoval_call.i.i = tail call fastcc i256 @fun_getBalanceForRemoval(i256 %calldata_value7.i67.i)
  %calldata_pointer12.i.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset13.i.i = getelementptr i8, ptr addrspace(3) %calldata_pointer12.i.i, i256 68
  %calldata_value14.i.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset13.i.i, align 32
  %fun_getReturn_call.i.i = tail call fastcc i256 @fun_getReturn(i256 %calldata_value.i63.i, i256 %calldata_value7.i67.i, i256 %calldata_value14.i.i, i256 %fun_getBalanceForAddition_call.i.i, i256 %fun_getBalanceForRemoval_call.i.i)
  %memory_load_result.i69.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i70.i = inttoptr i256 %memory_load_result.i69.i to ptr addrspace(1)
  store i256 %fun_getReturn_call.i.i, ptr addrspace(1) %memory_store_pointer.i70.i, align 1
  %23 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i69.i, i256 4294967295)
  %exit_offset_shifted.i.i71.i = shl nuw nsw i256 %23, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i72.i = or i256 %exit_offset_shifted.i.i71.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i72.i)
  unreachable

switch_case_branch_7_block.i:                     ; preds = %if_main.i
  tail call fastcc void @external_fun_transferFrom()
  unreachable

switch_case_branch_8_block.i:                     ; preds = %if_main.i
  %get_u128_value.i73.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i74.i = icmp eq i256 %get_u128_value.i73.i, 0
  br i1 %if_condition_compared.not.i74.i, label %if_join.i83.i, label %if_main.i75.i

if_main.i75.i:                                    ; preds = %switch_case_branch_8_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i83.i:                                    ; preds = %switch_case_branch_8_block.i
  %calldatasize.i76.i = load i256, ptr @calldatasize, align 32
  %abi_decode_addresst_addresst_uint256_call.i77.i = tail call fastcc { i256, i256, i256 } @abi_decode_addresst_addresst_uint256(i256 %calldatasize.i76.i)
  %abi_decode_addresst_addresst_uint256_call.elt.i78.i = extractvalue { i256, i256, i256 } %abi_decode_addresst_addresst_uint256_call.i77.i, 0
  %abi_decode_addresst_addresst_uint256_call.elt2.i79.i = extractvalue { i256, i256, i256 } %abi_decode_addresst_addresst_uint256_call.i77.i, 1
  %abi_decode_addresst_addresst_uint256_call.elt4.i80.i = extractvalue { i256, i256, i256 } %abi_decode_addresst_addresst_uint256_call.i77.i, 2
  tail call fastcc void @fun_transfer(i256 %abi_decode_addresst_addresst_uint256_call.elt.i78.i, i256 %abi_decode_addresst_addresst_uint256_call.elt2.i79.i, i256 %abi_decode_addresst_addresst_uint256_call.elt4.i80.i)
  %memory_load_result.i81.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %24 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i81.i, i256 4294967295)
  %exit_offset_shifted.i.i82.i = shl nuw nsw i256 %24, 64
  tail call void @llvm.syncvm.return(i256 %exit_offset_shifted.i.i82.i)
  unreachable

switch_case_branch_9_block.i:                     ; preds = %if_main.i
  %get_u128_value.i84.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i85.i = icmp eq i256 %get_u128_value.i84.i, 0
  br i1 %if_condition_compared.not.i85.i, label %if_join.i90.i, label %if_main.i86.i

if_main.i86.i:                                    ; preds = %switch_case_branch_9_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i90.i:                                    ; preds = %switch_case_branch_9_block.i
  %calldatasize.i87.i = load i256, ptr @calldatasize, align 32
  %addition_result.i88.i = add i256 %calldatasize.i87.i, -4
  %comparison_result.i89.i = icmp slt i256 %addition_result.i88.i, 0
  br i1 %comparison_result.i89.i, label %if_main2.i91.i, label %if_join3.i96.i

if_main2.i91.i:                                   ; preds = %if_join.i90.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i96.i:                                   ; preds = %if_join.i90.i
  %memory_load_result.i92.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i93.i = inttoptr i256 %memory_load_result.i92.i to ptr addrspace(1)
  store i256 18, ptr addrspace(1) %memory_store_pointer.i93.i, align 1
  %25 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i92.i, i256 4294967295)
  %exit_offset_shifted.i.i94.i = shl nuw nsw i256 %25, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i95.i = or i256 %exit_offset_shifted.i.i94.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i95.i)
  unreachable

switch_case_branch_10_block.i:                    ; preds = %if_main.i
  %get_u128_value.i97.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i98.i = icmp eq i256 %get_u128_value.i97.i, 0
  br i1 %if_condition_compared.not.i98.i, label %if_join.i103.i, label %if_main.i99.i

if_main.i99.i:                                    ; preds = %switch_case_branch_10_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i103.i:                                   ; preds = %switch_case_branch_10_block.i
  %calldatasize.i100.i = load i256, ptr @calldatasize, align 32
  %addition_result.i101.i = add i256 %calldatasize.i100.i, -4
  %comparison_result.i102.i = icmp slt i256 %addition_result.i101.i, 64
  br i1 %comparison_result.i102.i, label %if_main2.i104.i, label %if_join3.i108.i

if_main2.i104.i:                                  ; preds = %if_join.i103.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i108.i:                                  ; preds = %if_join.i103.i
  %calldata_pointer.i105.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i106.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i105.i, i256 4
  %calldata_value.i107.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i106.i, align 32
  %26 = icmp ugt i256 %calldata_value.i107.i, 1461501637330902918203684832716283019655932542975
  br i1 %26, label %if_main.i.i109.i, label %validator_revert_address.exit.i115.i

if_main.i.i109.i:                                 ; preds = %if_join3.i108.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i115.i:             ; preds = %if_join3.i108.i
  %caller.i110.i = tail call i256 @llvm.syncvm.caller()
  store i256 %caller.i110.i, ptr addrspace(1) null, align 4294967296
  store i256 1, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %calldata_pointer5.i.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset6.i111.i = getelementptr i8, ptr addrspace(3) %calldata_pointer5.i.i, i256 36
  %calldata_value7.i112.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset6.i111.i, align 32
  %gas_left.i587.i = tail call i256 @llvm.syncvm.gasleft()
  %27 = tail call i256 @llvm.umin.i256(i256 %gas_left.i587.i, i256 4294967295)
  %abi_data_gas_shifted.i588.i = shl nuw nsw i256 %27, 192
  %abi_data_add_system_call_marker.i590.i = or i256 %abi_data_gas_shifted.i588.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i590.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i, label %__keccak256.exit.i, label %keccak256_failure_block.i.i

keccak256_failure_block.i.i:                      ; preds = %validator_revert_address.exit.i115.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit.i:                               ; preds = %validator_revert_address.exit.i115.i
  %keccak256_call_external_result_abi_data_pointer.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 0
  %keccak256_child_data.i.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i, align 1
  %and_result.i586.i = and i256 %calldata_value.i107.i, 1461501637330902918203684832716283019655932542975
  store i256 %and_result.i586.i, ptr addrspace(1) null, align 4294967296
  store i256 %keccak256_child_data.i.i, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i.i = tail call i256 @llvm.syncvm.gasleft()
  %28 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i.i, i256 4294967295)
  %abi_data_gas_shifted.i.i.i = shl nuw nsw i256 %28, 192
  %abi_data_add_system_call_marker.i.i.i = or i256 %abi_data_gas_shifted.i.i.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit.i, label %keccak256_failure_block.i.i.i

keccak256_failure_block.i.i.i:                    ; preds = %__keccak256.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit.i: ; preds = %__keccak256.exit.i
  %keccak256_call_external_result_abi_data_pointer.i.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i.i, 0
  %keccak256_child_data.i.i.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i.i, align 1
  %storage_load.i114.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i.i)
  %xor_result.i.i.i = xor i256 %calldata_value7.i112.i, -1
  %comparison_result.i.i.i = icmp ugt i256 %storage_load.i114.i, %xor_result.i.i.i
  br i1 %comparison_result.i.i.i, label %if_main.i14.i.i, label %checked_add_uint256.exit.i.i

if_main.i14.i.i:                                  ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i.i:                     ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit.i
  %addition_result.i.i116.i = add i256 %storage_load.i114.i, %calldata_value7.i112.i
  tail call fastcc void @fun_approve(i256 %caller.i110.i, i256 %calldata_value.i107.i, i256 %addition_result.i.i116.i)
  %memory_load_result.i117.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i118.i = inttoptr i256 %memory_load_result.i117.i to ptr addrspace(1)
  store i256 1, ptr addrspace(1) %memory_store_pointer.i118.i, align 1
  %29 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i117.i, i256 4294967295)
  %exit_offset_shifted.i.i119.i = shl nuw nsw i256 %29, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i120.i = or i256 %exit_offset_shifted.i.i119.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i120.i)
  unreachable

switch_case_branch_11_block.i:                    ; preds = %if_main.i
  %get_u128_value.i121.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i122.i = icmp eq i256 %get_u128_value.i121.i, 0
  br i1 %if_condition_compared.not.i122.i, label %if_join.i127.i, label %if_main.i123.i

if_main.i123.i:                                   ; preds = %switch_case_branch_11_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i127.i:                                   ; preds = %switch_case_branch_11_block.i
  %calldatasize.i124.i = load i256, ptr @calldatasize, align 32
  %addition_result.i125.i = add i256 %calldatasize.i124.i, -4
  %comparison_result.i126.i = icmp slt i256 %addition_result.i125.i, 0
  br i1 %comparison_result.i126.i, label %if_main2.i128.i, label %if_join3.i133.i

if_main2.i128.i:                                  ; preds = %if_join.i127.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i133.i:                                  ; preds = %if_join.i127.i
  %memory_load_result.i129.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i130.i = inttoptr i256 %memory_load_result.i129.i to ptr addrspace(1)
  store i256 300, ptr addrspace(1) %memory_store_pointer.i130.i, align 1
  %30 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i129.i, i256 4294967295)
  %exit_offset_shifted.i.i131.i = shl nuw nsw i256 %30, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i132.i = or i256 %exit_offset_shifted.i.i131.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i132.i)
  unreachable

switch_case_branch_12_block.i:                    ; preds = %if_main.i
  %get_u128_value.i134.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i135.i = icmp eq i256 %get_u128_value.i134.i, 0
  br i1 %if_condition_compared.not.i135.i, label %if_join.i140.i, label %if_main.i136.i

if_main.i136.i:                                   ; preds = %switch_case_branch_12_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i140.i:                                   ; preds = %switch_case_branch_12_block.i
  %calldatasize.i137.i = load i256, ptr @calldatasize, align 32
  %addition_result.i138.i = add i256 %calldatasize.i137.i, -4
  %comparison_result.i139.i = icmp slt i256 %addition_result.i138.i, 64
  br i1 %comparison_result.i139.i, label %if_main2.i141.i, label %if_join3.i145.i

if_main2.i141.i:                                  ; preds = %if_join.i140.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i145.i:                                  ; preds = %if_join.i140.i
  %calldata_pointer.i142.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i143.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i142.i, i256 4
  %calldata_value.i144.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i143.i, align 32
  %31 = icmp ugt i256 %calldata_value.i144.i, 1461501637330902918203684832716283019655932542975
  br i1 %31, label %if_main.i.i146.i, label %validator_revert_address.exit.i151.i

if_main.i.i146.i:                                 ; preds = %if_join3.i145.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i151.i:             ; preds = %if_join3.i145.i
  %calldata_pointer_with_offset6.i147.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i142.i, i256 36
  %calldata_value7.i148.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset6.i147.i, align 32
  tail call fastcc void @fun_mint(i256 %calldata_value.i144.i, i256 %calldata_value7.i148.i)
  %memory_load_result.i149.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %32 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i149.i, i256 4294967295)
  %exit_offset_shifted.i.i150.i = shl nuw nsw i256 %32, 64
  tail call void @llvm.syncvm.return(i256 %exit_offset_shifted.i.i150.i)
  unreachable

switch_case_branch_13_block.i:                    ; preds = %if_main.i
  %get_u128_value.i152.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i153.i = icmp eq i256 %get_u128_value.i152.i, 0
  br i1 %if_condition_compared.not.i153.i, label %if_join.i158.i, label %if_main.i154.i

if_main.i154.i:                                   ; preds = %switch_case_branch_13_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i158.i:                                   ; preds = %switch_case_branch_13_block.i
  %calldatasize.i155.i = load i256, ptr @calldatasize, align 32
  %addition_result.i156.i = add i256 %calldatasize.i155.i, -4
  %comparison_result.i157.i = icmp slt i256 %addition_result.i156.i, 32
  br i1 %comparison_result.i157.i, label %if_main2.i159.i, label %if_join3.i164.i

if_main2.i159.i:                                  ; preds = %if_join.i158.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i164.i:                                  ; preds = %if_join.i158.i
  %calldata_pointer.i160.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i161.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i160.i, i256 4
  %calldata_value.i162.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i161.i, align 32
  %storage_load.i163.i = tail call i256 @llvm.syncvm.sload(i256 8)
  %comparison_result5.not.i.i = icmp ult i256 %calldata_value.i162.i, %storage_load.i163.i
  br i1 %comparison_result5.not.i.i, label %if_join11.i.i, label %if_main10.i.i

if_main10.i.i:                                    ; preds = %if_join3.i164.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join11.i.i:                                    ; preds = %if_join3.i164.i
  store i256 8, ptr addrspace(1) null, align 4294967296
  %addition_result13.i.i = add i256 %calldata_value.i162.i, -5442482557903504250613150719145357533886713417884903185095341029921719619869
  %storage_load14.i.i = tail call i256 @llvm.syncvm.sload(i256 %addition_result13.i.i)
  %and_result.i165.i = and i256 %storage_load14.i.i, 1461501637330902918203684832716283019655932542975
  %memory_load_result.i166.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i167.i = inttoptr i256 %memory_load_result.i166.i to ptr addrspace(1)
  store i256 %and_result.i165.i, ptr addrspace(1) %memory_store_pointer.i167.i, align 1
  %33 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i166.i, i256 4294967295)
  %exit_offset_shifted.i.i168.i = shl nuw nsw i256 %33, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i169.i = or i256 %exit_offset_shifted.i.i168.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i169.i)
  unreachable

switch_case_branch_14_block.i:                    ; preds = %if_main.i
  tail call fastcc void @external_fun_withdraw()
  unreachable

switch_case_branch_15_block.i:                    ; preds = %if_main.i
  %get_u128_value.i170.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i171.i = icmp eq i256 %get_u128_value.i170.i, 0
  br i1 %if_condition_compared.not.i171.i, label %if_join.i176.i, label %if_main.i172.i

if_main.i172.i:                                   ; preds = %switch_case_branch_15_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i176.i:                                   ; preds = %switch_case_branch_15_block.i
  %calldatasize.i173.i = load i256, ptr @calldatasize, align 32
  %addition_result.i174.i = add i256 %calldatasize.i173.i, -4
  %comparison_result.i175.i = icmp slt i256 %addition_result.i174.i, 32
  br i1 %comparison_result.i175.i, label %if_main2.i177.i, label %if_join3.i181.i

if_main2.i177.i:                                  ; preds = %if_join.i176.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i181.i:                                  ; preds = %if_join.i176.i
  %calldata_pointer.i178.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i179.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i178.i, i256 4
  %calldata_value.i180.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i179.i, align 32
  %34 = icmp ugt i256 %calldata_value.i180.i, 1461501637330902918203684832716283019655932542975
  br i1 %34, label %if_main.i.i182.i, label %validator_revert_address.exit.i191.i

if_main.i.i182.i:                                 ; preds = %if_join3.i181.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i191.i:             ; preds = %if_join3.i181.i
  %and_result.i183.i = and i256 %calldata_value.i180.i, 1461501637330902918203684832716283019655932542975
  store i256 %and_result.i183.i, ptr addrspace(1) null, align 4294967296
  store i256 12, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %keccak256_call.i184.i = tail call fastcc i256 @__keccak256(i256 64)
  %storage_load.i185.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_call.i184.i)
  %memory_load_result.i186.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %shift_right_non_overflow_result.i187.i = lshr i256 %storage_load.i185.i, 216
  %and_result15.i.i = and i256 %storage_load.i185.i, 105312291668557186697918027683670432318895095400549111254310977535
  %memory_store_pointer.i.i188.i = inttoptr i256 %memory_load_result.i186.i to ptr addrspace(1)
  store i256 %and_result15.i.i, ptr addrspace(1) %memory_store_pointer.i.i188.i, align 1
  %addition_result7.i.i.i = add i256 %memory_load_result.i186.i, 32
  %memory_store_pointer8.i.i.i = inttoptr i256 %addition_result7.i.i.i to ptr addrspace(1)
  store i256 %shift_right_non_overflow_result.i187.i, ptr addrspace(1) %memory_store_pointer8.i.i.i, align 1
  %35 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i186.i, i256 4294967295)
  %exit_offset_shifted.i.i189.i = shl nuw nsw i256 %35, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i190.i = or i256 %exit_offset_shifted.i.i189.i, 5070602400912917605986812821504
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i190.i)
  unreachable

switch_case_branch_16_block.i:                    ; preds = %if_main.i
  %get_u128_value.i192.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i193.i = icmp eq i256 %get_u128_value.i192.i, 0
  br i1 %if_condition_compared.not.i193.i, label %if_join.i198.i, label %if_main.i194.i

if_main.i194.i:                                   ; preds = %switch_case_branch_16_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i198.i:                                   ; preds = %switch_case_branch_16_block.i
  %calldatasize.i195.i = load i256, ptr @calldatasize, align 32
  %addition_result.i196.i = add i256 %calldatasize.i195.i, -4
  %comparison_result.i197.i = icmp slt i256 %addition_result.i196.i, 64
  br i1 %comparison_result.i197.i, label %if_main2.i199.i, label %if_join3.i203.i

if_main2.i199.i:                                  ; preds = %if_join.i198.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i203.i:                                  ; preds = %if_join.i198.i
  %calldata_pointer.i200.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i201.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i200.i, i256 4
  %calldata_value.i202.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i201.i, align 32
  %36 = icmp ugt i256 %calldata_value.i202.i, 1461501637330902918203684832716283019655932542975
  br i1 %36, label %if_main.i.i204.i, label %validator_revert_address.exit.i209.i

if_main.i.i204.i:                                 ; preds = %if_join3.i203.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i209.i:             ; preds = %if_join3.i203.i
  %calldata_pointer_with_offset6.i205.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i200.i, i256 36
  %calldata_value7.i206.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset6.i205.i, align 32
  tail call fastcc void @fun_burn(i256 %calldata_value.i202.i, i256 %calldata_value7.i206.i)
  %memory_load_result.i207.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %37 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i207.i, i256 4294967295)
  %exit_offset_shifted.i.i208.i = shl nuw nsw i256 %37, 64
  tail call void @llvm.syncvm.return(i256 %exit_offset_shifted.i.i208.i)
  unreachable

switch_case_branch_17_block.i:                    ; preds = %if_main.i
  %get_u128_value.i210.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i211.i = icmp eq i256 %get_u128_value.i210.i, 0
  br i1 %if_condition_compared.not.i211.i, label %if_join.i216.i, label %if_main.i212.i

if_main.i212.i:                                   ; preds = %switch_case_branch_17_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i216.i:                                   ; preds = %switch_case_branch_17_block.i
  %calldatasize.i213.i = load i256, ptr @calldatasize, align 32
  %addition_result.i214.i = add i256 %calldatasize.i213.i, -4
  %comparison_result.i215.i = icmp slt i256 %addition_result.i214.i, 32
  br i1 %comparison_result.i215.i, label %if_main2.i217.i, label %if_join3.i221.i

if_main2.i217.i:                                  ; preds = %if_join.i216.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i221.i:                                  ; preds = %if_join.i216.i
  %calldata_pointer.i218.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i219.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i218.i, i256 4
  %calldata_value.i220.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i219.i, align 32
  %38 = icmp ugt i256 %calldata_value.i220.i, 1461501637330902918203684832716283019655932542975
  br i1 %38, label %if_main.i.i222.i, label %validator_revert_address.exit.i234.i

if_main.i.i222.i:                                 ; preds = %if_join3.i221.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i234.i:             ; preds = %if_join3.i221.i
  %and_result.i223.i = and i256 %calldata_value.i220.i, 1461501637330902918203684832716283019655932542975
  store i256 %and_result.i223.i, ptr addrspace(1) null, align 4294967296
  store i256 11, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %keccak256_call.i224.i = tail call fastcc i256 @__keccak256(i256 64)
  %storage_load.i225.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_call.i224.i)
  %memory_load_result.i226.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %shift_right_non_overflow_result.i227.i = lshr i256 %storage_load.i225.i, 216
  %and_result15.i228.i = and i256 %storage_load.i225.i, 105312291668557186697918027683670432318895095400549111254310977535
  %memory_store_pointer.i.i229.i = inttoptr i256 %memory_load_result.i226.i to ptr addrspace(1)
  store i256 %and_result15.i228.i, ptr addrspace(1) %memory_store_pointer.i.i229.i, align 1
  %addition_result7.i.i230.i = add i256 %memory_load_result.i226.i, 32
  %memory_store_pointer8.i.i231.i = inttoptr i256 %addition_result7.i.i230.i to ptr addrspace(1)
  store i256 %shift_right_non_overflow_result.i227.i, ptr addrspace(1) %memory_store_pointer8.i.i231.i, align 1
  %39 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i226.i, i256 4294967295)
  %exit_offset_shifted.i.i232.i = shl nuw nsw i256 %39, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i233.i = or i256 %exit_offset_shifted.i.i232.i, 5070602400912917605986812821504
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i233.i)
  unreachable

switch_case_branch_18_block.i:                    ; preds = %if_main.i
  %get_u128_value.i235.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i236.i = icmp eq i256 %get_u128_value.i235.i, 0
  br i1 %if_condition_compared.not.i236.i, label %if_join.i241.i, label %if_main.i237.i

if_main.i237.i:                                   ; preds = %switch_case_branch_18_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i241.i:                                   ; preds = %switch_case_branch_18_block.i
  %calldatasize.i238.i = load i256, ptr @calldatasize, align 32
  %addition_result.i239.i = add i256 %calldatasize.i238.i, -4
  %comparison_result.i240.i = icmp slt i256 %addition_result.i239.i, 32
  br i1 %comparison_result.i240.i, label %if_main2.i242.i, label %if_join3.i246.i

if_main2.i242.i:                                  ; preds = %if_join.i241.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i246.i:                                  ; preds = %if_join.i241.i
  %calldata_pointer.i243.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i244.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i243.i, i256 4
  %calldata_value.i245.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i244.i, align 32
  %40 = icmp ugt i256 %calldata_value.i245.i, 1461501637330902918203684832716283019655932542975
  br i1 %40, label %if_main.i.i247.i, label %validator_revert_address.exit.i255.i

if_main.i.i247.i:                                 ; preds = %if_join3.i246.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i255.i:             ; preds = %if_join3.i246.i
  %and_result.i248.i = and i256 %calldata_value.i245.i, 1461501637330902918203684832716283019655932542975
  store i256 %and_result.i248.i, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %keccak256_call.i249.i = tail call fastcc i256 @__keccak256(i256 64)
  %storage_load.i250.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_call.i249.i)
  %memory_load_result.i251.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i252.i = inttoptr i256 %memory_load_result.i251.i to ptr addrspace(1)
  store i256 %storage_load.i250.i, ptr addrspace(1) %memory_store_pointer.i252.i, align 1
  %41 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i251.i, i256 4294967295)
  %exit_offset_shifted.i.i253.i = shl nuw nsw i256 %41, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i254.i = or i256 %exit_offset_shifted.i.i253.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i254.i)
  unreachable

switch_case_branch_19_block.i:                    ; preds = %if_main.i
  %get_u128_value.i256.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i257.i = icmp eq i256 %get_u128_value.i256.i, 0
  br i1 %if_condition_compared.not.i257.i, label %if_join.i262.i, label %if_main.i258.i

if_main.i258.i:                                   ; preds = %switch_case_branch_19_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i262.i:                                   ; preds = %switch_case_branch_19_block.i
  %calldatasize.i259.i = load i256, ptr @calldatasize, align 32
  %addition_result.i260.i = add i256 %calldatasize.i259.i, -4
  %comparison_result.i261.i = icmp slt i256 %addition_result.i260.i, 0
  br i1 %comparison_result.i261.i, label %if_main3.i263.i, label %if_join4.i267.i

if_main3.i263.i:                                  ; preds = %if_join.i262.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join4.i267.i:                                  ; preds = %if_join.i262.i
  %storage_load.i264.i = tail call i256 @llvm.syncvm.sload(i256 6)
  %and_result.i265.i = and i256 %storage_load.i264.i, 1461501637330902918203684832716283019655932542975
  %caller.i266.i = tail call i256 @llvm.syncvm.caller()
  %comparison_result9.not.i.i = icmp eq i256 %and_result.i265.i, %caller.i266.i
  %memory_load_result.i271.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  br i1 %comparison_result9.not.i.i, label %require_helper_stringliteral_9924.exit.i.i, label %if_main.i.i270.i

if_main.i.i270.i:                                 ; preds = %if_join4.i267.i
  %memory_store_pointer.i.i268.i = inttoptr i256 %memory_load_result.i271.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i.i268.i, align 1
  %addition_result.i.i269.i = add i256 %memory_load_result.i271.i, 4
  %memory_store_pointer4.i.i.i = inttoptr i256 %addition_result.i.i269.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i.i.i, align 1
  %addition_result6.i.i.i = add i256 %memory_load_result.i271.i, 36
  %memory_store_pointer7.i.i.i = inttoptr i256 %addition_result6.i.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i.i.i, align 1
  %addition_result9.i.i.i = add i256 %memory_load_result.i271.i, 68
  %memory_store_pointer10.i.i.i = inttoptr i256 %addition_result9.i.i.i to ptr addrspace(1)
  store i256 35943731656364841964516503116990081338611484598491072354577564874054038349170, ptr addrspace(1) %memory_store_pointer10.i.i.i, align 1
  %42 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i271.i, i256 4294967295)
  %exit_offset_shifted.i.i.i.i = shl nuw nsw i256 %42, 64
  %exit_abi_data.i.i.i.i = or i256 %exit_offset_shifted.i.i.i.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i.i)
  unreachable

require_helper_stringliteral_9924.exit.i.i:       ; preds = %if_join4.i267.i
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %43 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i271.i, i256 4294967295)
  %44 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_input_offset_shifted.i.i = shl nuw nsw i256 %43, 64
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %44, 192
  %abi_data_add_gas.i.i = or i256 %abi_data_gas_shifted.i.i, %abi_data_input_offset_shifted.i.i
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_add_gas.i.i, 904625697166532776746648320380374280103671755200316906558262375061821325312
  %event_writer_call_external.i.i = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker.i.i, i256 32781, i256 3, i256 -52524777015005588113349992707137368332388074750292320778649315033004770043936, i256 %and_result.i265.i, i256 0, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %event_writer_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %event_writer_call_external.i.i, 1
  br i1 %event_writer_external_result_status_code_boolean.i.i, label %event_join_block.i.i, label %event_failure_block.i.i

event_failure_block.i.i:                          ; preds = %require_helper_stringliteral_9924.exit.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

event_join_block.i.i:                             ; preds = %require_helper_stringliteral_9924.exit.i.i
  %and_result21.i.i = and i256 %storage_load.i264.i, -1461501637330902918203684832716283019655932542976
  tail call void @llvm.syncvm.sstore(i256 6, i256 %and_result21.i.i)
  tail call void @llvm.syncvm.return(i256 %abi_data_input_offset_shifted.i.i)
  unreachable

switch_case_branch_20_block.i:                    ; preds = %if_main.i
  tail call fastcc void @external_fun_rescueFunds()
  unreachable

switch_case_branch_21_block.i:                    ; preds = %if_main.i
  %get_u128_value.i272.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i273.i = icmp eq i256 %get_u128_value.i272.i, 0
  br i1 %if_condition_compared.not.i273.i, label %if_join.i278.i, label %if_main.i274.i

if_main.i274.i:                                   ; preds = %switch_case_branch_21_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i278.i:                                   ; preds = %switch_case_branch_21_block.i
  %calldatasize.i275.i = load i256, ptr @calldatasize, align 32
  %addition_result.i276.i = add i256 %calldatasize.i275.i, -4
  %comparison_result.i277.i = icmp slt i256 %addition_result.i276.i, 0
  br i1 %comparison_result.i277.i, label %if_main2.i279.i, label %if_join3.i286.i

if_main2.i279.i:                                  ; preds = %if_join.i278.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i286.i:                                  ; preds = %if_join.i278.i
  %storage_load.i280.i = tail call i256 @llvm.syncvm.sload(i256 6)
  %and_result.i281.i = and i256 %storage_load.i280.i, 1461501637330902918203684832716283019655932542975
  %memory_load_result.i282.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i283.i = inttoptr i256 %memory_load_result.i282.i to ptr addrspace(1)
  store i256 %and_result.i281.i, ptr addrspace(1) %memory_store_pointer.i283.i, align 1
  %45 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i282.i, i256 4294967295)
  %exit_offset_shifted.i.i284.i = shl nuw nsw i256 %45, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i285.i = or i256 %exit_offset_shifted.i.i284.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i285.i)
  unreachable

switch_case_branch_22_block.i:                    ; preds = %if_main.i
  %get_u128_value.i287.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i288.i = icmp eq i256 %get_u128_value.i287.i, 0
  br i1 %if_condition_compared.not.i288.i, label %if_join.i294.i, label %if_main.i289.i

if_main.i289.i:                                   ; preds = %switch_case_branch_22_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i294.i:                                   ; preds = %switch_case_branch_22_block.i
  %calldatasize.i290.i = load i256, ptr @calldatasize, align 32
  %abi_decode_addresst_addresst_uint256_call.i291.i = tail call fastcc { i256, i256, i256 } @abi_decode_addresst_addresst_uint256(i256 %calldatasize.i290.i)
  %memory_load_result.i292.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %46 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i292.i, i256 4294967295)
  %exit_offset_shifted.i.i293.i = shl nuw nsw i256 %46, 64
  tail call void @llvm.syncvm.return(i256 %exit_offset_shifted.i.i293.i)
  unreachable

switch_case_branch_23_block.i:                    ; preds = %if_main.i
  %get_u128_value.i295.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i296.i = icmp eq i256 %get_u128_value.i295.i, 0
  br i1 %if_condition_compared.not.i296.i, label %if_join.i301.i, label %if_main.i297.i

if_main.i297.i:                                   ; preds = %switch_case_branch_23_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i301.i:                                   ; preds = %switch_case_branch_23_block.i
  %calldatasize.i298.i = load i256, ptr @calldatasize, align 32
  %addition_result.i299.i = add i256 %calldatasize.i298.i, -4
  %comparison_result.i300.i = icmp slt i256 %addition_result.i299.i, 0
  br i1 %comparison_result.i300.i, label %if_main3.i302.i, label %if_join4.i312.i

if_main3.i302.i:                                  ; preds = %if_join.i301.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join4.i312.i:                                  ; preds = %if_join.i301.i
  %memory_load_result.i303.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %storage_load.i304.i = tail call i256 @llvm.syncvm.sload(i256 4)
  %shift_right_non_overflow_result.i305.i = lshr i256 %storage_load.i304.i, 1
  %and_result.i306.i = and i256 %storage_load.i304.i, 1
  %comparison_result14.i307.i = icmp eq i256 %and_result.i306.i, 0
  %and_result20.i308.i = and i256 %shift_right_non_overflow_result.i305.i, 127
  %storemerge86.i309.i = select i1 %comparison_result14.i307.i, i256 %and_result20.i308.i, i256 %shift_right_non_overflow_result.i305.i
  %comparison_result23.i310.i = icmp ugt i256 %storemerge86.i309.i, 31
  %47 = icmp ne i256 %and_result.i306.i, 0
  %comparison_result26.i311.i = xor i1 %47, %comparison_result23.i310.i
  br i1 %comparison_result26.i311.i, label %if_main29.i313.i, label %if_join30.i317.i

if_main29.i313.i:                                 ; preds = %if_join4.i312.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 34, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join30.i317.i:                                 ; preds = %if_join4.i312.i
  %memory_store_pointer.i.i314.i = inttoptr i256 %memory_load_result.i303.i to ptr addrspace(1)
  store i256 %storemerge86.i309.i, ptr addrspace(1) %memory_store_pointer.i.i314.i, align 1
  %addition_result.i.i315.i = add i256 %memory_load_result.i303.i, 32
  br i1 %comparison_result14.i307.i, label %switch_case_branch_1_block.i331.i, label %switch_case_branch_2_block.i333.i

switch_join_block.i326.i:                         ; preds = %for_body.i342.i, %switch_case_branch_2_block.i333.i, %switch_case_branch_1_block.i331.i
  %storemerge.pn.i318.i = phi i256 [ %shift_left_non_overflow_result.i330.i, %switch_case_branch_1_block.i331.i ], [ 0, %switch_case_branch_2_block.i333.i ], [ %addition_result68.i340.i, %for_body.i342.i ]
  %subtraction_result.i319.i = add i256 %storemerge.pn.i318.i, 32
  tail call fastcc void @finalize_allocation(i256 %memory_load_result.i303.i, i256 %subtraction_result.i319.i)
  %memory_load_result75.i320.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %abi_encode_string_call.i321.i = tail call fastcc i256 @abi_encode_string(i256 %memory_load_result75.i320.i, i256 %memory_load_result.i303.i)
  %subtraction_result79.i322.i = sub i256 %abi_encode_string_call.i321.i, %memory_load_result75.i320.i
  %48 = tail call i256 @llvm.umin.i256(i256 %memory_load_result75.i320.i, i256 4294967295)
  %49 = tail call i256 @llvm.umin.i256(i256 %subtraction_result79.i322.i, i256 4294967295)
  %exit_offset_shifted.i83.i323.i = shl nuw nsw i256 %48, 64
  %exit_length_shifted.i.i324.i = shl nuw nsw i256 %49, 96
  %exit_abi_data_add_heap_auxiliary_marker.i.i325.i = or i256 %exit_length_shifted.i.i324.i, %exit_offset_shifted.i83.i323.i
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i325.i)
  unreachable

switch_case_branch_1_block.i331.i:                ; preds = %if_join30.i317.i
  %and_result37.i327.i = and i256 %storage_load.i304.i, -256
  %memory_store_pointer39.i328.i = inttoptr i256 %addition_result.i.i315.i to ptr addrspace(1)
  store i256 %and_result37.i327.i, ptr addrspace(1) %memory_store_pointer39.i328.i, align 1
  %comparison_result41.not.i329.i = icmp eq i256 %storemerge86.i309.i, 0
  %shift_left_non_overflow_result.i330.i = select i1 %comparison_result41.not.i329.i, i256 0, i256 32
  br label %switch_join_block.i326.i

switch_case_branch_2_block.i333.i:                ; preds = %if_join30.i317.i
  store i256 4, ptr addrspace(1) null, align 4294967296
  %comparison_result5588.not.i332.i = icmp eq i256 %storemerge86.i309.i, 0
  br i1 %comparison_result5588.not.i332.i, label %switch_join_block.i326.i, label %for_body.i342.i

for_body.i342.i:                                  ; preds = %switch_case_branch_2_block.i333.i, %for_body.i342.i
  %storemerge90.i334.i = phi i256 [ %addition_result68.i340.i, %for_body.i342.i ], [ 0, %switch_case_branch_2_block.i333.i ]
  %addition_result658789.i335.i = phi i256 [ %addition_result65.i339.i, %for_body.i342.i ], [ -53278079350709166316280423202849322519190186591071851114874353210178472783461, %switch_case_branch_2_block.i333.i ]
  %storage_load58.i336.i = tail call i256 @llvm.syncvm.sload(i256 %addition_result658789.i335.i)
  %addition_result61.i337.i = add i256 %storemerge90.i334.i, %addition_result.i.i315.i
  %memory_store_pointer62.i338.i = inttoptr i256 %addition_result61.i337.i to ptr addrspace(1)
  store i256 %storage_load58.i336.i, ptr addrspace(1) %memory_store_pointer62.i338.i, align 1
  %addition_result65.i339.i = add nuw nsw i256 %addition_result658789.i335.i, 1
  %addition_result68.i340.i = add nuw i256 %storemerge90.i334.i, 32
  %comparison_result55.i341.i = icmp ult i256 %addition_result68.i340.i, %storemerge86.i309.i
  br i1 %comparison_result55.i341.i, label %for_body.i342.i, label %switch_join_block.i326.i

switch_case_branch_24_block.i:                    ; preds = %if_main.i
  tail call fastcc void @external_fun_decreaseAllowance()
  unreachable

switch_case_branch_25_block.i:                    ; preds = %if_main.i
  %get_u128_value.i343.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i344.i = icmp eq i256 %get_u128_value.i343.i, 0
  br i1 %if_condition_compared.not.i344.i, label %if_join.i349.i, label %if_main.i345.i

if_main.i345.i:                                   ; preds = %switch_case_branch_25_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i349.i:                                   ; preds = %switch_case_branch_25_block.i
  %calldatasize.i346.i = load i256, ptr @calldatasize, align 32
  %addition_result.i347.i = add i256 %calldatasize.i346.i, -4
  %comparison_result.i348.i = icmp slt i256 %addition_result.i347.i, 64
  br i1 %comparison_result.i348.i, label %if_main2.i350.i, label %if_join3.i354.i

if_main2.i350.i:                                  ; preds = %if_join.i349.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i354.i:                                  ; preds = %if_join.i349.i
  %calldata_pointer.i351.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i352.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i351.i, i256 4
  %calldata_value.i353.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i352.i, align 32
  %50 = icmp ugt i256 %calldata_value.i353.i, 1461501637330902918203684832716283019655932542975
  br i1 %50, label %if_main.i.i355.i, label %validator_revert_address.exit.i363.i

if_main.i.i355.i:                                 ; preds = %if_join3.i354.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i363.i:             ; preds = %if_join3.i354.i
  %calldata_pointer_with_offset6.i356.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i351.i, i256 36
  %calldata_value7.i357.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset6.i356.i, align 32
  %caller.i358.i = tail call i256 @llvm.syncvm.caller()
  tail call fastcc void @fun_transfer(i256 %caller.i358.i, i256 %calldata_value.i353.i, i256 %calldata_value7.i357.i)
  %memory_load_result.i359.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i360.i = inttoptr i256 %memory_load_result.i359.i to ptr addrspace(1)
  store i256 1, ptr addrspace(1) %memory_store_pointer.i360.i, align 1
  %51 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i359.i, i256 4294967295)
  %exit_offset_shifted.i.i361.i = shl nuw nsw i256 %51, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i362.i = or i256 %exit_offset_shifted.i.i361.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i362.i)
  unreachable

switch_case_branch_26_block.i:                    ; preds = %if_main.i
  %get_u128_value.i364.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i365.i = icmp eq i256 %get_u128_value.i364.i, 0
  br i1 %if_condition_compared.not.i365.i, label %if_join.i370.i, label %if_main.i366.i

if_main.i366.i:                                   ; preds = %switch_case_branch_26_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i370.i:                                   ; preds = %switch_case_branch_26_block.i
  %calldatasize.i367.i = load i256, ptr @calldatasize, align 32
  %addition_result.i368.i = add i256 %calldatasize.i367.i, -4
  %comparison_result.i369.i = icmp slt i256 %addition_result.i368.i, 0
  br i1 %comparison_result.i369.i, label %if_main2.i371.i, label %if_join3.i374.i

if_main2.i371.i:                                  ; preds = %if_join.i370.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i374.i:                                  ; preds = %if_join.i370.i
  %memory_load_result.i.i372.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %storage_load.i.i.i = tail call i256 @llvm.syncvm.sload(i256 8)
  %memory_store_pointer.i.i373.i = inttoptr i256 %memory_load_result.i.i372.i to ptr addrspace(1)
  store i256 %storage_load.i.i.i, ptr addrspace(1) %memory_store_pointer.i.i373.i, align 1
  store i256 8, ptr addrspace(1) null, align 4294967296
  %pos.033.i.i.i = add i256 %memory_load_result.i.i372.i, 32
  %comparison_result34.not.i.i.i = icmp eq i256 %storage_load.i.i.i, 0
  br i1 %comparison_result34.not.i.i.i, label %for_join.i.i.i, label %for_body.i.i.i

for_body.i.i.i:                                   ; preds = %if_join3.i374.i, %for_body.i.i.i
  %pos.037.i.i.i = phi i256 [ %pos.0.i.i.i, %for_body.i.i.i ], [ %pos.033.i.i.i, %if_join3.i374.i ]
  %i.036.i.i.i = phi i256 [ %addition_result17.i.i.i, %for_body.i.i.i ], [ 0, %if_join3.i374.i ]
  %srcPtr.035.i.i.i = phi i256 [ %addition_result15.i.i.i, %for_body.i.i.i ], [ -5442482557903504250613150719145357533886713417884903185095341029921719619869, %if_join3.i374.i ]
  %storage_load8.i.i.i = tail call i256 @llvm.syncvm.sload(i256 %srcPtr.035.i.i.i)
  %and_result.i.i.i = and i256 %storage_load8.i.i.i, 1461501637330902918203684832716283019655932542975
  %memory_store_pointer10.i.i375.i = inttoptr i256 %pos.037.i.i.i to ptr addrspace(1)
  store i256 %and_result.i.i.i, ptr addrspace(1) %memory_store_pointer10.i.i375.i, align 1
  %addition_result15.i.i.i = add i256 %srcPtr.035.i.i.i, 1
  %addition_result17.i.i.i = add nuw i256 %i.036.i.i.i, 1
  %pos.0.i.i.i = add i256 %pos.037.i.i.i, 32
  %comparison_result.i.i376.i = icmp ult i256 %addition_result17.i.i.i, %storage_load.i.i.i
  br i1 %comparison_result.i.i376.i, label %for_body.i.i.i, label %for_join.i.i.i

for_join.i.i.i:                                   ; preds = %for_body.i.i.i, %if_join3.i374.i
  %pos.0.lcssa.i.i.i = phi i256 [ %pos.033.i.i.i, %if_join3.i374.i ], [ %pos.0.i.i.i, %for_body.i.i.i ]
  %subtraction_result20.i.i.i = sub i256 31, %memory_load_result.i.i372.i
  %addition_result.i.i.i.i = add i256 %subtraction_result20.i.i.i, %pos.0.lcssa.i.i.i
  %and_result.i.i.i.i = and i256 %addition_result.i.i.i.i, -32
  %addition_result3.i.i.i.i = add i256 %and_result.i.i.i.i, %memory_load_result.i.i372.i
  %comparison_result.i.i.i.i = icmp ult i256 %addition_result3.i.i.i.i, %memory_load_result.i.i372.i
  %comparison_result7.i.i.i.i = icmp ugt i256 %addition_result3.i.i.i.i, 18446744073709551615
  %or_result13.i.i.i.i = or i1 %comparison_result7.i.i.i.i, %comparison_result.i.i.i.i
  br i1 %or_result13.i.i.i.i, label %if_main.i.i.i.i, label %copy_array_from_storage_to_memory_array_contract_IERC20_dyn.exit.i.i

if_main.i.i.i.i:                                  ; preds = %for_join.i.i.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

copy_array_from_storage_to_memory_array_contract_IERC20_dyn.exit.i.i: ; preds = %for_join.i.i.i
  store i256 %addition_result3.i.i.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %addition_result6.i.i = add i256 %addition_result3.i.i.i.i, 32
  %memory_store_pointer.i377.i = inttoptr i256 %addition_result3.i.i.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer.i377.i, align 1
  %memory_load_result11.i.i = load i256, ptr addrspace(1) %memory_store_pointer.i.i373.i, align 1
  %memory_store_pointer14.i.i = inttoptr i256 %addition_result6.i.i to ptr addrspace(1)
  store i256 %memory_load_result11.i.i, ptr addrspace(1) %memory_store_pointer14.i.i, align 1
  %addition_result16.i.i = add i256 %addition_result3.i.i.i.i, 64
  %comparison_result2244.not.i.i = icmp eq i256 %memory_load_result11.i.i, 0
  br i1 %comparison_result2244.not.i.i, label %for_join.i.i, label %for_body.i379.i

for_body.i379.i:                                  ; preds = %copy_array_from_storage_to_memory_array_contract_IERC20_dyn.exit.i.i, %for_body.i379.i
  %storemerge47.i.i = phi i256 [ %addition_result36.i.i, %for_body.i379.i ], [ 0, %copy_array_from_storage_to_memory_array_contract_IERC20_dyn.exit.i.i ]
  %addition_result344246.i.i = phi i256 [ %addition_result34.i.i, %for_body.i379.i ], [ %pos.033.i.i.i, %copy_array_from_storage_to_memory_array_contract_IERC20_dyn.exit.i.i ]
  %addition_result314345.i.i = phi i256 [ %addition_result31.i.i, %for_body.i379.i ], [ %addition_result16.i.i, %copy_array_from_storage_to_memory_array_contract_IERC20_dyn.exit.i.i ]
  %memory_load_pointer25.i.i = inttoptr i256 %addition_result344246.i.i to ptr addrspace(1)
  %memory_load_result26.i.i = load i256, ptr addrspace(1) %memory_load_pointer25.i.i, align 1
  %and_result.i378.i = and i256 %memory_load_result26.i.i, 1461501637330902918203684832716283019655932542975
  %memory_store_pointer28.i.i = inttoptr i256 %addition_result314345.i.i to ptr addrspace(1)
  store i256 %and_result.i378.i, ptr addrspace(1) %memory_store_pointer28.i.i, align 1
  %addition_result31.i.i = add i256 %addition_result314345.i.i, 32
  %addition_result34.i.i = add i256 %addition_result344246.i.i, 32
  %addition_result36.i.i = add nuw i256 %storemerge47.i.i, 1
  %comparison_result22.i.i = icmp ult i256 %addition_result36.i.i, %memory_load_result11.i.i
  br i1 %comparison_result22.i.i, label %for_body.i379.i, label %for_join.i.i

for_join.i.i:                                     ; preds = %for_body.i379.i, %copy_array_from_storage_to_memory_array_contract_IERC20_dyn.exit.i.i
  %addition_result3143.lcssa.i.i = phi i256 [ %addition_result16.i.i, %copy_array_from_storage_to_memory_array_contract_IERC20_dyn.exit.i.i ], [ %addition_result31.i.i, %for_body.i379.i ]
  %subtraction_result39.i.i = sub i256 %addition_result3143.lcssa.i.i, %addition_result3.i.i.i.i
  %52 = tail call i256 @llvm.umin.i256(i256 %addition_result3.i.i.i.i, i256 4294967295)
  %53 = tail call i256 @llvm.umin.i256(i256 %subtraction_result39.i.i, i256 4294967295)
  %exit_offset_shifted.i.i380.i = shl nuw nsw i256 %52, 64
  %exit_length_shifted.i.i381.i = shl nuw nsw i256 %53, 96
  %exit_abi_data_add_heap_auxiliary_marker.i.i382.i = or i256 %exit_length_shifted.i.i381.i, %exit_offset_shifted.i.i380.i
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i382.i)
  unreachable

switch_case_branch_27_block.i:                    ; preds = %if_main.i
  %get_u128_value.i383.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i384.i = icmp eq i256 %get_u128_value.i383.i, 0
  br i1 %if_condition_compared.not.i384.i, label %if_join.i389.i, label %if_main.i385.i

if_main.i385.i:                                   ; preds = %switch_case_branch_27_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i389.i:                                   ; preds = %switch_case_branch_27_block.i
  %calldatasize.i386.i = load i256, ptr @calldatasize, align 32
  %addition_result.i387.i = add i256 %calldatasize.i386.i, -4
  %comparison_result.i388.i = icmp slt i256 %addition_result.i387.i, 32
  br i1 %comparison_result.i388.i, label %if_main2.i390.i, label %if_join3.i394.i

if_main2.i390.i:                                  ; preds = %if_join.i389.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i394.i:                                  ; preds = %if_join.i389.i
  %calldata_pointer.i391.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i392.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i391.i, i256 4
  %calldata_value.i393.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i392.i, align 32
  %54 = icmp ugt i256 %calldata_value.i393.i, 1461501637330902918203684832716283019655932542975
  br i1 %54, label %if_main.i.i395.i, label %validator_revert_address.exit.i404.i

if_main.i.i395.i:                                 ; preds = %if_join3.i394.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i404.i:             ; preds = %if_join3.i394.i
  %and_result.i396.i = and i256 %calldata_value.i393.i, 1461501637330902918203684832716283019655932542975
  store i256 %and_result.i396.i, ptr addrspace(1) null, align 4294967296
  store i256 10, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %keccak256_call.i397.i = tail call fastcc i256 @__keccak256(i256 64)
  %storage_load.i398.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_call.i397.i)
  %memory_load_result.i399.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %and_result7.i.i = and i256 %storage_load.i398.i, 340282366920938463463374607431768211455
  %memory_store_pointer.i400.i = inttoptr i256 %memory_load_result.i399.i to ptr addrspace(1)
  store i256 %and_result7.i.i, ptr addrspace(1) %memory_store_pointer.i400.i, align 1
  %shift_right_non_overflow_result.i401.i = lshr i256 %storage_load.i398.i, 128
  %addition_result11.i.i = add i256 %memory_load_result.i399.i, 32
  %memory_store_pointer12.i.i = inttoptr i256 %addition_result11.i.i to ptr addrspace(1)
  store i256 %shift_right_non_overflow_result.i401.i, ptr addrspace(1) %memory_store_pointer12.i.i, align 1
  %55 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i399.i, i256 4294967295)
  %exit_offset_shifted.i.i402.i = shl nuw nsw i256 %55, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i403.i = or i256 %exit_offset_shifted.i.i402.i, 5070602400912917605986812821504
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i403.i)
  unreachable

switch_case_branch_28_block.i:                    ; preds = %if_main.i
  %get_u128_value.i405.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i406.i = icmp eq i256 %get_u128_value.i405.i, 0
  br i1 %if_condition_compared.not.i406.i, label %if_join.i411.i, label %if_main.i407.i

if_main.i407.i:                                   ; preds = %switch_case_branch_28_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i411.i:                                   ; preds = %switch_case_branch_28_block.i
  %calldatasize.i408.i = load i256, ptr @calldatasize, align 32
  %addition_result.i409.i = add i256 %calldatasize.i408.i, -4
  %comparison_result.i410.i = icmp slt i256 %addition_result.i409.i, 0
  br i1 %comparison_result.i410.i, label %if_main2.i412.i, label %if_join3.i417.i

if_main2.i412.i:                                  ; preds = %if_join.i411.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i417.i:                                  ; preds = %if_join.i411.i
  %memory_load_result.i413.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i414.i = inttoptr i256 %memory_load_result.i413.i to ptr addrspace(1)
  store i256 20, ptr addrspace(1) %memory_store_pointer.i414.i, align 1
  %56 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i413.i, i256 4294967295)
  %exit_offset_shifted.i.i415.i = shl nuw nsw i256 %56, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i416.i = or i256 %exit_offset_shifted.i.i415.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i416.i)
  unreachable

switch_case_branch_29_block.i:                    ; preds = %if_main.i
  %get_u128_value.i418.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i419.i = icmp eq i256 %get_u128_value.i418.i, 0
  br i1 %if_condition_compared.not.i419.i, label %if_join.i424.i, label %if_main.i420.i

if_main.i420.i:                                   ; preds = %switch_case_branch_29_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i424.i:                                   ; preds = %switch_case_branch_29_block.i
  %calldatasize.i421.i = load i256, ptr @calldatasize, align 32
  %addition_result.i422.i = add i256 %calldatasize.i421.i, -4
  %comparison_result.i423.i = icmp slt i256 %addition_result.i422.i, 0
  br i1 %comparison_result.i423.i, label %if_main2.i425.i, label %if_join3.i430.i

if_main2.i425.i:                                  ; preds = %if_join.i424.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i430.i:                                  ; preds = %if_join.i424.i
  %memory_load_result.i426.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i427.i = inttoptr i256 %memory_load_result.i426.i to ptr addrspace(1)
  store i256 1000, ptr addrspace(1) %memory_store_pointer.i427.i, align 1
  %57 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i426.i, i256 4294967295)
  %exit_offset_shifted.i.i428.i = shl nuw nsw i256 %57, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i429.i = or i256 %exit_offset_shifted.i.i428.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i429.i)
  unreachable

switch_case_branch_30_block.i:                    ; preds = %if_main.i
  %get_u128_value.i431.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i432.i = icmp eq i256 %get_u128_value.i431.i, 0
  br i1 %if_condition_compared.not.i432.i, label %if_join.i437.i, label %if_main.i433.i

if_main.i433.i:                                   ; preds = %switch_case_branch_30_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i437.i:                                   ; preds = %switch_case_branch_30_block.i
  %calldatasize.i434.i = load i256, ptr @calldatasize, align 32
  %addition_result.i435.i = add i256 %calldatasize.i434.i, -4
  %comparison_result.i436.i = icmp slt i256 %addition_result.i435.i, 0
  br i1 %comparison_result.i436.i, label %if_main2.i438.i, label %if_join3.i445.i

if_main2.i438.i:                                  ; preds = %if_join.i437.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i445.i:                                  ; preds = %if_join.i437.i
  %storage_load.i439.i = tail call i256 @llvm.syncvm.sload(i256 7)
  %and_result.i440.i = and i256 %storage_load.i439.i, 1461501637330902918203684832716283019655932542975
  %memory_load_result.i441.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i442.i = inttoptr i256 %memory_load_result.i441.i to ptr addrspace(1)
  store i256 %and_result.i440.i, ptr addrspace(1) %memory_store_pointer.i442.i, align 1
  %58 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i441.i, i256 4294967295)
  %exit_offset_shifted.i.i443.i = shl nuw nsw i256 %58, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i444.i = or i256 %exit_offset_shifted.i.i443.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i444.i)
  unreachable

switch_case_branch_31_block.i:                    ; preds = %if_main.i
  %get_u128_value.i446.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i447.i = icmp eq i256 %get_u128_value.i446.i, 0
  br i1 %if_condition_compared.not.i447.i, label %if_join.i453.i, label %if_main.i448.i

if_main.i448.i:                                   ; preds = %switch_case_branch_31_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i453.i:                                   ; preds = %switch_case_branch_31_block.i
  %calldatasize.i449.i = load i256, ptr @calldatasize, align 32
  %abi_decode_addresst_addresst_uint256_call.i450.i = tail call fastcc { i256, i256, i256 } @abi_decode_addresst_addresst_uint256(i256 %calldatasize.i449.i)
  %memory_load_result.i451.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %59 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i451.i, i256 4294967295)
  %exit_offset_shifted.i.i452.i = shl nuw nsw i256 %59, 64
  tail call void @llvm.syncvm.return(i256 %exit_offset_shifted.i.i452.i)
  unreachable

switch_case_branch_32_block.i:                    ; preds = %if_main.i
  tail call fastcc void @external_fun_swap()
  unreachable

switch_case_branch_33_block.i:                    ; preds = %if_main.i
  %get_u128_value.i455.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i456.i = icmp eq i256 %get_u128_value.i455.i, 0
  br i1 %if_condition_compared.not.i456.i, label %if_join.i461.i, label %if_main.i457.i

if_main.i457.i:                                   ; preds = %switch_case_branch_33_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i461.i:                                   ; preds = %switch_case_branch_33_block.i
  %calldatasize.i458.i = load i256, ptr @calldatasize, align 32
  %addition_result.i459.i = add i256 %calldatasize.i458.i, -4
  %comparison_result.i460.i = icmp slt i256 %addition_result.i459.i, 0
  br i1 %comparison_result.i460.i, label %if_main2.i462.i, label %if_join3.i467.i

if_main2.i462.i:                                  ; preds = %if_join.i461.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i467.i:                                  ; preds = %if_join.i461.i
  %memory_load_result.i463.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i464.i = inttoptr i256 %memory_load_result.i463.i to ptr addrspace(1)
  store i256 1000000000000000000, ptr addrspace(1) %memory_store_pointer.i464.i, align 1
  %60 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i463.i, i256 4294967295)
  %exit_offset_shifted.i.i465.i = shl nuw nsw i256 %60, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i466.i = or i256 %exit_offset_shifted.i.i465.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i466.i)
  unreachable

switch_case_branch_34_block.i:                    ; preds = %if_main.i
  %get_u128_value.i468.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i469.i = icmp eq i256 %get_u128_value.i468.i, 0
  br i1 %if_condition_compared.not.i469.i, label %if_join.i474.i, label %if_main.i470.i

if_main.i470.i:                                   ; preds = %switch_case_branch_34_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i474.i:                                   ; preds = %switch_case_branch_34_block.i
  %calldatasize.i471.i = load i256, ptr @calldatasize, align 32
  %addition_result.i472.i = add i256 %calldatasize.i471.i, -4
  %comparison_result.i473.i = icmp slt i256 %addition_result.i472.i, 32
  br i1 %comparison_result.i473.i, label %if_main2.i475.i, label %if_join3.i479.i

if_main2.i475.i:                                  ; preds = %if_join.i474.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i479.i:                                  ; preds = %if_join.i474.i
  %calldata_pointer.i476.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i477.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i476.i, i256 4
  %calldata_value.i478.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i477.i, align 32
  %61 = icmp ugt i256 %calldata_value.i478.i, 1461501637330902918203684832716283019655932542975
  br i1 %61, label %if_main.i.i480.i, label %validator_revert_address.exit.i486.i

if_main.i.i480.i:                                 ; preds = %if_join3.i479.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i486.i:             ; preds = %if_join3.i479.i
  %fun_getBalanceForAddition_call.i481.i = tail call fastcc i256 @fun_getBalanceForAddition(i256 %calldata_value.i478.i)
  %memory_load_result.i482.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i483.i = inttoptr i256 %memory_load_result.i482.i to ptr addrspace(1)
  store i256 %fun_getBalanceForAddition_call.i481.i, ptr addrspace(1) %memory_store_pointer.i483.i, align 1
  %62 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i482.i, i256 4294967295)
  %exit_offset_shifted.i.i484.i = shl nuw nsw i256 %62, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i485.i = or i256 %exit_offset_shifted.i.i484.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i485.i)
  unreachable

switch_case_branch_35_block.i:                    ; preds = %if_main.i
  %get_u128_value.i487.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i488.i = icmp eq i256 %get_u128_value.i487.i, 0
  br i1 %if_condition_compared.not.i488.i, label %if_join.i493.i, label %if_main.i489.i

if_main.i489.i:                                   ; preds = %switch_case_branch_35_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i493.i:                                   ; preds = %switch_case_branch_35_block.i
  %calldatasize.i490.i = load i256, ptr @calldatasize, align 32
  %addition_result.i491.i = add i256 %calldatasize.i490.i, -4
  %comparison_result.i492.i = icmp slt i256 %addition_result.i491.i, 64
  br i1 %comparison_result.i492.i, label %if_main2.i494.i, label %if_join3.i498.i

if_main2.i494.i:                                  ; preds = %if_join.i493.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i498.i:                                  ; preds = %if_join.i493.i
  %calldata_pointer.i495.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i496.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i495.i, i256 4
  %calldata_value.i497.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i496.i, align 32
  %63 = icmp ugt i256 %calldata_value.i497.i, 1461501637330902918203684832716283019655932542975
  br i1 %63, label %if_main.i.i499.i, label %validator_revert_address.exit.i502.i

if_main.i.i499.i:                                 ; preds = %if_join3.i498.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i502.i:             ; preds = %if_join3.i498.i
  %calldata_pointer_with_offset6.i500.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i495.i, i256 36
  %calldata_value7.i501.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset6.i500.i, align 32
  %64 = icmp ugt i256 %calldata_value7.i501.i, 1461501637330902918203684832716283019655932542975
  br i1 %64, label %if_main.i15.i.i, label %validator_revert_address.exit16.i.i

if_main.i15.i.i:                                  ; preds = %validator_revert_address.exit.i502.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit16.i.i:              ; preds = %validator_revert_address.exit.i502.i
  %and_result.i503.i = and i256 %calldata_value.i497.i, 1461501637330902918203684832716283019655932542975
  store i256 %and_result.i503.i, ptr addrspace(1) null, align 4294967296
  store i256 1, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %keccak256_call.i504.i = tail call fastcc i256 @__keccak256(i256 64)
  %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_call.i505.i = tail call fastcc i256 @mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20(i256 %keccak256_call.i504.i, i256 %calldata_value7.i501.i)
  %storage_load.i506.i = tail call i256 @llvm.syncvm.sload(i256 %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_call.i505.i)
  %memory_load_result.i507.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i508.i = inttoptr i256 %memory_load_result.i507.i to ptr addrspace(1)
  store i256 %storage_load.i506.i, ptr addrspace(1) %memory_store_pointer.i508.i, align 1
  %65 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i507.i, i256 4294967295)
  %exit_offset_shifted.i.i509.i = shl nuw nsw i256 %65, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i510.i = or i256 %exit_offset_shifted.i.i509.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i510.i)
  unreachable

switch_case_branch_36_block.i:                    ; preds = %if_main.i
  %get_u128_value.i511.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i512.i = icmp eq i256 %get_u128_value.i511.i, 0
  br i1 %if_condition_compared.not.i512.i, label %if_join.i517.i, label %if_main.i513.i

if_main.i513.i:                                   ; preds = %switch_case_branch_36_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i517.i:                                   ; preds = %switch_case_branch_36_block.i
  %calldatasize.i514.i = load i256, ptr @calldatasize, align 32
  %addition_result.i515.i = add i256 %calldatasize.i514.i, -4
  %comparison_result.i516.i = icmp slt i256 %addition_result.i515.i, 0
  br i1 %comparison_result.i516.i, label %if_main2.i518.i, label %if_join3.i523.i

if_main2.i518.i:                                  ; preds = %if_join.i517.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i523.i:                                  ; preds = %if_join.i517.i
  %fun_fee_call.i.i = tail call fastcc i256 @fun_fee()
  %memory_load_result.i519.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i520.i = inttoptr i256 %memory_load_result.i519.i to ptr addrspace(1)
  store i256 %fun_fee_call.i.i, ptr addrspace(1) %memory_store_pointer.i520.i, align 1
  %66 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i519.i, i256 4294967295)
  %exit_offset_shifted.i.i521.i = shl nuw nsw i256 %66, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i522.i = or i256 %exit_offset_shifted.i.i521.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i522.i)
  unreachable

switch_case_branch_37_block.i:                    ; preds = %if_main.i
  %get_u128_value.i524.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i525.i = icmp eq i256 %get_u128_value.i524.i, 0
  br i1 %if_condition_compared.not.i525.i, label %if_join.i530.i, label %if_main.i526.i

if_main.i526.i:                                   ; preds = %switch_case_branch_37_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i530.i:                                   ; preds = %switch_case_branch_37_block.i
  %calldatasize.i527.i = load i256, ptr @calldatasize, align 32
  %addition_result.i528.i = add i256 %calldatasize.i527.i, -4
  %comparison_result.i529.i = icmp slt i256 %addition_result.i528.i, 32
  br i1 %comparison_result.i529.i, label %if_main2.i531.i, label %if_join3.i535.i

if_main2.i531.i:                                  ; preds = %if_join.i530.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i535.i:                                  ; preds = %if_join.i530.i
  %calldata_pointer.i532.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i533.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i532.i, i256 4
  %calldata_value.i534.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i533.i, align 32
  %67 = icmp ugt i256 %calldata_value.i534.i, 1461501637330902918203684832716283019655932542975
  br i1 %67, label %if_main.i.i536.i, label %validator_revert_address.exit.i542.i

if_main.i.i536.i:                                 ; preds = %if_join3.i535.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i542.i:             ; preds = %if_join3.i535.i
  %fun_getBalanceForRemoval_call.i537.i = tail call fastcc i256 @fun_getBalanceForRemoval(i256 %calldata_value.i534.i)
  %memory_load_result.i538.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i539.i = inttoptr i256 %memory_load_result.i538.i to ptr addrspace(1)
  store i256 %fun_getBalanceForRemoval_call.i537.i, ptr addrspace(1) %memory_store_pointer.i539.i, align 1
  %68 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i538.i, i256 4294967295)
  %exit_offset_shifted.i.i540.i = shl nuw nsw i256 %68, 64
  %exit_abi_data_add_heap_auxiliary_marker.i.i541.i = or i256 %exit_offset_shifted.i.i540.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i.i541.i)
  unreachable

switch_case_branch_38_block.i:                    ; preds = %if_main.i
  tail call fastcc void @external_fun_deposit()
  unreachable

switch_case_branch_39_block.i:                    ; preds = %if_main.i
  %get_u128_value.i543.i = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not.i544.i = icmp eq i256 %get_u128_value.i543.i, 0
  br i1 %if_condition_compared.not.i544.i, label %if_join.i549.i, label %if_main.i545.i

if_main.i545.i:                                   ; preds = %switch_case_branch_39_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i549.i:                                   ; preds = %switch_case_branch_39_block.i
  %calldatasize.i546.i = load i256, ptr @calldatasize, align 32
  %addition_result.i547.i = add i256 %calldatasize.i546.i, -4
  %comparison_result.i548.i = icmp slt i256 %addition_result.i547.i, 32
  br i1 %comparison_result.i548.i, label %if_main2.i550.i, label %if_join3.i554.i

if_main2.i550.i:                                  ; preds = %if_join.i549.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3.i554.i:                                  ; preds = %if_join.i549.i
  %calldata_pointer.i551.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i552.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i551.i, i256 4
  %calldata_value.i553.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i552.i, align 32
  %69 = icmp ugt i256 %calldata_value.i553.i, 1461501637330902918203684832716283019655932542975
  br i1 %69, label %if_main.i.i555.i, label %validator_revert_address.exit.i559.i

if_main.i.i555.i:                                 ; preds = %if_join3.i554.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i559.i:             ; preds = %if_join3.i554.i
  %storage_load.i556.i = tail call i256 @llvm.syncvm.sload(i256 6)
  %and_result.i557.i = and i256 %storage_load.i556.i, 1461501637330902918203684832716283019655932542975
  %caller.i558.i = tail call i256 @llvm.syncvm.caller()
  %comparison_result7.not.i.i = icmp eq i256 %and_result.i557.i, %caller.i558.i
  br i1 %comparison_result7.not.i.i, label %require_helper_stringliteral_9924.exit.i570.i, label %if_main.i45.i.i

if_main.i45.i.i:                                  ; preds = %validator_revert_address.exit.i559.i
  %memory_load_result.i.i560.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i561.i = inttoptr i256 %memory_load_result.i.i560.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i.i561.i, align 1
  %addition_result.i.i562.i = add i256 %memory_load_result.i.i560.i, 4
  %memory_store_pointer4.i.i563.i = inttoptr i256 %addition_result.i.i562.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i.i563.i, align 1
  %addition_result6.i.i564.i = add i256 %memory_load_result.i.i560.i, 36
  %memory_store_pointer7.i.i565.i = inttoptr i256 %addition_result6.i.i564.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i.i565.i, align 1
  %addition_result9.i.i566.i = add i256 %memory_load_result.i.i560.i, 68
  %memory_store_pointer10.i.i567.i = inttoptr i256 %addition_result9.i.i566.i to ptr addrspace(1)
  store i256 35943731656364841964516503116990081338611484598491072354577564874054038349170, ptr addrspace(1) %memory_store_pointer10.i.i567.i, align 1
  %70 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i560.i, i256 4294967295)
  %exit_offset_shifted.i.i.i568.i = shl nuw nsw i256 %70, 64
  %exit_abi_data.i.i.i569.i = or i256 %exit_offset_shifted.i.i.i568.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i569.i)
  unreachable

require_helper_stringliteral_9924.exit.i570.i:    ; preds = %validator_revert_address.exit.i559.i
  %and_result11.i.i = and i256 %calldata_value.i553.i, 1461501637330902918203684832716283019655932542975
  %comparison_result13.i.i = icmp eq i256 %and_result11.i.i, 0
  %memory_load_result.i571.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  br i1 %comparison_result13.i.i, label %if_main16.i.i, label %if_join17.i.i

if_main16.i.i:                                    ; preds = %require_helper_stringliteral_9924.exit.i570.i
  %memory_store_pointer.i572.i = inttoptr i256 %memory_load_result.i571.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i572.i, align 1
  %addition_result25.i.i = add i256 %memory_load_result.i571.i, 4
  %memory_store_pointer26.i.i = inttoptr i256 %addition_result25.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer26.i.i, align 1
  %addition_result28.i.i = add i256 %memory_load_result.i571.i, 36
  %memory_store_pointer29.i.i = inttoptr i256 %addition_result28.i.i to ptr addrspace(1)
  store i256 38, ptr addrspace(1) %memory_store_pointer29.i.i, align 1
  %addition_result31.i573.i = add i256 %memory_load_result.i571.i, 68
  %memory_store_pointer32.i.i = inttoptr i256 %addition_result31.i573.i to ptr addrspace(1)
  store i256 35943731656364841964517558219894961445653631979235167635064085396828900499553, ptr addrspace(1) %memory_store_pointer32.i.i, align 1
  %addition_result34.i574.i = add i256 %memory_load_result.i571.i, 100
  %memory_store_pointer35.i.i = inttoptr i256 %addition_result34.i574.i to ptr addrspace(1)
  store i256 45408759099000846574684193736602357774271237157169010951590501707763511459840, ptr addrspace(1) %memory_store_pointer35.i.i, align 1
  %71 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i571.i, i256 4294967295)
  %exit_offset_shifted.i.i575.i = shl nuw nsw i256 %71, 64
  %exit_abi_data.i.i.i = or i256 %exit_offset_shifted.i.i575.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i)
  unreachable

if_join17.i.i:                                    ; preds = %require_helper_stringliteral_9924.exit.i570.i
  %gas_left.i576.i = tail call i256 @llvm.syncvm.gasleft()
  %72 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i571.i, i256 4294967295)
  %73 = tail call i256 @llvm.umin.i256(i256 %gas_left.i576.i, i256 4294967295)
  %abi_data_input_offset_shifted.i577.i = shl nuw nsw i256 %72, 64
  %abi_data_gas_shifted.i578.i = shl nuw nsw i256 %73, 192
  %abi_data_add_gas.i579.i = or i256 %abi_data_gas_shifted.i578.i, %abi_data_input_offset_shifted.i577.i
  %abi_data_add_system_call_marker.i580.i = or i256 %abi_data_add_gas.i579.i, 904625697166532776746648320380374280103671755200316906558262375061821325312
  %event_writer_call_external.i581.i = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker.i580.i, i256 32781, i256 3, i256 -52524777015005588113349992707137368332388074750292320778649315033004770043936, i256 %and_result.i557.i, i256 %and_result11.i.i, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %event_writer_external_result_status_code_boolean.i582.i = extractvalue { ptr addrspace(3), i1 } %event_writer_call_external.i581.i, 1
  br i1 %event_writer_external_result_status_code_boolean.i582.i, label %event_join_block.i585.i, label %event_failure_block.i583.i

event_failure_block.i583.i:                       ; preds = %if_join17.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

event_join_block.i585.i:                          ; preds = %if_join17.i.i
  %storage_load.i.i584.i = tail call i256 @llvm.syncvm.sload(i256 6)
  %and_result7.i.i.i = and i256 %storage_load.i.i584.i, -1461501637330902918203684832716283019655932542976
  %or_result.i.i.i = or i256 %and_result7.i.i.i, %and_result11.i.i
  tail call void @llvm.syncvm.sstore(i256 6, i256 %or_result.i.i.i)
  tail call void @llvm.syncvm.return(i256 %abi_data_input_offset_shifted.i577.i)
  unreachable
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc i256 @__keccak256(i256 %0) unnamed_addr #6 personality ptr @__personality {
entry:
  %1 = tail call i256 @llvm.umin.i256(i256 %0, i256 4294967295)
  %gas_left = tail call i256 @llvm.syncvm.gasleft()
  %2 = tail call i256 @llvm.umin.i256(i256 %gas_left, i256 4294967295)
  %abi_data_input_length_shifted = shl nuw nsw i256 %1, 96
  %abi_data_gas_shifted = shl nuw nsw i256 %2, 192
  %abi_data_add_gas = or i256 %abi_data_gas_shifted, %abi_data_input_length_shifted
  %abi_data_add_system_call_marker = or i256 %abi_data_add_gas, 904625697166532776746648320380374280103671755200316906558262375061821325312
  %keccak256_call_external = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external, 1
  br i1 %keccak256_external_result_status_code_boolean, label %keccak256_success_block, label %keccak256_failure_block

keccak256_success_block:                          ; preds = %entry
  %keccak256_call_external_result_abi_data_pointer = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external, 0
  %keccak256_child_data = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer, align 1
  ret i256 %keccak256_child_data

keccak256_failure_block:                          ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable
}

; Function Attrs: nofree noreturn null_pointer_is_valid
define private fastcc void @__deploy() unnamed_addr #7 personality ptr @__personality {
entry:
  store i256 128, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %get_u128_value = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not = icmp eq i256 %get_u128_value, 0
  br i1 %if_condition_compared.not, label %if_join, label %if_main

if_main:                                          ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join:                                          ; preds = %entry
  %calldatasize = load i256, ptr @calldatasize, align 32
  %memory_load_result.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %addition_result.i = add i256 %calldatasize, 31
  %and_result.i = and i256 %addition_result.i, -32
  %addition_result2.i = add i256 %and_result.i, %memory_load_result.i
  %comparison_result.i = icmp ult i256 %addition_result2.i, %memory_load_result.i
  %comparison_result6.i = icmp ugt i256 %addition_result2.i, 18446744073709551615
  %or_result18.i = or i1 %comparison_result6.i, %comparison_result.i
  br i1 %or_result18.i, label %if_main.i, label %allocate_memory.exit

if_main.i:                                        ; preds = %if_join
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

allocate_memory.exit:                             ; preds = %if_join
  store i256 %addition_result2.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %calldata_copy_destination_pointer = inttoptr i256 %memory_load_result.i to ptr addrspace(1)
  %calldata_pointer = load ptr addrspace(3), ptr @ptr_calldata, align 32
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %calldata_copy_destination_pointer, ptr addrspace(3) align 1 %calldata_pointer, i256 %calldatasize, i1 false)
  %addition_result = add i256 %memory_load_result.i, %calldatasize
  %comparison_result = icmp slt i256 %calldatasize, 96
  br i1 %comparison_result, label %if_main13, label %if_join14

if_main13:                                        ; preds = %allocate_memory.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join14:                                        ; preds = %allocate_memory.exit
  %memory_load_result = load i256, ptr addrspace(1) %calldata_copy_destination_pointer, align 1
  %comparison_result19 = icmp ugt i256 %memory_load_result, 18446744073709551615
  br i1 %comparison_result19, label %if_main22, label %if_join23

if_main22:                                        ; preds = %if_join14
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join23:                                        ; preds = %if_join14
  %addition_result26 = add i256 %memory_load_result, %memory_load_result.i
  %_5 = alloca i256, align 32
  store i256 31, ptr %_5, align 32
  %addition_result30 = add i256 %addition_result26, 31
  %comparison_result31.not = icmp slt i256 %addition_result30, %addition_result
  br i1 %comparison_result31.not, label %if_join37, label %if_main36

if_main36:                                        ; preds = %if_join23
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join37:                                        ; preds = %if_join23
  %memory_load_pointer39 = inttoptr i256 %addition_result26 to ptr addrspace(1)
  %memory_load_result40 = load i256, ptr addrspace(1) %memory_load_pointer39, align 1
  %_7 = alloca i256, align 32
  store i256 32, ptr %_7, align 32
  %comparison_result43 = icmp ugt i256 %memory_load_result40, 18446744073709551615
  br i1 %comparison_result43, label %if_main46, label %if_join47

if_main46:                                        ; preds = %if_join37
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join47:                                        ; preds = %if_join37
  %_8 = alloca i256, align 32
  store i256 5, ptr %_8, align 32
  %shift_left_non_overflow_result = shl i256 %memory_load_result40, 5
  %dst = alloca i256, align 32
  %memory_load_result.i904 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %addition_result.i905 = add i256 %shift_left_non_overflow_result, 63
  %and_result.i906 = and i256 %addition_result.i905, -32
  %addition_result2.i907 = add i256 %memory_load_result.i904, %and_result.i906
  %comparison_result.i908 = icmp ult i256 %addition_result2.i907, %memory_load_result.i904
  %comparison_result6.i909 = icmp ugt i256 %addition_result2.i907, 18446744073709551615
  %or_result18.i910 = or i1 %comparison_result6.i909, %comparison_result.i908
  br i1 %or_result18.i910, label %if_main.i911, label %allocate_memory.exit912

if_main.i911:                                     ; preds = %if_join47
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

allocate_memory.exit912:                          ; preds = %if_join47
  store i256 %addition_result2.i907, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  store i256 %memory_load_result.i904, ptr %dst, align 32
  %dst_1 = alloca i256, align 32
  store i256 %memory_load_result.i904, ptr %dst_1, align 32
  %memory_store_pointer67 = inttoptr i256 %memory_load_result.i904 to ptr addrspace(1)
  store i256 %memory_load_result40, ptr addrspace(1) %memory_store_pointer67, align 1
  %addition_result70 = add i256 %memory_load_result.i904, 32
  store i256 %addition_result70, ptr %dst, align 32
  %dst_2 = alloca i256, align 32
  store i256 %addition_result70, ptr %dst_2, align 32
  %addition_result75 = add i256 %addition_result26, 32
  %addition_result76 = add i256 %addition_result75, %shift_left_non_overflow_result
  %comparison_result79 = icmp ugt i256 %addition_result76, %addition_result
  br i1 %comparison_result79, label %if_main82, label %for_condition.preheader

for_condition.preheader:                          ; preds = %allocate_memory.exit912
  %dst.promoted = load i256, ptr %dst, align 32
  %storemerge1094 = add i256 %addition_result26, 32
  %comparison_result891095 = icmp ult i256 %storemerge1094, %addition_result76
  br i1 %comparison_result891095, label %for_body, label %for_join

if_main82:                                        ; preds = %allocate_memory.exit912
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

for_body:                                         ; preds = %for_condition.preheader, %if_join108
  %storemerge1097 = phi i256 [ %storemerge, %if_join108 ], [ %storemerge1094, %for_condition.preheader ]
  %addition_result11610921096 = phi i256 [ %addition_result116, %if_join108 ], [ %dst.promoted, %for_condition.preheader ]
  %memory_load_pointer92 = inttoptr i256 %storemerge1097 to ptr addrspace(1)
  %memory_load_result93 = load i256, ptr addrspace(1) %memory_load_pointer92, align 1
  %0 = icmp ugt i256 %memory_load_result93, 1461501637330902918203684832716283019655932542975
  br i1 %0, label %if_main107, label %if_join108

for_join:                                         ; preds = %if_join108, %for_condition.preheader
  %addition_result1161092.lcssa = phi i256 [ %dst.promoted, %for_condition.preheader ], [ %addition_result116, %if_join108 ]
  store i256 %addition_result1161092.lcssa, ptr %dst, align 32
  %addition_result122 = add i256 %memory_load_result.i, 32
  %memory_load_pointer123 = inttoptr i256 %addition_result122 to ptr addrspace(1)
  %memory_load_result124 = load i256, ptr addrspace(1) %memory_load_pointer123, align 1
  %comparison_result127 = icmp ugt i256 %memory_load_result124, 18446744073709551615
  br i1 %comparison_result127, label %if_main130, label %if_join131

if_main107:                                       ; preds = %for_body
  store i256 %addition_result11610921096, ptr %dst, align 32
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join108:                                       ; preds = %for_body
  %memory_store_pointer113 = inttoptr i256 %addition_result11610921096 to ptr addrspace(1)
  store i256 %memory_load_result93, ptr addrspace(1) %memory_store_pointer113, align 1
  %addition_result116 = add i256 %addition_result11610921096, 32
  %storemerge = add i256 %storemerge1097, 32
  %comparison_result89 = icmp ult i256 %storemerge, %addition_result76
  br i1 %comparison_result89, label %for_body, label %for_join

if_main130:                                       ; preds = %for_join
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join131:                                       ; preds = %for_join
  %value1 = alloca i256, align 32
  %addition_result135 = add i256 %memory_load_result124, %memory_load_result.i
  %addition_result.i916 = add i256 %addition_result135, 31
  %comparison_result.not.i = icmp slt i256 %addition_result.i916, %addition_result
  br i1 %comparison_result.not.i, label %if_join.i, label %if_main.i917

if_main.i917:                                     ; preds = %if_join131
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i:                                        ; preds = %if_join131
  %memory_load_pointer.i = inttoptr i256 %addition_result135 to ptr addrspace(1)
  %memory_load_result.i918 = load i256, ptr addrspace(1) %memory_load_pointer.i, align 1
  %comparison_result7.i = icmp ugt i256 %memory_load_result.i918, 18446744073709551615
  br i1 %comparison_result7.i, label %if_main10.i, label %if_join11.i

if_main10.i:                                      ; preds = %if_join.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join11.i:                                      ; preds = %if_join.i
  %1 = add i256 %memory_load_result.i918, 63
  %memory_load_result.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %and_result.i.i = and i256 %1, -32
  %addition_result2.i.i = add i256 %memory_load_result.i.i, %and_result.i.i
  %comparison_result.i.i = icmp ult i256 %addition_result2.i.i, %memory_load_result.i.i
  %comparison_result6.i.i = icmp ugt i256 %addition_result2.i.i, 18446744073709551615
  %or_result18.i.i = or i1 %comparison_result6.i.i, %comparison_result.i.i
  br i1 %or_result18.i.i, label %if_main.i.i, label %allocate_memory.exit.i

if_main.i.i:                                      ; preds = %if_join11.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

allocate_memory.exit.i:                           ; preds = %if_join11.i
  store i256 %addition_result2.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result.i.i to ptr addrspace(1)
  store i256 %memory_load_result.i918, ptr addrspace(1) %memory_store_pointer.i, align 1
  %addition_result27.i = add i256 %memory_load_result.i918, 32
  %addition_result28.i = add i256 %addition_result27.i, %addition_result135
  %comparison_result29.i = icmp ugt i256 %addition_result28.i, %addition_result
  br i1 %comparison_result29.i, label %if_main32.i, label %for_condition.preheader.i

for_condition.preheader.i:                        ; preds = %allocate_memory.exit.i
  %comparison_result3674.not.i = icmp eq i256 %memory_load_result.i918, 0
  br i1 %comparison_result3674.not.i, label %for_join.i, label %for_body.i

if_main32.i:                                      ; preds = %allocate_memory.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

for_body.i:                                       ; preds = %for_condition.preheader.i, %for_body.i
  %storemerge75.i = phi i256 [ %addition_result41.i, %for_body.i ], [ 0, %for_condition.preheader.i ]
  %addition_result41.i = add i256 %storemerge75.i, 32
  %addition_result42.i = add i256 %addition_result41.i, %addition_result135
  %memory_load_pointer43.i = inttoptr i256 %addition_result42.i to ptr addrspace(1)
  %memory_load_result44.i = load i256, ptr addrspace(1) %memory_load_pointer43.i, align 1
  %addition_result49.i = add i256 %addition_result41.i, %memory_load_result.i.i
  %memory_store_pointer50.i = inttoptr i256 %addition_result49.i to ptr addrspace(1)
  store i256 %memory_load_result44.i, ptr addrspace(1) %memory_store_pointer50.i, align 1
  %comparison_result36.i = icmp ult i256 %addition_result41.i, %memory_load_result.i918
  br i1 %comparison_result36.i, label %for_body.i, label %for_join.i

for_join.i:                                       ; preds = %for_body.i, %for_condition.preheader.i
  %storemerge.lcssa.i = phi i256 [ 0, %for_condition.preheader.i ], [ %addition_result41.i, %for_body.i ]
  %comparison_result56.i = icmp ugt i256 %storemerge.lcssa.i, %memory_load_result.i918
  br i1 %comparison_result56.i, label %if_main59.i, label %abi_decode_string_fromMemory.exit

if_main59.i:                                      ; preds = %for_join.i
  %addition_result64.i = add i256 %memory_load_result.i918, 32
  %addition_result65.i = add i256 %addition_result64.i, %memory_load_result.i.i
  %memory_store_pointer66.i = inttoptr i256 %addition_result65.i to ptr addrspace(1)
  store i256 0, ptr addrspace(1) %memory_store_pointer66.i, align 1
  br label %abi_decode_string_fromMemory.exit

abi_decode_string_fromMemory.exit:                ; preds = %for_join.i, %if_main59.i
  store i256 %memory_load_result.i.i, ptr %value1, align 32
  %addition_result138 = add i256 %memory_load_result.i, 64
  %memory_load_pointer139 = inttoptr i256 %addition_result138 to ptr addrspace(1)
  %memory_load_result140 = load i256, ptr addrspace(1) %memory_load_pointer139, align 1
  %comparison_result143 = icmp ugt i256 %memory_load_result140, 18446744073709551615
  br i1 %comparison_result143, label %if_main146, label %if_join147

if_main146:                                       ; preds = %abi_decode_string_fromMemory.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join147:                                       ; preds = %abi_decode_string_fromMemory.exit
  %value2 = alloca i256, align 32
  %addition_result151 = add i256 %memory_load_result140, %memory_load_result.i
  %addition_result.i920 = add i256 %addition_result151, 31
  %comparison_result.not.i921 = icmp slt i256 %addition_result.i920, %addition_result
  br i1 %comparison_result.not.i921, label %if_join.i926, label %if_main.i922

if_main.i922:                                     ; preds = %if_join147
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i926:                                     ; preds = %if_join147
  %memory_load_pointer.i923 = inttoptr i256 %addition_result151 to ptr addrspace(1)
  %memory_load_result.i924 = load i256, ptr addrspace(1) %memory_load_pointer.i923, align 1
  %comparison_result7.i925 = icmp ugt i256 %memory_load_result.i924, 18446744073709551615
  br i1 %comparison_result7.i925, label %if_main10.i927, label %if_join11.i934

if_main10.i927:                                   ; preds = %if_join.i926
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join11.i934:                                   ; preds = %if_join.i926
  %2 = add i256 %memory_load_result.i924, 63
  %memory_load_result.i.i928 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %and_result.i.i929 = and i256 %2, -32
  %addition_result2.i.i930 = add i256 %memory_load_result.i.i928, %and_result.i.i929
  %comparison_result.i.i931 = icmp ult i256 %addition_result2.i.i930, %memory_load_result.i.i928
  %comparison_result6.i.i932 = icmp ugt i256 %addition_result2.i.i930, 18446744073709551615
  %or_result18.i.i933 = or i1 %comparison_result6.i.i932, %comparison_result.i.i931
  br i1 %or_result18.i.i933, label %if_main.i.i935, label %allocate_memory.exit.i940

if_main.i.i935:                                   ; preds = %if_join11.i934
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

allocate_memory.exit.i940:                        ; preds = %if_join11.i934
  store i256 %addition_result2.i.i930, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i936 = inttoptr i256 %memory_load_result.i.i928 to ptr addrspace(1)
  store i256 %memory_load_result.i924, ptr addrspace(1) %memory_store_pointer.i936, align 1
  %addition_result27.i937 = add i256 %memory_load_result.i924, 32
  %addition_result28.i938 = add i256 %addition_result27.i937, %addition_result151
  %comparison_result29.i939 = icmp ugt i256 %addition_result28.i938, %addition_result
  br i1 %comparison_result29.i939, label %if_main32.i943, label %for_condition.preheader.i942

for_condition.preheader.i942:                     ; preds = %allocate_memory.exit.i940
  %comparison_result3674.not.i941 = icmp eq i256 %memory_load_result.i924, 0
  br i1 %comparison_result3674.not.i941, label %for_join.i957, label %for_body.i954

if_main32.i943:                                   ; preds = %allocate_memory.exit.i940
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

for_body.i954:                                    ; preds = %for_condition.preheader.i942, %for_body.i954
  %storemerge75.i944 = phi i256 [ %addition_result41.i945, %for_body.i954 ], [ 0, %for_condition.preheader.i942 ]
  %addition_result41.i945 = add i256 %storemerge75.i944, 32
  %addition_result42.i946 = add i256 %addition_result41.i945, %addition_result151
  %memory_load_pointer43.i947 = inttoptr i256 %addition_result42.i946 to ptr addrspace(1)
  %memory_load_result44.i948 = load i256, ptr addrspace(1) %memory_load_pointer43.i947, align 1
  %addition_result49.i950 = add i256 %addition_result41.i945, %memory_load_result.i.i928
  %memory_store_pointer50.i951 = inttoptr i256 %addition_result49.i950 to ptr addrspace(1)
  store i256 %memory_load_result44.i948, ptr addrspace(1) %memory_store_pointer50.i951, align 1
  %comparison_result36.i953 = icmp ult i256 %addition_result41.i945, %memory_load_result.i924
  br i1 %comparison_result36.i953, label %for_body.i954, label %for_join.i957

for_join.i957:                                    ; preds = %for_body.i954, %for_condition.preheader.i942
  %storemerge.lcssa.i955 = phi i256 [ 0, %for_condition.preheader.i942 ], [ %addition_result41.i945, %for_body.i954 ]
  %comparison_result56.i956 = icmp ugt i256 %storemerge.lcssa.i955, %memory_load_result.i924
  br i1 %comparison_result56.i956, label %if_main59.i961, label %abi_decode_string_fromMemory.exit962

if_main59.i961:                                   ; preds = %for_join.i957
  %addition_result64.i958 = add i256 %memory_load_result.i924, 32
  %addition_result65.i959 = add i256 %addition_result64.i958, %memory_load_result.i.i928
  %memory_store_pointer66.i960 = inttoptr i256 %addition_result65.i959 to ptr addrspace(1)
  store i256 0, ptr addrspace(1) %memory_store_pointer66.i960, align 1
  br label %abi_decode_string_fromMemory.exit962

abi_decode_string_fromMemory.exit962:             ; preds = %for_join.i957, %if_main59.i961
  store i256 %memory_load_result.i.i928, ptr %value2, align 32
  %memory_load_result155 = load i256, ptr addrspace(1) %memory_store_pointer.i, align 1
  %comparison_result158 = icmp ugt i256 %memory_load_result155, 18446744073709551615
  br i1 %comparison_result158, label %if_main161, label %if_join162

if_main161:                                       ; preds = %abi_decode_string_fromMemory.exit962
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join162:                                       ; preds = %abi_decode_string_fromMemory.exit962
  %storage_load = tail call i256 @llvm.syncvm.sload(i256 3)
  %_13 = alloca i256, align 32
  store i256 1, ptr %_13, align 32
  %shift_right_non_overflow_result = lshr i256 %storage_load, 1
  %and_result174 = and i256 %storage_load, 1
  %comparison_result176 = icmp eq i256 %and_result174, 0
  %and_result182 = and i256 %shift_right_non_overflow_result, 127
  %storemerge1091 = select i1 %comparison_result176, i256 %and_result182, i256 %shift_right_non_overflow_result
  %comparison_result185 = icmp ugt i256 %storemerge1091, 31
  %3 = and i256 %storage_load, 1
  %4 = icmp ne i256 %3, 0
  %comparison_result188 = xor i1 %4, %comparison_result185
  br i1 %comparison_result188, label %if_main191, label %if_join192

if_main191:                                       ; preds = %if_join162
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 34, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join192:                                       ; preds = %if_join162
  %comparison_result200 = icmp ugt i256 %storemerge1091, 31
  br i1 %comparison_result200, label %if_main203, label %if_join204

if_main203:                                       ; preds = %if_join192
  store i256 3, ptr addrspace(1) null, align 4294967296
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %5 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_gas_shifted.i = shl nuw nsw i256 %5, 192
  %abi_data_add_system_call_marker.i = or i256 %abi_data_gas_shifted.i, 904625697166532776746648320380374280103671757735618107014721178055227736064
  %keccak256_call_external.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i, label %__keccak256.exit, label %keccak256_failure_block.i

keccak256_failure_block.i:                        ; preds = %if_main203
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit:                                 ; preds = %if_main203
  %keccak256_call_external_result_abi_data_pointer.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 0
  %keccak256_child_data.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i, align 1
  %addition_result209 = add i256 %memory_load_result155, 31
  %shift_right_non_overflow_result216 = lshr i256 %addition_result209, 5
  %comparison_result222 = icmp ult i256 %memory_load_result155, 32
  %addition_result219 = select i1 %comparison_result222, i256 0, i256 %shift_right_non_overflow_result216
  %spec.store.select = add i256 %keccak256_child_data.i, %addition_result219
  %addition_result230 = add nuw i256 %storemerge1091, 31
  %shift_right_non_overflow_result237 = lshr i256 %addition_result230, 5
  %addition_result240 = add i256 %keccak256_child_data.i, %shift_right_non_overflow_result237
  %comparison_result7.i965 = icmp ult i256 %spec.store.select, %addition_result240
  br i1 %comparison_result7.i965, label %for_body.i968, label %if_join204

if_join204:                                       ; preds = %for_body.i968, %__keccak256.exit, %if_join192
  %srcOffset = alloca i256, align 32
  store i256 32, ptr %srcOffset, align 32
  %comparison_result245 = icmp ugt i256 %memory_load_result155, 31
  br i1 %comparison_result245, label %switch_case_branch_1_block, label %switch_default_block

for_body.i968:                                    ; preds = %__keccak256.exit, %for_body.i968
  %start.08.i = phi i256 [ %addition_result.i966, %for_body.i968 ], [ %spec.store.select, %__keccak256.exit ]
  tail call void @llvm.syncvm.sstore(i256 %start.08.i, i256 0)
  %addition_result.i966 = add nuw i256 %start.08.i, 1
  %comparison_result.i967 = icmp ult i256 %addition_result.i966, %addition_result240
  br i1 %comparison_result.i967, label %for_body.i968, label %if_join204

switch_join_block:                                ; preds = %if_join323, %if_join282
  %or_result.sink = phi i256 [ %or_result, %if_join323 ], [ %addition_result318, %if_join282 ]
  tail call void @llvm.syncvm.sstore(i256 3, i256 %or_result.sink)
  %memory_load_result360 = load i256, ptr addrspace(1) %memory_store_pointer.i936, align 1
  %comparison_result363 = icmp ugt i256 %memory_load_result360, 18446744073709551615
  br i1 %comparison_result363, label %if_main366, label %if_join367

switch_case_branch_1_block:                       ; preds = %if_join204
  %and_result248 = and i256 %memory_load_result155, -32
  store i256 3, ptr addrspace(1) null, align 4294967296
  %dstPtr = alloca i256, align 32
  %gas_left.i970 = tail call i256 @llvm.syncvm.gasleft()
  %6 = tail call i256 @llvm.umin.i256(i256 %gas_left.i970, i256 4294967295)
  %abi_data_gas_shifted.i972 = shl nuw nsw i256 %6, 192
  %abi_data_add_system_call_marker.i974 = or i256 %abi_data_gas_shifted.i972, 904625697166532776746648320380374280103671757735618107014721178055227736064
  %keccak256_call_external.i975 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i974, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i976 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i975, 1
  br i1 %keccak256_external_result_status_code_boolean.i976, label %__keccak256.exit980, label %keccak256_failure_block.i979

keccak256_failure_block.i979:                     ; preds = %switch_case_branch_1_block
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit980:                              ; preds = %switch_case_branch_1_block
  %keccak256_call_external_result_abi_data_pointer.i977 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i975, 0
  %keccak256_child_data.i978 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i977, align 1
  store i256 %keccak256_child_data.i978, ptr %dstPtr, align 32
  %srcOffset.promoted = load i256, ptr %srcOffset, align 32
  %comparison_result2581100.not = icmp eq i256 %and_result248, 0
  br i1 %comparison_result2581100.not, label %for_join255, label %for_body253

for_body253:                                      ; preds = %__keccak256.exit980, %for_body253
  %storemerge8951103 = phi i256 [ %addition_result275, %for_body253 ], [ 0, %__keccak256.exit980 ]
  %addition_result27210981102 = phi i256 [ %addition_result272, %for_body253 ], [ %srcOffset.promoted, %__keccak256.exit980 ]
  %addition_result26910991101 = phi i256 [ %addition_result269, %for_body253 ], [ %keccak256_child_data.i978, %__keccak256.exit980 ]
  %addition_result263 = add i256 %addition_result27210981102, %memory_load_result.i.i
  %memory_load_pointer264 = inttoptr i256 %addition_result263 to ptr addrspace(1)
  %memory_load_result265 = load i256, ptr addrspace(1) %memory_load_pointer264, align 1
  tail call void @llvm.syncvm.sstore(i256 %addition_result26910991101, i256 %memory_load_result265)
  %addition_result269 = add i256 %addition_result26910991101, 1
  %addition_result272 = add i256 %addition_result27210981102, 32
  %addition_result275 = add nuw i256 %storemerge8951103, 32
  %comparison_result258 = icmp ult i256 %addition_result275, %and_result248
  br i1 %comparison_result258, label %for_body253, label %for_join255

for_join255:                                      ; preds = %for_body253, %__keccak256.exit980
  %addition_result2691099.lcssa = phi i256 [ %keccak256_child_data.i978, %__keccak256.exit980 ], [ %addition_result269, %for_body253 ]
  %addition_result2721098.lcssa = phi i256 [ %srcOffset.promoted, %__keccak256.exit980 ], [ %addition_result272, %for_body253 ]
  store i256 %addition_result2721098.lcssa, ptr %srcOffset, align 32
  store i256 %addition_result2691099.lcssa, ptr %dstPtr, align 32
  %comparison_result278 = icmp ult i256 %and_result248, %memory_load_result155
  br i1 %comparison_result278, label %if_main281, label %if_join282

if_main281:                                       ; preds = %for_join255
  %srcOffset283 = load i256, ptr %srcOffset, align 32
  %addition_result285 = add i256 %srcOffset283, %memory_load_result.i.i
  %memory_load_pointer286 = inttoptr i256 %addition_result285 to ptr addrspace(1)
  %memory_load_result287 = load i256, ptr addrspace(1) %memory_load_pointer286, align 1
  %shift_left_non_overflow_result295 = shl i256 %memory_load_result155, 3
  %and_result297 = and i256 %shift_left_non_overflow_result295, 248
  %shift_right_non_overflow_result303 = lshr i256 -1, %and_result297
  %xor_result = xor i256 %shift_right_non_overflow_result303, -1
  %and_result306 = and i256 %memory_load_result287, %xor_result
  %dstPtr307 = load i256, ptr %dstPtr, align 32
  tail call void @llvm.syncvm.sstore(i256 %dstPtr307, i256 %and_result306)
  br label %if_join282

if_join282:                                       ; preds = %if_main281, %for_join255
  %shift_left_non_overflow_result316 = shl i256 %memory_load_result155, 1
  %addition_result318 = or i256 %shift_left_non_overflow_result316, 1
  br label %switch_join_block

switch_default_block:                             ; preds = %if_join204
  %value_1 = alloca i256, align 32
  store i256 0, ptr %value_1, align 32
  %if_condition_compared321.not = icmp eq i256 %memory_load_result155, 0
  br i1 %if_condition_compared321.not, label %if_join323, label %if_main322

if_main322:                                       ; preds = %switch_default_block
  %addition_result326 = add i256 %memory_load_result.i.i, 32
  %memory_load_pointer327 = inttoptr i256 %addition_result326 to ptr addrspace(1)
  %memory_load_result328 = load i256, ptr addrspace(1) %memory_load_pointer327, align 1
  store i256 %memory_load_result328, ptr %value_1, align 32
  br label %if_join323

if_join323:                                       ; preds = %if_main322, %switch_default_block
  %shift_left_non_overflow_result336 = shl i256 %memory_load_result155, 1
  %shift_left_non_overflow_result345 = shl i256 %memory_load_result155, 3
  %shift_right_is_overflow351 = icmp ugt i256 %shift_left_non_overflow_result345, 255
  %shift_right_non_overflow_result352 = lshr i256 -1, %shift_left_non_overflow_result345
  %shift_right_non_overflow_result352.op = xor i256 %shift_right_non_overflow_result352, -1
  %xor_result354 = select i1 %shift_right_is_overflow351, i256 -1, i256 %shift_right_non_overflow_result352.op
  %value_1355 = load i256, ptr %value_1, align 32
  %and_result356 = and i256 %value_1355, %xor_result354
  %or_result = or i256 %and_result356, %shift_left_non_overflow_result336
  br label %switch_join_block

if_main366:                                       ; preds = %switch_join_block
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join367:                                       ; preds = %switch_join_block
  %_14 = alloca i256, align 32
  store i256 4, ptr %_14, align 32
  %storage_load374 = tail call i256 @llvm.syncvm.sload(i256 4)
  %shift_right_non_overflow_result382 = lshr i256 %storage_load374, 1
  %and_result386 = and i256 %storage_load374, 1
  %comparison_result388 = icmp eq i256 %and_result386, 0
  %and_result394 = and i256 %shift_right_non_overflow_result382, 127
  %storemerge1090 = select i1 %comparison_result388, i256 %and_result394, i256 %shift_right_non_overflow_result382
  %comparison_result397 = icmp ugt i256 %storemerge1090, 31
  %7 = and i256 %storage_load374, 1
  %8 = icmp ne i256 %7, 0
  %comparison_result400 = xor i1 %8, %comparison_result397
  br i1 %comparison_result400, label %if_main403, label %if_join404

if_main403:                                       ; preds = %if_join367
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 34, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join404:                                       ; preds = %if_join367
  %comparison_result414 = icmp ugt i256 %storemerge1090, 31
  br i1 %comparison_result414, label %if_main417, label %if_join418

if_main417:                                       ; preds = %if_join404
  store i256 4, ptr addrspace(1) null, align 4294967296
  %gas_left.i983 = tail call i256 @llvm.syncvm.gasleft()
  %9 = tail call i256 @llvm.umin.i256(i256 %gas_left.i983, i256 4294967295)
  %abi_data_gas_shifted.i985 = shl nuw nsw i256 %9, 192
  %abi_data_add_system_call_marker.i987 = or i256 %abi_data_gas_shifted.i985, 904625697166532776746648320380374280103671757735618107014721178055227736064
  %keccak256_call_external.i988 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i987, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i989 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i988, 1
  br i1 %keccak256_external_result_status_code_boolean.i989, label %__keccak256.exit993, label %keccak256_failure_block.i992

keccak256_failure_block.i992:                     ; preds = %if_main417
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit993:                              ; preds = %if_main417
  %keccak256_call_external_result_abi_data_pointer.i990 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i988, 0
  %keccak256_child_data.i991 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i990, align 1
  %addition_result424 = add i256 %memory_load_result360, 31
  %shift_right_non_overflow_result431 = lshr i256 %addition_result424, 5
  %comparison_result437 = icmp ult i256 %memory_load_result360, 32
  %addition_result434 = select i1 %comparison_result437, i256 0, i256 %shift_right_non_overflow_result431
  %spec.store.select1089 = add i256 %keccak256_child_data.i991, %addition_result434
  %_5443 = load i256, ptr %_5, align 32
  %addition_result445 = add i256 %_5443, %storemerge1090
  %shift_right_non_overflow_result452 = lshr i256 %addition_result445, 5
  %addition_result455 = add i256 %shift_right_non_overflow_result452, %keccak256_child_data.i991
  %comparison_result7.i994 = icmp ult i256 %spec.store.select1089, %addition_result455
  br i1 %comparison_result7.i994, label %for_body.i998, label %if_join418

if_join418:                                       ; preds = %for_body.i998, %__keccak256.exit993, %if_join404
  %srcOffset_1 = alloca i256, align 32
  store i256 0, ptr %srcOffset_1, align 32
  %_7457 = load i256, ptr %_7, align 32
  store i256 %_7457, ptr %srcOffset_1, align 32
  %_5458 = load i256, ptr %_5, align 32
  %comparison_result460 = icmp ugt i256 %memory_load_result360, %_5458
  br i1 %comparison_result460, label %switch_case_branch_1_block463, label %switch_default_block538

for_body.i998:                                    ; preds = %__keccak256.exit993, %for_body.i998
  %start.08.i995 = phi i256 [ %addition_result.i996, %for_body.i998 ], [ %spec.store.select1089, %__keccak256.exit993 ]
  tail call void @llvm.syncvm.sstore(i256 %start.08.i995, i256 0)
  %addition_result.i996 = add nuw i256 %start.08.i995, 1
  %comparison_result.i997 = icmp ult i256 %addition_result.i996, %addition_result455
  br i1 %comparison_result.i997, label %for_body.i998, label %if_join418

switch_join_block462:                             ; preds = %if_join542, %if_join499
  %or_result576.sink = phi i256 [ %or_result576, %if_join542 ], [ %addition_result536, %if_join499 ]
  tail call void @llvm.syncvm.sstore(i256 4, i256 %or_result576.sink)
  %_8579 = load i256, ptr %_8, align 32
  tail call void @llvm.syncvm.sstore(i256 %_8579, i256 1)
  %caller = tail call i256 @llvm.syncvm.caller()
  %storage_load588 = tail call i256 @llvm.syncvm.sload(i256 6)
  %and_result589 = and i256 %storage_load588, -1461501637330902918203684832716283019655932542976
  %or_result590 = or i256 %and_result589, %caller
  tail call void @llvm.syncvm.sstore(i256 6, i256 %or_result590)
  %memory_load_result593 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %gas_left = tail call i256 @llvm.syncvm.gasleft()
  %10 = tail call i256 @llvm.umin.i256(i256 %memory_load_result593, i256 4294967295)
  %11 = tail call i256 @llvm.umin.i256(i256 %gas_left, i256 4294967295)
  %abi_data_input_offset_shifted = shl nuw nsw i256 %10, 64
  %abi_data_gas_shifted = shl nuw nsw i256 %11, 192
  %abi_data_add_gas = or i256 %abi_data_gas_shifted, %abi_data_input_offset_shifted
  %abi_data_add_system_call_marker = or i256 %abi_data_add_gas, 904625697166532776746648320380374280103671755200316906558262375061821325312
  %event_writer_call_external = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker, i256 32781, i256 3, i256 -52524777015005588113349992707137368332388074750292320778649315033004770043936, i256 0, i256 %caller, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %event_writer_external_result_status_code_boolean = extractvalue { ptr addrspace(3), i1 } %event_writer_call_external, 1
  br i1 %event_writer_external_result_status_code_boolean, label %event_join_block, label %event_failure_block

switch_case_branch_1_block463:                    ; preds = %if_join418
  %and_result465 = and i256 %memory_load_result360, -32
  store i256 4, ptr addrspace(1) null, align 4294967296
  %dstPtr_1 = alloca i256, align 32
  %12 = tail call i256 @llvm.umin.i256(i256 %_7457, i256 4294967295)
  %gas_left.i1001 = tail call i256 @llvm.syncvm.gasleft()
  %13 = tail call i256 @llvm.umin.i256(i256 %gas_left.i1001, i256 4294967295)
  %abi_data_input_length_shifted.i1002 = shl nuw nsw i256 %12, 96
  %abi_data_gas_shifted.i1003 = shl nuw nsw i256 %13, 192
  %abi_data_add_gas.i1004 = or i256 %abi_data_gas_shifted.i1003, %abi_data_input_length_shifted.i1002
  %abi_data_add_system_call_marker.i1005 = or i256 %abi_data_add_gas.i1004, 904625697166532776746648320380374280103671755200316906558262375061821325312
  %keccak256_call_external.i1006 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i1005, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i1007 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i1006, 1
  br i1 %keccak256_external_result_status_code_boolean.i1007, label %__keccak256.exit1011, label %keccak256_failure_block.i1010

keccak256_failure_block.i1010:                    ; preds = %switch_case_branch_1_block463
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit1011:                             ; preds = %switch_case_branch_1_block463
  %keccak256_call_external_result_abi_data_pointer.i1008 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i1006, 0
  %keccak256_child_data.i1009 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i1008, align 1
  store i256 %keccak256_child_data.i1009, ptr %dstPtr_1, align 32
  %srcOffset_1.promoted = load i256, ptr %srcOffset_1, align 32
  %comparison_result4751108.not = icmp eq i256 %and_result465, 0
  br i1 %comparison_result4751108.not, label %for_join472, label %for_body470

for_body470:                                      ; preds = %__keccak256.exit1011, %for_body470
  %storemerge8891111 = phi i256 [ %addition_result492, %for_body470 ], [ 0, %__keccak256.exit1011 ]
  %addition_result48911061110 = phi i256 [ %addition_result489, %for_body470 ], [ %srcOffset_1.promoted, %__keccak256.exit1011 ]
  %addition_result48611071109 = phi i256 [ %addition_result486, %for_body470 ], [ %keccak256_child_data.i1009, %__keccak256.exit1011 ]
  %addition_result480 = add i256 %addition_result48911061110, %memory_load_result.i.i928
  %memory_load_pointer481 = inttoptr i256 %addition_result480 to ptr addrspace(1)
  %memory_load_result482 = load i256, ptr addrspace(1) %memory_load_pointer481, align 1
  tail call void @llvm.syncvm.sstore(i256 %addition_result48611071109, i256 %memory_load_result482)
  %addition_result486 = add i256 %addition_result48611071109, 1
  %addition_result489 = add i256 %addition_result48911061110, %_7457
  %addition_result492 = add i256 %storemerge8891111, %_7457
  %comparison_result475 = icmp ult i256 %addition_result492, %and_result465
  br i1 %comparison_result475, label %for_body470, label %for_join472

for_join472:                                      ; preds = %for_body470, %__keccak256.exit1011
  %addition_result4861107.lcssa = phi i256 [ %keccak256_child_data.i1009, %__keccak256.exit1011 ], [ %addition_result486, %for_body470 ]
  %addition_result4891106.lcssa = phi i256 [ %srcOffset_1.promoted, %__keccak256.exit1011 ], [ %addition_result489, %for_body470 ]
  store i256 %addition_result4891106.lcssa, ptr %srcOffset_1, align 32
  store i256 %addition_result4861107.lcssa, ptr %dstPtr_1, align 32
  %comparison_result495 = icmp ult i256 %and_result465, %memory_load_result360
  br i1 %comparison_result495, label %if_main498, label %if_join499

if_main498:                                       ; preds = %for_join472
  %srcOffset_1500 = load i256, ptr %srcOffset_1, align 32
  %addition_result502 = add i256 %srcOffset_1500, %memory_load_result.i.i928
  %memory_load_pointer503 = inttoptr i256 %addition_result502 to ptr addrspace(1)
  %memory_load_result504 = load i256, ptr addrspace(1) %memory_load_pointer503, align 1
  %shift_left_non_overflow_result512 = shl i256 %memory_load_result360, 3
  %phi.bo892 = and i256 %shift_left_non_overflow_result512, 248
  %shift_right_non_overflow_result520 = lshr i256 -1, %phi.bo892
  %xor_result522 = xor i256 %shift_right_non_overflow_result520, -1
  %and_result524 = and i256 %memory_load_result504, %xor_result522
  %dstPtr_1525 = load i256, ptr %dstPtr_1, align 32
  tail call void @llvm.syncvm.sstore(i256 %dstPtr_1525, i256 %and_result524)
  br label %if_join499

if_join499:                                       ; preds = %if_main498, %for_join472
  %shift_left_non_overflow_result534 = shl i256 %memory_load_result360, 1
  %addition_result536 = or i256 %shift_left_non_overflow_result534, 1
  br label %switch_join_block462

switch_default_block538:                          ; preds = %if_join418
  %value_2 = alloca i256, align 32
  store i256 0, ptr %value_2, align 32
  %if_condition_compared540.not = icmp eq i256 %memory_load_result360, 0
  br i1 %if_condition_compared540.not, label %if_join542, label %if_main541

if_main541:                                       ; preds = %switch_default_block538
  %addition_result545 = add i256 %_7457, %memory_load_result.i.i928
  %memory_load_pointer546 = inttoptr i256 %addition_result545 to ptr addrspace(1)
  %memory_load_result547 = load i256, ptr addrspace(1) %memory_load_pointer546, align 1
  store i256 %memory_load_result547, ptr %value_2, align 32
  br label %if_join542

if_join542:                                       ; preds = %if_main541, %switch_default_block538
  %shift_left_non_overflow_result555 = shl i256 %memory_load_result360, 1
  %shift_left_non_overflow_result564 = shl i256 %memory_load_result360, 3
  %shift_right_is_overflow570 = icmp ugt i256 %shift_left_non_overflow_result564, 255
  %shift_right_non_overflow_result571 = lshr i256 -1, %shift_left_non_overflow_result564
  %phi.bo = xor i256 %shift_right_non_overflow_result571, -1
  %storemerge886 = select i1 %shift_right_is_overflow570, i256 -1, i256 %phi.bo
  %value_2574 = load i256, ptr %value_2, align 32
  %and_result575 = and i256 %value_2574, %storemerge886
  %or_result576 = or i256 %and_result575, %shift_left_non_overflow_result555
  br label %switch_join_block462

event_failure_block:                              ; preds = %switch_join_block462
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

event_join_block:                                 ; preds = %switch_join_block462
  %value1596 = load i256, ptr %value1, align 32
  %memory_load_pointer597 = inttoptr i256 %value1596 to ptr addrspace(1)
  %memory_load_result598 = load i256, ptr addrspace(1) %memory_load_pointer597, align 1
  %comparison_result599 = icmp eq i256 %memory_load_result598, 0
  br i1 %comparison_result599, label %if_main602, label %if_join603

if_main602:                                       ; preds = %event_join_block
  %memory_store_pointer610 = inttoptr i256 %memory_load_result593 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer610, align 1
  %addition_result614 = add i256 %memory_load_result593, 4
  %memory_store_pointer615 = inttoptr i256 %addition_result614 to ptr addrspace(1)
  store i256 %_7457, ptr addrspace(1) %memory_store_pointer615, align 1
  %addition_result617 = add i256 %memory_load_result593, 36
  %memory_store_pointer618 = inttoptr i256 %addition_result617 to ptr addrspace(1)
  store i256 24, ptr addrspace(1) %memory_store_pointer618, align 1
  %addition_result620 = add i256 %memory_load_result593, 68
  %memory_store_pointer621 = inttoptr i256 %addition_result620 to ptr addrspace(1)
  store i256 35024978435645830422959912897353534415389658970358182022606767564124808282112, ptr addrspace(1) %memory_store_pointer621, align 1
  %exit_abi_data.i = or i256 %abi_data_input_offset_shifted, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i)
  unreachable

if_join603:                                       ; preds = %event_join_block
  %value2623 = load i256, ptr %value2, align 32
  %memory_load_pointer624 = inttoptr i256 %value2623 to ptr addrspace(1)
  %memory_load_result625 = load i256, ptr addrspace(1) %memory_load_pointer624, align 1
  %comparison_result626 = icmp eq i256 %memory_load_result625, 0
  br i1 %comparison_result626, label %if_main629, label %if_join630

if_main629:                                       ; preds = %if_join603
  %memory_load_result633 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer640 = inttoptr i256 %memory_load_result633 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer640, align 1
  %addition_result644 = add i256 %memory_load_result633, 4
  %memory_store_pointer645 = inttoptr i256 %addition_result644 to ptr addrspace(1)
  store i256 %_7457, ptr addrspace(1) %memory_store_pointer645, align 1
  %addition_result647 = add i256 %memory_load_result633, 36
  %memory_store_pointer648 = inttoptr i256 %addition_result647 to ptr addrspace(1)
  store i256 26, ptr addrspace(1) %memory_store_pointer648, align 1
  %addition_result650 = add i256 %memory_load_result633, 68
  %memory_store_pointer651 = inttoptr i256 %addition_result650 to ptr addrspace(1)
  store i256 35024978435645830422959912904798058146092953106480948334532962070870341189632, ptr addrspace(1) %memory_store_pointer651, align 1
  %14 = tail call i256 @llvm.umin.i256(i256 %memory_load_result633, i256 4294967295)
  %exit_offset_shifted.i1014 = shl nuw nsw i256 %14, 64
  %exit_abi_data.i1015 = or i256 %exit_offset_shifted.i1014, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i1015)
  unreachable

if_join630:                                       ; preds = %if_join603
  %dst_1653 = load i256, ptr %dst_1, align 32
  %memory_load_pointer654 = inttoptr i256 %dst_1653 to ptr addrspace(1)
  %memory_load_result655 = load i256, ptr addrspace(1) %memory_load_pointer654, align 1
  %comparison_result656.not = icmp eq i256 %memory_load_result655, 2
  br i1 %comparison_result656.not, label %if_join662, label %if_main661

if_main661:                                       ; preds = %if_join630
  %memory_load_result665 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer672 = inttoptr i256 %memory_load_result665 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer672, align 1
  %addition_result676 = add i256 %memory_load_result665, 4
  %memory_store_pointer677 = inttoptr i256 %addition_result676 to ptr addrspace(1)
  store i256 %_7457, ptr addrspace(1) %memory_store_pointer677, align 1
  %addition_result680 = add i256 %memory_load_result665, 36
  %memory_store_pointer681 = inttoptr i256 %addition_result680 to ptr addrspace(1)
  store i256 %_7457, ptr addrspace(1) %memory_store_pointer681, align 1
  %addition_result683 = add i256 %memory_load_result665, 68
  %memory_store_pointer684 = inttoptr i256 %addition_result683 to ptr addrspace(1)
  store i256 35024978435645830422959912898889232374168255111065316394028018753734620702052, ptr addrspace(1) %memory_store_pointer684, align 1
  %15 = tail call i256 @llvm.umin.i256(i256 %memory_load_result665, i256 4294967295)
  %exit_offset_shifted.i1017 = shl nuw nsw i256 %15, 64
  %exit_abi_data.i1018 = or i256 %exit_offset_shifted.i1017, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i1018)
  unreachable

if_join662:                                       ; preds = %if_join630
  %storage_load688 = tail call i256 @llvm.syncvm.sload(i256 7)
  %and_result689 = and i256 %storage_load688, -1461501637330902918203684832716283019655932542976
  %or_result690 = or i256 %and_result689, %caller
  tail call void @llvm.syncvm.sstore(i256 7, i256 %or_result690)
  %memory_load_result693 = load i256, ptr addrspace(1) %memory_load_pointer654, align 1
  %comparison_result695 = icmp ugt i256 %memory_load_result693, 18446744073709551616
  br i1 %comparison_result695, label %if_main698, label %if_join699

if_main698:                                       ; preds = %if_join662
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join699:                                       ; preds = %if_join662
  %storage_load707 = tail call i256 @llvm.syncvm.sload(i256 8)
  tail call void @llvm.syncvm.sstore(i256 8, i256 %memory_load_result693)
  %comparison_result711 = icmp ult i256 %memory_load_result693, %storage_load707
  br i1 %comparison_result711, label %if_main714, label %if_join715

if_main714:                                       ; preds = %if_join699
  store i256 8, ptr addrspace(1) null, align 4294967296
  %16 = tail call i256 @llvm.umin.i256(i256 %_7457, i256 4294967295)
  %gas_left.i1021 = tail call i256 @llvm.syncvm.gasleft()
  %17 = tail call i256 @llvm.umin.i256(i256 %gas_left.i1021, i256 4294967295)
  %abi_data_input_length_shifted.i1022 = shl nuw nsw i256 %16, 96
  %abi_data_gas_shifted.i1023 = shl nuw nsw i256 %17, 192
  %abi_data_add_gas.i1024 = or i256 %abi_data_gas_shifted.i1023, %abi_data_input_length_shifted.i1022
  %abi_data_add_system_call_marker.i1025 = or i256 %abi_data_add_gas.i1024, 904625697166532776746648320380374280103671755200316906558262375061821325312
  %keccak256_call_external.i1026 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i1025, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i1027 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i1026, 1
  br i1 %keccak256_external_result_status_code_boolean.i1027, label %__keccak256.exit1031, label %keccak256_failure_block.i1030

keccak256_failure_block.i1030:                    ; preds = %if_main714
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit1031:                             ; preds = %if_main714
  %keccak256_call_external_result_abi_data_pointer.i1028 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i1026, 0
  %keccak256_child_data.i1029 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i1028, align 1
  %addition_result720 = add i256 %keccak256_child_data.i1029, %storage_load707
  %addition_result723 = add i256 %keccak256_child_data.i1029, %memory_load_result693
  %comparison_result7.i1032 = icmp ult i256 %addition_result723, %addition_result720
  br i1 %comparison_result7.i1032, label %for_body.i1036, label %if_join715

for_body.i1036:                                   ; preds = %__keccak256.exit1031, %for_body.i1036
  %start.08.i1033 = phi i256 [ %addition_result.i1034, %for_body.i1036 ], [ %addition_result723, %__keccak256.exit1031 ]
  tail call void @llvm.syncvm.sstore(i256 %start.08.i1033, i256 0)
  %addition_result.i1034 = add nuw i256 %start.08.i1033, 1
  %comparison_result.i1035 = icmp ult i256 %addition_result.i1034, %addition_result720
  br i1 %comparison_result.i1035, label %for_body.i1036, label %if_join715

if_join715:                                       ; preds = %for_body.i1036, %__keccak256.exit1031, %if_join699
  %srcPtr = alloca i256, align 32
  %dst_2724 = load i256, ptr %dst_2, align 32
  store i256 %dst_2724, ptr %srcPtr, align 32
  store i256 8, ptr addrspace(1) null, align 4294967296
  %18 = tail call i256 @llvm.umin.i256(i256 %_7457, i256 4294967295)
  %gas_left.i1039 = tail call i256 @llvm.syncvm.gasleft()
  %19 = tail call i256 @llvm.umin.i256(i256 %gas_left.i1039, i256 4294967295)
  %abi_data_input_length_shifted.i1040 = shl nuw nsw i256 %18, 96
  %abi_data_gas_shifted.i1041 = shl nuw nsw i256 %19, 192
  %abi_data_add_gas.i1042 = or i256 %abi_data_gas_shifted.i1041, %abi_data_input_length_shifted.i1040
  %abi_data_add_system_call_marker.i1043 = or i256 %abi_data_add_gas.i1042, 904625697166532776746648320380374280103671755200316906558262375061821325312
  %keccak256_call_external.i1044 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i1043, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i1045 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i1044, 1
  br i1 %keccak256_external_result_status_code_boolean.i1045, label %__keccak256.exit1049, label %keccak256_failure_block.i1048

keccak256_failure_block.i1048:                    ; preds = %if_join715
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit1049:                             ; preds = %if_join715
  %srcPtr.promoted = load i256, ptr %srcPtr, align 32
  %comparison_result7331116.not = icmp eq i256 %memory_load_result693, 0
  br i1 %comparison_result7331116.not, label %for_condition761.preheader, label %for_body728.lr.ph

for_body728.lr.ph:                                ; preds = %__keccak256.exit1049
  %keccak256_call_external_result_abi_data_pointer.i1046 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i1044, 0
  %keccak256_child_data.i1047 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i1046, align 1
  %_13755 = load i256, ptr %_13, align 32
  br label %for_body728

for_condition761.preheader:                       ; preds = %for_body728, %__keccak256.exit1049
  %addition_result7541114.lcssa = phi i256 [ %srcPtr.promoted, %__keccak256.exit1049 ], [ %addition_result754, %for_body728 ]
  store i256 %addition_result7541114.lcssa, ptr %srcPtr, align 32
  %_13765 = load i256, ptr %_13, align 32
  %for_condition_compared766.not = icmp eq i256 %_13765, 0
  br i1 %for_condition_compared766.not, label %for_join764, label %for_body762.lr.ph

for_body762.lr.ph:                                ; preds = %for_condition761.preheader
  %addition_result.i1054 = add i256 %dst_1653, 32
  %memory_store_pointer792 = inttoptr i256 %_7457 to ptr addrspace(1)
  br label %for_body762

for_body728:                                      ; preds = %for_body728.lr.ph, %for_body728
  %storemerge8871119 = phi i256 [ 0, %for_body728.lr.ph ], [ %addition_result760, %for_body728 ]
  %addition_result75411141118 = phi i256 [ %srcPtr.promoted, %for_body728.lr.ph ], [ %addition_result754, %for_body728 ]
  %addition_result75711151117 = phi i256 [ %keccak256_child_data.i1047, %for_body728.lr.ph ], [ %addition_result757, %for_body728 ]
  %memory_load_pointer743 = inttoptr i256 %addition_result75411141118 to ptr addrspace(1)
  %memory_load_result744 = load i256, ptr addrspace(1) %memory_load_pointer743, align 1
  %and_result745 = and i256 %memory_load_result744, 1461501637330902918203684832716283019655932542975
  %storage_load748 = tail call i256 @llvm.syncvm.sload(i256 %addition_result75711151117)
  %and_result749 = and i256 %storage_load748, -1461501637330902918203684832716283019655932542976
  %or_result750 = or i256 %and_result749, %and_result745
  tail call void @llvm.syncvm.sstore(i256 %addition_result75711151117, i256 %or_result750)
  %addition_result754 = add i256 %addition_result75411141118, %_7457
  %addition_result757 = add i256 %_13755, %addition_result75711151117
  %addition_result760 = add i256 %_13755, %storemerge8871119
  %comparison_result733 = icmp ult i256 %addition_result760, %memory_load_result693
  br i1 %comparison_result733, label %for_body728, label %for_condition761.preheader

for_body762:                                      ; preds = %for_body762.lr.ph, %__keccak256.exit1087
  %storemerge8881122 = phi i256 [ 0, %for_body762.lr.ph ], [ %addition_result859, %__keccak256.exit1087 ]
  %memory_load_result769 = load i256, ptr addrspace(1) %memory_load_pointer654, align 1
  %comparison_result771.not = icmp ult i256 %storemerge8881122, %memory_load_result769
  br i1 %comparison_result771.not, label %if_join777, label %for_join764

for_join764:                                      ; preds = %__keccak256.exit1087, %for_body762, %for_condition761.preheader
  store i256 32, ptr addrspace(2) inttoptr (i256 256 to ptr addrspace(2)), align 256
  store i256 0, ptr addrspace(2) inttoptr (i256 288 to ptr addrspace(2)), align 32
  tail call void @llvm.syncvm.return(i256 53919893334301279589334030174039261352344891250716429051063678533632)
  unreachable

if_join777:                                       ; preds = %for_body762
  %shift_left_non_overflow_result.i = shl i256 %storemerge8881122, 5
  %addition_result12.i = add i256 %addition_result.i1054, %shift_left_non_overflow_result.i
  %memory_load_pointer787 = inttoptr i256 %addition_result12.i to ptr addrspace(1)
  %memory_load_result788 = load i256, ptr addrspace(1) %memory_load_pointer787, align 1
  %and_result789 = and i256 %memory_load_result788, 1461501637330902918203684832716283019655932542975
  store i256 %and_result789, ptr addrspace(1) null, align 4294967296
  store i256 9, ptr addrspace(1) %memory_store_pointer792, align 1
  %gas_left.i1056 = tail call i256 @llvm.syncvm.gasleft()
  %20 = tail call i256 @llvm.umin.i256(i256 %gas_left.i1056, i256 4294967295)
  %abi_data_gas_shifted.i1057 = shl nuw nsw i256 %20, 192
  %abi_data_add_system_call_marker.i1059 = or i256 %abi_data_gas_shifted.i1057, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i1060 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i1059, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i1061 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i1060, 1
  br i1 %keccak256_external_result_status_code_boolean.i1061, label %__keccak256.exit1065, label %keccak256_failure_block.i1064

keccak256_failure_block.i1064:                    ; preds = %if_join777
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit1065:                             ; preds = %if_join777
  %keccak256_call_external_result_abi_data_pointer.i1062 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i1060, 0
  %keccak256_child_data.i1063 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i1062, align 1
  %storage_load795 = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i1063)
  %and_result796 = and i256 %storage_load795, 255
  %comparison_result797.not = icmp eq i256 %and_result796, 0
  br i1 %comparison_result797.not, label %if_join803, label %if_main802

if_main802:                                       ; preds = %__keccak256.exit1065
  %memory_load_result806 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer813 = inttoptr i256 %memory_load_result806 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer813, align 1
  %_14815 = load i256, ptr %_14, align 32
  %addition_result817 = add i256 %_14815, %memory_load_result806
  %memory_store_pointer818 = inttoptr i256 %addition_result817 to ptr addrspace(1)
  store i256 %_7457, ptr addrspace(1) %memory_store_pointer818, align 1
  %addition_result820 = add i256 %memory_load_result806, 36
  %memory_store_pointer821 = inttoptr i256 %addition_result820 to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer821, align 1
  %addition_result823 = add i256 %memory_load_result806, 68
  %memory_store_pointer824 = inttoptr i256 %addition_result823 to ptr addrspace(1)
  store i256 35024978435645830422959912882852765394351249352606073590038193966615671865344, ptr addrspace(1) %memory_store_pointer824, align 1
  %21 = tail call i256 @llvm.umin.i256(i256 %memory_load_result806, i256 4294967295)
  %exit_offset_shifted.i1066 = shl nuw nsw i256 %21, 64
  %exit_abi_data.i1067 = or i256 %exit_offset_shifted.i1066, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i1067)
  unreachable

if_join803:                                       ; preds = %__keccak256.exit1065
  %memory_load_result.i1070 = load i256, ptr addrspace(1) %memory_load_pointer654, align 1
  %comparison_result.not.i1071 = icmp ugt i256 %memory_load_result.i1070, %storemerge8881122
  br i1 %comparison_result.not.i1071, label %memory_array_index_access_contract_IERC20_dyn.exit1077, label %if_main.i1072

if_main.i1072:                                    ; preds = %if_join803
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.exit1077: ; preds = %if_join803
  %memory_load_result831 = load i256, ptr addrspace(1) %memory_load_pointer787, align 1
  %and_result832 = and i256 %memory_load_result831, 1461501637330902918203684832716283019655932542975
  store i256 %and_result832, ptr addrspace(1) null, align 4294967296
  store i256 9, ptr addrspace(1) %memory_store_pointer792, align 1
  %gas_left.i1078 = tail call i256 @llvm.syncvm.gasleft()
  %22 = tail call i256 @llvm.umin.i256(i256 %gas_left.i1078, i256 4294967295)
  %abi_data_gas_shifted.i1079 = shl nuw nsw i256 %22, 192
  %abi_data_add_system_call_marker.i1081 = or i256 %abi_data_gas_shifted.i1079, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i1082 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i1081, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i1083 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i1082, 1
  br i1 %keccak256_external_result_status_code_boolean.i1083, label %__keccak256.exit1087, label %keccak256_failure_block.i1086

keccak256_failure_block.i1086:                    ; preds = %memory_array_index_access_contract_IERC20_dyn.exit1077
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit1087:                             ; preds = %memory_array_index_access_contract_IERC20_dyn.exit1077
  %keccak256_call_external_result_abi_data_pointer.i1084 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i1082, 0
  %keccak256_child_data.i1085 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i1084, align 1
  %storage_load840 = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i1085)
  %and_result841 = and i256 %storage_load840, -256
  %or_result842 = or i256 %and_result841, %_13765
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i1085, i256 %or_result842)
  %addition_result859 = add i256 %_13765, %storemerge8881122
  br i1 %for_condition_compared766.not, label %for_join764, label %for_body762
}

; Function Attrs: nofree norecurse nosync null_pointer_is_valid
define private fastcc i256 @abi_encode_string(i256 %0, i256 %1) unnamed_addr #8 personality ptr @__personality {
entry:
  %memory_store_pointer = inttoptr i256 %0 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer, align 1
  %memory_load_pointer = inttoptr i256 %1 to ptr addrspace(1)
  %memory_load_result = load i256, ptr addrspace(1) %memory_load_pointer, align 1
  %addition_result = add i256 %0, 32
  %memory_store_pointer7 = inttoptr i256 %addition_result to ptr addrspace(1)
  store i256 %memory_load_result, ptr addrspace(1) %memory_store_pointer7, align 1
  %comparison_result55.not = icmp eq i256 %memory_load_result, 0
  br i1 %comparison_result55.not, label %for_join, label %for_body.lr.ph

for_body.lr.ph:                                   ; preds = %entry
  %addition_result19 = add i256 %0, 64
  br label %for_body

for_body:                                         ; preds = %for_body.lr.ph, %for_body
  %i.056 = phi i256 [ 0, %for_body.lr.ph ], [ %addition_result24, %for_body ]
  %addition_result13 = add i256 %i.056, 32
  %addition_result14 = add i256 %addition_result13, %1
  %memory_load_pointer15 = inttoptr i256 %addition_result14 to ptr addrspace(1)
  %memory_load_result16 = load i256, ptr addrspace(1) %memory_load_pointer15, align 1
  %addition_result20 = add i256 %addition_result19, %i.056
  %memory_store_pointer21 = inttoptr i256 %addition_result20 to ptr addrspace(1)
  store i256 %memory_load_result16, ptr addrspace(1) %memory_store_pointer21, align 1
  %addition_result24 = add i256 %i.056, 32
  %comparison_result = icmp ult i256 %addition_result24, %memory_load_result
  br i1 %comparison_result, label %for_body, label %for_join

for_join:                                         ; preds = %for_body, %entry
  %i.0.lcssa = phi i256 [ 0, %entry ], [ %addition_result24, %for_body ]
  %comparison_result27 = icmp ugt i256 %i.0.lcssa, %memory_load_result
  br i1 %comparison_result27, label %if_main, label %if_join

if_main:                                          ; preds = %for_join
  %addition_result31 = add i256 %0, 64
  %addition_result32 = add i256 %addition_result31, %memory_load_result
  %memory_store_pointer33 = inttoptr i256 %addition_result32 to ptr addrspace(1)
  store i256 0, ptr addrspace(1) %memory_store_pointer33, align 1
  br label %if_join

if_join:                                          ; preds = %if_main, %for_join
  %addition_result35 = add i256 %memory_load_result, 31
  %and_result = and i256 %addition_result35, -32
  %addition_result37 = add i256 %0, 64
  %addition_result38 = add i256 %addition_result37, %and_result
  ret i256 %addition_result38
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc { i256, i256, i256 } @abi_decode_addresst_addresst_uint256(i256 %0) unnamed_addr #6 personality ptr @__personality {
entry:
  %addition_result = add i256 %0, -4
  %comparison_result = icmp slt i256 %addition_result, 96
  br i1 %comparison_result, label %if_main, label %if_join

if_main:                                          ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join:                                          ; preds = %entry
  %calldata_pointer = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 4
  %calldata_value = load i256, ptr addrspace(3) %calldata_pointer_with_offset, align 32
  %1 = icmp ugt i256 %calldata_value, 1461501637330902918203684832716283019655932542975
  br i1 %1, label %if_main.i, label %validator_revert_address.exit

if_main.i:                                        ; preds = %if_join
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit:                    ; preds = %if_join
  %calldata_pointer_with_offset5 = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 36
  %calldata_value6 = load i256, ptr addrspace(3) %calldata_pointer_with_offset5, align 32
  %2 = icmp ugt i256 %calldata_value6, 1461501637330902918203684832716283019655932542975
  br i1 %2, label %if_main.i12, label %validator_revert_address.exit13

if_main.i12:                                      ; preds = %validator_revert_address.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit13:                  ; preds = %validator_revert_address.exit
  %calldata_pointer_with_offset10 = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 68
  %calldata_value11 = load i256, ptr addrspace(3) %calldata_pointer_with_offset10, align 32
  %return_value.fca.0.insert = insertvalue { i256, i256, i256 } poison, i256 %calldata_value, 0
  %return_value.fca.1.insert = insertvalue { i256, i256, i256 } %return_value.fca.0.insert, i256 %calldata_value6, 1
  %return_value.fca.2.insert = insertvalue { i256, i256, i256 } %return_value.fca.1.insert, i256 %calldata_value11, 2
  ret { i256, i256, i256 } %return_value.fca.2.insert
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc i256 @mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866(i256 %0) unnamed_addr #6 personality ptr @__personality {
entry:
  %and_result = and i256 %0, 1461501637330902918203684832716283019655932542975
  store i256 %and_result, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %1 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_gas_shifted.i = shl nuw nsw i256 %1, 192
  %abi_data_add_system_call_marker.i = or i256 %abi_data_gas_shifted.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i, label %__keccak256.exit, label %keccak256_failure_block.i

keccak256_failure_block.i:                        ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit:                                 ; preds = %entry
  %keccak256_call_external_result_abi_data_pointer.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 0
  %keccak256_child_data.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i, align 1
  ret i256 %keccak256_child_data.i
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc i256 @mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14878(i256 %0) unnamed_addr #6 personality ptr @__personality {
entry:
  %and_result = and i256 %0, 1461501637330902918203684832716283019655932542975
  store i256 %and_result, ptr addrspace(1) null, align 4294967296
  store i256 11, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %1 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_gas_shifted.i = shl nuw nsw i256 %1, 192
  %abi_data_add_system_call_marker.i = or i256 %abi_data_gas_shifted.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i, label %__keccak256.exit, label %keccak256_failure_block.i

keccak256_failure_block.i:                        ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit:                                 ; preds = %entry
  %keccak256_call_external_result_abi_data_pointer.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 0
  %keccak256_child_data.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i, align 1
  ret i256 %keccak256_child_data.i
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc i256 @mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14879(i256 %0) unnamed_addr #6 personality ptr @__personality {
entry:
  %and_result = and i256 %0, 1461501637330902918203684832716283019655932542975
  store i256 %and_result, ptr addrspace(1) null, align 4294967296
  store i256 12, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %1 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_gas_shifted.i = shl nuw nsw i256 %1, 192
  %abi_data_add_system_call_marker.i = or i256 %abi_data_gas_shifted.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i, label %__keccak256.exit, label %keccak256_failure_block.i

keccak256_failure_block.i:                        ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit:                                 ; preds = %entry
  %keccak256_call_external_result_abi_data_pointer.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 0
  %keccak256_child_data.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i, align 1
  ret i256 %keccak256_child_data.i
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc i256 @mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20(i256 %0, i256 %1) unnamed_addr #6 personality ptr @__personality {
entry:
  %and_result = and i256 %1, 1461501637330902918203684832716283019655932542975
  store i256 %and_result, ptr addrspace(1) null, align 4294967296
  store i256 %0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %2 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_gas_shifted.i = shl nuw nsw i256 %2, 192
  %abi_data_add_system_call_marker.i = or i256 %abi_data_gas_shifted.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i, label %__keccak256.exit, label %keccak256_failure_block.i

keccak256_failure_block.i:                        ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit:                                 ; preds = %entry
  %keccak256_call_external_result_abi_data_pointer.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 0
  %keccak256_child_data.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i, align 1
  ret i256 %keccak256_child_data.i
}

; Function Attrs: nofree noreturn null_pointer_is_valid
define private fastcc void @external_fun_transferFrom() unnamed_addr #7 personality ptr @__personality {
entry:
  %get_u128_value = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not = icmp eq i256 %get_u128_value, 0
  br i1 %if_condition_compared.not, label %if_join, label %if_main

if_main:                                          ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join:                                          ; preds = %entry
  %calldatasize = load i256, ptr @calldatasize, align 32
  %addition_result.i = add i256 %calldatasize, -4
  %comparison_result.i = icmp slt i256 %addition_result.i, 96
  br i1 %comparison_result.i, label %if_main.i, label %if_join.i

if_main.i:                                        ; preds = %if_join
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i:                                        ; preds = %if_join
  %calldata_pointer.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i, i256 4
  %calldata_value.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i, align 32
  %0 = icmp ugt i256 %calldata_value.i, 1461501637330902918203684832716283019655932542975
  br i1 %0, label %if_main.i.i, label %validator_revert_address.exit.i

if_main.i.i:                                      ; preds = %if_join.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit.i:                  ; preds = %if_join.i
  %calldata_pointer_with_offset5.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i, i256 36
  %calldata_value6.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset5.i, align 32
  %1 = icmp ugt i256 %calldata_value6.i, 1461501637330902918203684832716283019655932542975
  br i1 %1, label %if_main.i12.i, label %abi_decode_addresst_addresst_uint256.exit

if_main.i12.i:                                    ; preds = %validator_revert_address.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_addresst_addresst_uint256.exit:        ; preds = %validator_revert_address.exit.i
  %calldata_pointer_with_offset10.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i, i256 68
  %calldata_value11.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset10.i, align 32
  %and_result.i = and i256 %calldata_value.i, 1461501637330902918203684832716283019655932542975
  %comparison_result.i40 = icmp eq i256 %and_result.i, 0
  br i1 %comparison_result.i40, label %if_main.i42, label %if_join.i43

if_main.i42:                                      ; preds = %abi_decode_addresst_addresst_uint256.exit
  %memory_load_result.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i, align 1
  %addition_result.i41 = add i256 %memory_load_result.i, 4
  %memory_store_pointer11.i = inttoptr i256 %addition_result.i41 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer11.i, align 1
  %addition_result13.i = add i256 %memory_load_result.i, 36
  %memory_store_pointer14.i = inttoptr i256 %addition_result13.i to ptr addrspace(1)
  store i256 37, ptr addrspace(1) %memory_store_pointer14.i, align 1
  %addition_result16.i = add i256 %memory_load_result.i, 68
  %memory_store_pointer17.i = inttoptr i256 %addition_result16.i to ptr addrspace(1)
  store i256 31354931781638678607228669297131712859107492772550336241160036866987736981860, ptr addrspace(1) %memory_store_pointer17.i, align 1
  %addition_result19.i = add i256 %memory_load_result.i, 100
  %memory_store_pointer20.i = inttoptr i256 %addition_result19.i to ptr addrspace(1)
  store i256 45433405612597180762055095701412804886438245671210399661410036396145969725440, ptr addrspace(1) %memory_store_pointer20.i, align 1
  %2 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i, i256 4294967295)
  %exit_offset_shifted.i.i = shl nuw nsw i256 %2, 64
  %exit_abi_data.i.i = or i256 %exit_offset_shifted.i.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i)
  unreachable

if_join.i43:                                      ; preds = %abi_decode_addresst_addresst_uint256.exit
  %and_result24.i = and i256 %calldata_value6.i, 1461501637330902918203684832716283019655932542975
  %comparison_result26.not.i = icmp eq i256 %and_result24.i, 0
  br i1 %comparison_result26.not.i, label %if_main.i.i44, label %require_helper_stringliteral_0557.exit.i

if_main.i.i44:                                    ; preds = %if_join.i43
  %memory_load_result.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i = inttoptr i256 %memory_load_result.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i.i, align 1
  %addition_result.i.i = add i256 %memory_load_result.i.i, 4
  %memory_store_pointer4.i.i = inttoptr i256 %addition_result.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i.i, align 1
  %addition_result6.i.i = add i256 %memory_load_result.i.i, 36
  %memory_store_pointer7.i.i = inttoptr i256 %addition_result6.i.i to ptr addrspace(1)
  store i256 35, ptr addrspace(1) %memory_store_pointer7.i.i, align 1
  %addition_result9.i.i = add i256 %memory_load_result.i.i, 68
  %memory_store_pointer10.i.i = inttoptr i256 %addition_result9.i.i to ptr addrspace(1)
  store i256 31354931781638678607228669297131712859126084785867252355217498662940140921970, ptr addrspace(1) %memory_store_pointer10.i.i, align 1
  %addition_result12.i.i = add i256 %memory_load_result.i.i, 100
  %memory_store_pointer13.i.i = inttoptr i256 %addition_result12.i.i to ptr addrspace(1)
  store i256 45887578820189300338443374388718498632482616163288499555830078344056365121536, ptr addrspace(1) %memory_store_pointer13.i.i, align 1
  %3 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i = shl nuw nsw i256 %3, 64
  %exit_abi_data.i.i.i = or i256 %exit_offset_shifted.i.i.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i)
  unreachable

require_helper_stringliteral_0557.exit.i:         ; preds = %if_join.i43
  store i256 %and_result.i, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i.i = tail call i256 @llvm.syncvm.gasleft()
  %4 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i.i, i256 4294967295)
  %abi_data_gas_shifted.i.i.i = shl nuw nsw i256 %4, 192
  %abi_data_add_system_call_marker.i.i.i = or i256 %abi_data_gas_shifted.i.i.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i, label %keccak256_failure_block.i.i.i

keccak256_failure_block.i.i.i:                    ; preds = %require_helper_stringliteral_0557.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i: ; preds = %require_helper_stringliteral_0557.exit.i
  %keccak256_call_external_result_abi_data_pointer.i.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i.i, 0
  %keccak256_child_data.i.i.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i.i, align 1
  %storage_load.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i.i)
  %comparison_result33.not.i = icmp ult i256 %storage_load.i, %calldata_value11.i
  br i1 %comparison_result33.not.i, label %if_main.i79.i, label %require_helper_stringliteral_4107.exit.i

if_main.i79.i:                                    ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i
  %memory_load_result.i67.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i68.i = inttoptr i256 %memory_load_result.i67.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i68.i, align 1
  %addition_result.i69.i = add i256 %memory_load_result.i67.i, 4
  %memory_store_pointer4.i70.i = inttoptr i256 %addition_result.i69.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i70.i, align 1
  %addition_result6.i71.i = add i256 %memory_load_result.i67.i, 36
  %memory_store_pointer7.i72.i = inttoptr i256 %addition_result6.i71.i to ptr addrspace(1)
  store i256 38, ptr addrspace(1) %memory_store_pointer7.i72.i, align 1
  %addition_result9.i73.i = add i256 %memory_load_result.i67.i, 68
  %memory_store_pointer10.i74.i = inttoptr i256 %addition_result9.i73.i to ptr addrspace(1)
  store i256 31354931781638678607228669297131712859100820671745083778533502622993977909346, ptr addrspace(1) %memory_store_pointer10.i74.i, align 1
  %addition_result12.i75.i = add i256 %memory_load_result.i67.i, 100
  %memory_store_pointer13.i76.i = inttoptr i256 %addition_result12.i75.i to ptr addrspace(1)
  store i256 44065838241030143116324720188876985940908656145555552347773292252211112312832, ptr addrspace(1) %memory_store_pointer13.i76.i, align 1
  %5 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i67.i, i256 4294967295)
  %exit_offset_shifted.i.i77.i = shl nuw nsw i256 %5, 64
  %exit_abi_data.i.i78.i = or i256 %exit_offset_shifted.i.i77.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i78.i)
  unreachable

require_helper_stringliteral_4107.exit.i:         ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i
  store i256 %and_result.i, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i81.i = tail call i256 @llvm.syncvm.gasleft()
  %6 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i81.i, i256 4294967295)
  %abi_data_gas_shifted.i.i82.i = shl nuw nsw i256 %6, 192
  %abi_data_add_system_call_marker.i.i83.i = or i256 %abi_data_gas_shifted.i.i82.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i84.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i83.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i85.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i84.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i85.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit89.i, label %keccak256_failure_block.i.i86.i

keccak256_failure_block.i.i86.i:                  ; preds = %require_helper_stringliteral_4107.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit89.i: ; preds = %require_helper_stringliteral_4107.exit.i
  %subtraction_result39.i = sub i256 %storage_load.i, %calldata_value11.i
  %keccak256_call_external_result_abi_data_pointer.i.i87.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i84.i, 0
  %keccak256_child_data.i.i88.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i87.i, align 1
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i88.i, i256 %subtraction_result39.i)
  store i256 %and_result24.i, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i91.i = tail call i256 @llvm.syncvm.gasleft()
  %7 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i91.i, i256 4294967295)
  %abi_data_gas_shifted.i.i92.i = shl nuw nsw i256 %7, 192
  %abi_data_add_system_call_marker.i.i93.i = or i256 %abi_data_gas_shifted.i.i92.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i94.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i93.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i95.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i94.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i95.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit99.i, label %keccak256_failure_block.i.i96.i

keccak256_failure_block.i.i96.i:                  ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit89.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit99.i: ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit89.i
  %keccak256_call_external_result_abi_data_pointer.i.i97.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i94.i, 0
  %keccak256_child_data.i.i98.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i97.i, align 1
  %storage_load46.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i98.i)
  %xor_result.i.i = xor i256 %calldata_value11.i, -1
  %comparison_result.i100.i = icmp ugt i256 %storage_load46.i, %xor_result.i.i
  br i1 %comparison_result.i100.i, label %if_main.i101.i, label %checked_add_uint256.exit.i

if_main.i101.i:                                   ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit99.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i:                       ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit99.i
  %addition_result.i102.i = add i256 %storage_load46.i, %calldata_value11.i
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i98.i, i256 %addition_result.i102.i)
  %memory_load_result48.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i104.i = inttoptr i256 %memory_load_result48.i to ptr addrspace(1)
  store i256 %calldata_value11.i, ptr addrspace(1) %memory_store_pointer.i104.i, align 1
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %8 = tail call i256 @llvm.umin.i256(i256 %memory_load_result48.i, i256 4294967295)
  %9 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_input_offset_shifted.i = shl nuw nsw i256 %8, 64
  %abi_data_gas_shifted.i = shl nuw nsw i256 %9, 192
  %abi_data_offset_and_length.i = or i256 %abi_data_gas_shifted.i, %abi_data_input_offset_shifted.i
  %abi_data_add_system_call_marker.i = or i256 %abi_data_offset_and_length.i, 904625697166532776746648320380374280103671757735618107014721178055227736064
  %event_writer_call_external.i = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker.i, i256 32781, i256 3, i256 -15402802100530019096323380498944738953123845089667699673314898783681816316945, i256 %and_result.i, i256 %and_result24.i, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %event_writer_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %event_writer_call_external.i, 1
  br i1 %event_writer_external_result_status_code_boolean.i, label %fun_transfer.exit, label %event_failure_block.i

event_failure_block.i:                            ; preds = %checked_add_uint256.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

fun_transfer.exit:                                ; preds = %checked_add_uint256.exit.i
  store i256 %and_result.i, ptr addrspace(1) null, align 4294967296
  store i256 1, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i45 = tail call i256 @llvm.syncvm.gasleft()
  %10 = tail call i256 @llvm.umin.i256(i256 %gas_left.i45, i256 4294967295)
  %abi_data_gas_shifted.i46 = shl nuw nsw i256 %10, 192
  %abi_data_add_system_call_marker.i47 = or i256 %abi_data_gas_shifted.i46, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i47, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i, label %__keccak256.exit, label %keccak256_failure_block.i

keccak256_failure_block.i:                        ; preds = %fun_transfer.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit:                                 ; preds = %fun_transfer.exit
  %keccak256_call_external_result_abi_data_pointer.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 0
  %keccak256_child_data.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i, align 1
  %caller = tail call i256 @llvm.syncvm.caller()
  %and_result.i48 = and i256 %caller, 1461501637330902918203684832716283019655932542975
  store i256 %and_result.i48, ptr addrspace(1) null, align 4294967296
  store i256 %keccak256_child_data.i, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %11 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %11, 192
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_gas_shifted.i.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit, label %keccak256_failure_block.i.i

keccak256_failure_block.i.i:                      ; preds = %__keccak256.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit: ; preds = %__keccak256.exit
  %keccak256_call_external_result_abi_data_pointer.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 0
  %keccak256_child_data.i.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i, align 1
  %storage_load = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i)
  %comparison_result = icmp ult i256 %storage_load, %calldata_value11.i
  br i1 %comparison_result, label %if_main6, label %if_join7

if_main6:                                         ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer, align 1
  %addition_result = add i256 %memory_load_result, 4
  %memory_store_pointer15 = inttoptr i256 %addition_result to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer15, align 1
  %addition_result17 = add i256 %memory_load_result, 36
  %memory_store_pointer18 = inttoptr i256 %addition_result17 to ptr addrspace(1)
  store i256 40, ptr addrspace(1) %memory_store_pointer18, align 1
  %addition_result20 = add i256 %memory_load_result, 68
  %memory_store_pointer21 = inttoptr i256 %addition_result20 to ptr addrspace(1)
  store i256 31354931781638678607228669297131712859100820671745083778533502622993977909345, ptr addrspace(1) %memory_store_pointer21, align 1
  %addition_result23 = add i256 %memory_load_result, 100
  %memory_store_pointer24 = inttoptr i256 %addition_result23 to ptr addrspace(1)
  store i256 49041376442327685983450583443845300569967147870487584211451521639864848089088, ptr addrspace(1) %memory_store_pointer24, align 1
  %12 = tail call i256 @llvm.umin.i256(i256 %memory_load_result, i256 4294967295)
  %exit_offset_shifted.i = shl nuw nsw i256 %12, 64
  %exit_abi_data.i = or i256 %exit_offset_shifted.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i)
  unreachable

if_join7:                                         ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit
  %subtraction_result28 = sub i256 %storage_load, %calldata_value11.i
  tail call fastcc void @fun_approve(i256 %calldata_value.i, i256 %caller, i256 %subtraction_result28)
  %memory_load_result31 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i51 = inttoptr i256 %memory_load_result31 to ptr addrspace(1)
  store i256 1, ptr addrspace(1) %memory_store_pointer.i51, align 1
  %13 = tail call i256 @llvm.umin.i256(i256 %memory_load_result31, i256 4294967295)
  %exit_offset_shifted.i52 = shl nuw nsw i256 %13, 64
  %exit_abi_data_add_heap_auxiliary_marker.i = or i256 %exit_offset_shifted.i52, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i)
  unreachable
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc void @finalize_allocation_14877(i256 %0) unnamed_addr #6 personality ptr @__personality {
entry:
  %1 = icmp ugt i256 %0, 18446744073709551551
  br i1 %1, label %if_main, label %if_join

if_main:                                          ; preds = %entry
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join:                                          ; preds = %entry
  %addition_result = add i256 %0, 64
  store i256 %addition_result, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  ret void
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc void @finalize_allocation(i256 %0, i256 %1) unnamed_addr #6 personality ptr @__personality {
entry:
  %addition_result = add i256 %1, 31
  %and_result = and i256 %addition_result, -32
  %addition_result3 = add i256 %and_result, %0
  %comparison_result = icmp ult i256 %addition_result3, %0
  %comparison_result7 = icmp ugt i256 %addition_result3, 18446744073709551615
  %or_result13 = or i1 %comparison_result7, %comparison_result
  br i1 %or_result13, label %if_main, label %if_join

if_main:                                          ; preds = %entry
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join:                                          ; preds = %entry
  store i256 %addition_result3, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  ret void
}

; Function Attrs: nofree noreturn null_pointer_is_valid
define private fastcc void @external_fun_withdraw() unnamed_addr #7 personality ptr @__personality {
entry:
  %get_u128_value = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not = icmp eq i256 %get_u128_value, 0
  br i1 %if_condition_compared.not, label %if_join, label %if_main

if_main:                                          ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join:                                          ; preds = %entry
  %calldatasize = load i256, ptr @calldatasize, align 32
  %addition_result = add i256 %calldatasize, -4
  %comparison_result = icmp slt i256 %addition_result, 64
  br i1 %comparison_result, label %if_main2, label %if_join3

if_main2:                                         ; preds = %if_join
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3:                                         ; preds = %if_join
  %calldata_pointer = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 36
  %calldata_value = load i256, ptr addrspace(3) %calldata_pointer_with_offset, align 32
  %comparison_result5 = icmp ugt i256 %calldata_value, 18446744073709551615
  br i1 %comparison_result5, label %if_main8, label %if_join9

if_main8:                                         ; preds = %if_join3
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join9:                                         ; preds = %if_join3
  %addition_result12 = add i256 %calldata_value, 35
  %comparison_result13.not = icmp slt i256 %addition_result12, %calldatasize
  br i1 %comparison_result13.not, label %if_join19, label %if_main18

if_main18:                                        ; preds = %if_join9
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join19:                                        ; preds = %if_join9
  %addition_result21 = add i256 %calldata_value, 4
  %calldata_pointer_with_offset23 = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 %addition_result21
  %calldata_value24 = load i256, ptr addrspace(3) %calldata_pointer_with_offset23, align 32
  %comparison_result.i = icmp ugt i256 %calldata_value24, 18446744073709551615
  br i1 %comparison_result.i, label %if_main.i, label %array_allocation_size_array_uint256_dyn.exit

if_main.i:                                        ; preds = %if_join19
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

array_allocation_size_array_uint256_dyn.exit:     ; preds = %if_join19
  %shift_left_non_overflow_result.i = shl i256 %calldata_value24, 5
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %addition_result.i71 = add i256 %shift_left_non_overflow_result.i, 63
  %and_result.i = and i256 %addition_result.i71, -32
  %addition_result3.i = add i256 %memory_load_result, %and_result.i
  %comparison_result.i72 = icmp ult i256 %addition_result3.i, %memory_load_result
  %comparison_result7.i = icmp ugt i256 %addition_result3.i, 18446744073709551615
  %or_result13.i = or i1 %comparison_result7.i, %comparison_result.i72
  br i1 %or_result13.i, label %if_main.i73, label %finalize_allocation.exit

if_main.i73:                                      ; preds = %array_allocation_size_array_uint256_dyn.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit:                         ; preds = %array_allocation_size_array_uint256_dyn.exit
  store i256 %addition_result3.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %dst = alloca i256, align 32
  store i256 %memory_load_result, ptr %dst, align 32
  %memory_store_pointer = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 %calldata_value24, ptr addrspace(1) %memory_store_pointer, align 1
  %addition_result33 = add i256 %memory_load_result, 32
  store i256 %addition_result33, ptr %dst, align 32
  %addition_result36 = add i256 %calldata_value, 36
  %addition_result37 = add i256 %addition_result36, %shift_left_non_overflow_result.i
  %calldatasize38 = load i256, ptr @calldatasize, align 32
  %comparison_result40 = icmp ugt i256 %addition_result37, %calldatasize38
  br i1 %comparison_result40, label %if_main43, label %if_join44

if_main43:                                        ; preds = %finalize_allocation.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join44:                                        ; preds = %finalize_allocation.exit
  %addition_result46 = add i256 %calldata_value, 36
  %dst.promoted = load i256, ptr %dst, align 32
  %comparison_result4976 = icmp ult i256 %addition_result46, %addition_result37
  br i1 %comparison_result4976, label %for_body, label %for_join

for_body:                                         ; preds = %if_join44, %for_body
  %storemerge78 = phi i256 [ %addition_result62, %for_body ], [ %addition_result46, %if_join44 ]
  %addition_result597577 = phi i256 [ %addition_result59, %for_body ], [ %dst.promoted, %if_join44 ]
  %calldata_pointer52 = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset53 = getelementptr i8, ptr addrspace(3) %calldata_pointer52, i256 %storemerge78
  %calldata_value54 = load i256, ptr addrspace(3) %calldata_pointer_with_offset53, align 32
  %memory_store_pointer56 = inttoptr i256 %addition_result597577 to ptr addrspace(1)
  store i256 %calldata_value54, ptr addrspace(1) %memory_store_pointer56, align 1
  %addition_result59 = add i256 %addition_result597577, 32
  %addition_result62 = add i256 %storemerge78, 32
  %comparison_result49 = icmp ult i256 %addition_result62, %addition_result37
  br i1 %comparison_result49, label %for_body, label %for_join

for_join:                                         ; preds = %for_body, %if_join44
  %addition_result5975.lcssa = phi i256 [ %dst.promoted, %if_join44 ], [ %addition_result59, %for_body ]
  store i256 %addition_result5975.lcssa, ptr %dst, align 32
  %calldata_pointer64 = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset65 = getelementptr i8, ptr addrspace(3) %calldata_pointer64, i256 4
  %calldata_value66 = load i256, ptr addrspace(3) %calldata_pointer_with_offset65, align 32
  tail call fastcc void @modifier_nonReentrant(i256 %calldata_value66, i256 %memory_load_result)
  %memory_load_result67 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %0 = tail call i256 @llvm.umin.i256(i256 %memory_load_result67, i256 4294967295)
  %exit_offset_shifted.i = shl nuw nsw i256 %0, 64
  tail call void @llvm.syncvm.return(i256 %exit_offset_shifted.i)
  unreachable
}

; Function Attrs: nofree noreturn null_pointer_is_valid
define private fastcc void @external_fun_rescueFunds() unnamed_addr #7 personality ptr @__personality {
entry:
  %get_u128_value = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not = icmp eq i256 %get_u128_value, 0
  br i1 %if_condition_compared.not, label %if_join, label %if_main

if_main:                                          ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join:                                          ; preds = %entry
  %calldatasize = load i256, ptr @calldatasize, align 32
  %addition_result = add i256 %calldatasize, -4
  %comparison_result = icmp slt i256 %addition_result, 64
  br i1 %comparison_result, label %if_main2, label %if_join3

if_main2:                                         ; preds = %if_join
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3:                                         ; preds = %if_join
  %calldata_pointer = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 4
  %calldata_value = load i256, ptr addrspace(3) %calldata_pointer_with_offset, align 32
  %0 = icmp ugt i256 %calldata_value, 1461501637330902918203684832716283019655932542975
  br i1 %0, label %if_main.i, label %validator_revert_address.exit

if_main.i:                                        ; preds = %if_join3
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit:                    ; preds = %if_join3
  %storage_load = tail call i256 @llvm.syncvm.sload(i256 5)
  %comparison_result5.not = icmp eq i256 %storage_load, 2
  br i1 %comparison_result5.not, label %if_main.i86, label %require_helper_stringliteral_ebf7.exit

if_main.i86:                                      ; preds = %validator_revert_address.exit
  %memory_load_result.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i, align 1
  %addition_result.i = add i256 %memory_load_result.i, 4
  %memory_store_pointer4.i = inttoptr i256 %addition_result.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i, align 1
  %addition_result6.i = add i256 %memory_load_result.i, 36
  %memory_store_pointer7.i = inttoptr i256 %addition_result6.i to ptr addrspace(1)
  store i256 31, ptr addrspace(1) %memory_store_pointer7.i, align 1
  %addition_result9.i = add i256 %memory_load_result.i, 68
  %memory_store_pointer10.i = inttoptr i256 %addition_result9.i to ptr addrspace(1)
  store i256 37268805191608899176760263720700790282416321829889089033725955971341467020288, ptr addrspace(1) %memory_store_pointer10.i, align 1
  %1 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i, i256 4294967295)
  %exit_offset_shifted.i.i = shl nuw nsw i256 %1, 64
  %exit_abi_data.i.i = or i256 %exit_offset_shifted.i.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i)
  unreachable

require_helper_stringliteral_ebf7.exit:           ; preds = %validator_revert_address.exit
  tail call void @llvm.syncvm.sstore(i256 5, i256 2)
  %storage_load9 = tail call i256 @llvm.syncvm.sload(i256 6)
  %and_result = and i256 %storage_load9, 1461501637330902918203684832716283019655932542975
  %caller = tail call i256 @llvm.syncvm.caller()
  %comparison_result11.not = icmp eq i256 %and_result, %caller
  br i1 %comparison_result11.not, label %require_helper_stringliteral_9924.exit, label %if_main.i98

if_main.i98:                                      ; preds = %require_helper_stringliteral_ebf7.exit
  %memory_load_result.i88 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i89 = inttoptr i256 %memory_load_result.i88 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i89, align 1
  %addition_result.i90 = add i256 %memory_load_result.i88, 4
  %memory_store_pointer4.i91 = inttoptr i256 %addition_result.i90 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i91, align 1
  %addition_result6.i92 = add i256 %memory_load_result.i88, 36
  %memory_store_pointer7.i93 = inttoptr i256 %addition_result6.i92 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i93, align 1
  %addition_result9.i94 = add i256 %memory_load_result.i88, 68
  %memory_store_pointer10.i95 = inttoptr i256 %addition_result9.i94 to ptr addrspace(1)
  store i256 35943731656364841964516503116990081338611484598491072354577564874054038349170, ptr addrspace(1) %memory_store_pointer10.i95, align 1
  %2 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i88, i256 4294967295)
  %exit_offset_shifted.i.i96 = shl nuw nsw i256 %2, 64
  %exit_abi_data.i.i97 = or i256 %exit_offset_shifted.i.i96, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i97)
  unreachable

require_helper_stringliteral_9924.exit:           ; preds = %require_helper_stringliteral_ebf7.exit
  %storage_load13 = tail call i256 @llvm.syncvm.sload(i256 8)
  %comparison_result.i.i = icmp ugt i256 %storage_load13, 18446744073709551615
  br i1 %comparison_result.i.i, label %if_main.i.i, label %array_allocation_size_array_uint256_dyn.exit.i

if_main.i.i:                                      ; preds = %require_helper_stringliteral_9924.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

array_allocation_size_array_uint256_dyn.exit.i:   ; preds = %require_helper_stringliteral_9924.exit
  %shift_left_non_overflow_result.i.i = shl i256 %storage_load13, 5
  %memory_load_result.i99 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %addition_result.i16.i = add i256 %shift_left_non_overflow_result.i.i, 63
  %and_result.i.i = and i256 %addition_result.i16.i, -32
  %addition_result3.i.i = add i256 %memory_load_result.i99, %and_result.i.i
  %comparison_result.i17.i = icmp ult i256 %addition_result3.i.i, %memory_load_result.i99
  %comparison_result7.i.i = icmp ugt i256 %addition_result3.i.i, 18446744073709551615
  %or_result13.i.i = or i1 %comparison_result7.i.i, %comparison_result.i17.i
  br i1 %or_result13.i.i, label %if_main.i18.i, label %allocate_and_zero_memory_array_array_uint256_dyn.exit

if_main.i18.i:                                    ; preds = %array_allocation_size_array_uint256_dyn.exit.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

allocate_and_zero_memory_array_array_uint256_dyn.exit: ; preds = %array_allocation_size_array_uint256_dyn.exit.i
  store i256 %addition_result3.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i100 = inttoptr i256 %memory_load_result.i99 to ptr addrspace(1)
  store i256 %storage_load13, ptr addrspace(1) %memory_store_pointer.i100, align 1
  %calldatasize.i = load i256, ptr @calldatasize, align 32
  %addition_result10.i = add i256 %memory_load_result.i99, 32
  %calldata_copy_destination_pointer.i = inttoptr i256 %addition_result10.i to ptr addrspace(1)
  %calldata_pointer.i = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_source_pointer.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i, i256 %calldatasize.i
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %calldata_copy_destination_pointer.i, ptr addrspace(3) align 1 %calldata_source_pointer.i, i256 %shift_left_non_overflow_result.i.i, i1 false)
  %memory_load_result237 = load i256, ptr addrspace(1) %memory_store_pointer.i100, align 1
  %comparison_result16.not238.not = icmp eq i256 %memory_load_result237, 0
  br i1 %comparison_result16.not238.not, label %if_main21, label %if_join22

if_main21:                                        ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit, %allocate_and_zero_memory_array_array_uint256_dyn.exit
  %calldata_pointer28 = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset29 = getelementptr i8, ptr addrspace(3) %calldata_pointer28, i256 36
  %calldata_value30 = load i256, ptr addrspace(3) %calldata_pointer_with_offset29, align 32
  %comparison_result.i101 = icmp eq i256 %calldata_value30, 0
  br i1 %comparison_result.i101, label %fun_uniTransfer.exit, label %if_main.i102

if_main.i102:                                     ; preds = %if_main21
  %and_result.i = and i256 %calldata_value, 1461501637330902918203684832716283019655932542975
  %comparison_result7.not.i = icmp eq i256 %and_result.i, 0
  br i1 %comparison_result7.not.i, label %switch_default_block.i, label %switch_case_branch_1_block.i

switch_case_branch_1_block.i:                     ; preds = %if_main.i102
  %memory_load_result.i103 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %addition_result.i104 = add i256 %memory_load_result.i103, 32
  %memory_store_pointer.i105 = inttoptr i256 %addition_result.i104 to ptr addrspace(1)
  store i256 -39341301877480157781710804024396230103289065588583741745104145964028735258624, ptr addrspace(1) %memory_store_pointer.i105, align 1
  %and_result17.i = and i256 %caller, 1461501637330902918203684832716283019655932542975
  %addition_result19.i = add i256 %memory_load_result.i103, 36
  %memory_store_pointer20.i = inttoptr i256 %addition_result19.i to ptr addrspace(1)
  store i256 %and_result17.i, ptr addrspace(1) %memory_store_pointer20.i, align 1
  %addition_result23.i = add i256 %memory_load_result.i103, 68
  %memory_store_pointer24.i = inttoptr i256 %addition_result23.i to ptr addrspace(1)
  store i256 %calldata_value30, ptr addrspace(1) %memory_store_pointer24.i, align 1
  %memory_store_pointer26.i = inttoptr i256 %memory_load_result.i103 to ptr addrspace(1)
  store i256 68, ptr addrspace(1) %memory_store_pointer26.i, align 1
  %addition_result28.i = add i256 %memory_load_result.i103, 128
  %3 = icmp ugt i256 %memory_load_result.i103, 18446744073709551487
  br i1 %3, label %if_main37.i, label %if_join38.i

if_main37.i:                                      ; preds = %switch_case_branch_1_block.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join38.i:                                      ; preds = %switch_case_branch_1_block.i
  store i256 %addition_result28.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %4 = icmp ugt i256 %addition_result28.i, 18446744073709551551
  br i1 %4, label %if_main.i.i.i, label %finalize_allocation_14877.exit.i.i

if_main.i.i.i:                                    ; preds = %if_join38.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation_14877.exit.i.i:               ; preds = %if_join38.i
  %addition_result.i.i.i = add i256 %memory_load_result.i103, 192
  store i256 %addition_result.i.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i = inttoptr i256 %addition_result28.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer.i.i, align 1
  %addition_result.i.i = add i256 %memory_load_result.i103, 160
  %memory_store_pointer7.i.i = inttoptr i256 %addition_result.i.i to ptr addrspace(1)
  store i256 37714057306076988483118529490347679105585116642029194716945419020321082336612, ptr addrspace(1) %memory_store_pointer7.i.i, align 1
  store i256 10867283408178898638301172343726954674910073630256871736220740970449699113859, ptr addrspace(2) null, align 4294967296
  store i256 %and_result.i, ptr addrspace(2) inttoptr (i256 4 to ptr addrspace(2)), align 4
  %gas_left.i.i.i = tail call i256 @llvm.syncvm.gasleft()
  %5 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i.i, i256 4294967295)
  %abi_data_gas_shifted.i.i.i = shl nuw nsw i256 %5, 192
  %abi_data_add_system_call_marker.i.i.i = or i256 %abi_data_gas_shifted.i.i.i, 904625751086426111047927909714404454142933105326819602152923490636624035840
  %system_request.i.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i.i, i256 32770, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i, 1
  br i1 %system_request_result_status_code_boolean.i.i.i, label %__system_request.exit.i.i, label %system_request_error_block.i.i.i

system_request_error_block.i.i.i:                 ; preds = %finalize_allocation_14877.exit.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i.i:                        ; preds = %finalize_allocation_14877.exit.i.i
  %system_request_result_abi_data.i.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i, 0
  %system_request_child_address.i.i.i = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i.i, align 1
  %comparison_result.i.i106 = icmp eq i256 %system_request_child_address.i.i.i, 0
  br i1 %comparison_result.i.i106, label %if_main.i.i107, label %if_join.i.i

if_main.i.i107:                                   ; preds = %__system_request.exit.i.i
  %memory_load_result9.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer16.i.i = inttoptr i256 %memory_load_result9.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer16.i.i, align 1
  %addition_result19.i.i = add i256 %memory_load_result9.i.i, 4
  %memory_store_pointer20.i.i = inttoptr i256 %addition_result19.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer20.i.i, align 1
  %addition_result22.i.i = add i256 %memory_load_result9.i.i, 36
  %memory_store_pointer23.i.i = inttoptr i256 %addition_result22.i.i to ptr addrspace(1)
  store i256 29, ptr addrspace(1) %memory_store_pointer23.i.i, align 1
  %addition_result25.i.i = add i256 %memory_load_result9.i.i, 68
  %memory_store_pointer26.i.i = inttoptr i256 %addition_result25.i.i to ptr addrspace(1)
  store i256 29577713123142787666064487680123823951345158729797978021083438401868913442816, ptr addrspace(1) %memory_store_pointer26.i.i, align 1
  %6 = tail call i256 @llvm.umin.i256(i256 %memory_load_result9.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i = shl nuw nsw i256 %6, 64
  %exit_abi_data.i.i.i = or i256 %exit_offset_shifted.i.i.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i)
  unreachable

if_join.i.i:                                      ; preds = %__system_request.exit.i.i
  %memory_load_result29.i.i = load i256, ptr addrspace(1) %memory_store_pointer26.i, align 1
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %cond.i.i = icmp eq i256 %and_result.i, 4
  br i1 %cond.i.i, label %contract_call_join_block.i.i, label %contract_call_ordinary_block.i.i

contract_call_ordinary_block.i.i:                 ; preds = %if_join.i.i
  %7 = tail call i256 @llvm.umin.i256(i256 %addition_result.i104, i256 4294967295)
  %8 = tail call i256 @llvm.umin.i256(i256 %memory_load_result29.i.i, i256 4294967295)
  %9 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_input_offset_shifted.i.i.i = shl nuw nsw i256 %7, 64
  %abi_data_input_length_shifted.i.i.i = shl nuw nsw i256 %8, 96
  %abi_data_gas_shifted.i65.i.i = shl nuw nsw i256 %9, 192
  %abi_data_offset_and_length.i.i.i = or i256 %abi_data_input_length_shifted.i.i.i, %abi_data_input_offset_shifted.i.i.i
  %abi_data_add_gas.i.i.i = or i256 %abi_data_offset_and_length.i.i.i, %abi_data_gas_shifted.i65.i.i
  %contract_call_external.i.i.i = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_gas.i.i.i, i256 %and_result.i, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i.i, 0
  %contract_call_external_result_status_code_boolean.i.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i.i, 1
  %contract_call_external_result_status_code.i.i.i = zext i1 %contract_call_external_result_status_code_boolean.i.i.i to i256
  %contract_call_memcpy_from_child_pointer_casted.i.i.i = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i.i.i to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i.i.i = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i.i.i, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i.i.i = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i.i.i, 4294967295
  store ptr addrspace(3) %contract_call_external_result_abi_data.i.i.i, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i.i, ptr @returndatasize, align 32
  br label %contract_call_join_block.i.i

contract_call_join_block.i.i:                     ; preds = %contract_call_ordinary_block.i.i, %if_join.i.i
  %storemerge.i.i = phi i256 [ %contract_call_external_result_status_code.i.i.i, %contract_call_ordinary_block.i.i ], [ 1, %if_join.i.i ]
  %returndatasize.i.i.i = load i256, ptr @returndatasize, align 32
  %cond.i.i.i = icmp eq i256 %returndatasize.i.i.i, 0
  br i1 %cond.i.i.i, label %extract_returndata.exit.i.i, label %switch_default_block.i.i.i

switch_default_block.i.i.i:                       ; preds = %contract_call_join_block.i.i
  %memory_load_result.i.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %10 = add i256 %returndatasize.i.i.i, 63
  %and_result.i.i.i.i = and i256 %10, -32
  %addition_result3.i.i.i.i = add i256 %memory_load_result.i.i.i, %and_result.i.i.i.i
  %comparison_result.i.i.i.i = icmp ult i256 %addition_result3.i.i.i.i, %memory_load_result.i.i.i
  %comparison_result7.i.i.i.i = icmp ugt i256 %addition_result3.i.i.i.i, 18446744073709551615
  %or_result13.i.i.i.i = or i1 %comparison_result7.i.i.i.i, %comparison_result.i.i.i.i
  br i1 %or_result13.i.i.i.i, label %if_main.i.i.i.i, label %finalize_allocation.exit.i.i.i

if_main.i.i.i.i:                                  ; preds = %switch_default_block.i.i.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit.i.i.i:                   ; preds = %switch_default_block.i.i.i
  store i256 %addition_result3.i.i.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i.i = inttoptr i256 %memory_load_result.i.i.i to ptr addrspace(1)
  store i256 %returndatasize.i.i.i, ptr addrspace(1) %memory_store_pointer.i.i.i, align 1
  %addition_result11.i.i.i = add i256 %memory_load_result.i.i.i, 32
  %returndatasize9.i.i.i = load i256, ptr @returndatasize, align 32
  %return_data_copy_destination_pointer.i.i.i = inttoptr i256 %addition_result11.i.i.i to ptr addrspace(1)
  %return_data_pointer.i.i.i = load ptr addrspace(3), ptr @ptr_return_data, align 32
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i.i, ptr addrspace(3) align 1 %return_data_pointer.i.i.i, i256 %returndatasize9.i.i.i, i1 false)
  br label %extract_returndata.exit.i.i

extract_returndata.exit.i.i:                      ; preds = %finalize_allocation.exit.i.i.i, %contract_call_join_block.i.i
  %return_pointer.0.i.i.i = phi i256 [ %memory_load_result.i.i.i, %finalize_allocation.exit.i.i.i ], [ 96, %contract_call_join_block.i.i ]
  %cond.i66.i.i = icmp eq i256 %storemerge.i.i, 0
  %memory_load_pointer.i.i.i = inttoptr i256 %return_pointer.0.i.i.i to ptr addrspace(1)
  %memory_load_result.i67.i.i = load i256, ptr addrspace(1) %memory_load_pointer.i.i.i, align 1
  %comparison_result.not.i.i.i = icmp eq i256 %memory_load_result.i67.i.i, 0
  br i1 %cond.i66.i.i, label %switch_case_branch_1_block.i.i.i, label %fun_verifyCallResult.exit.i.i

switch_case_branch_1_block.i.i.i:                 ; preds = %extract_returndata.exit.i.i
  br i1 %comparison_result.not.i.i.i, label %switch_case_branch_1_block6.i.i.i, label %switch_default_block.i70.i.i

switch_case_branch_1_block6.i.i.i:                ; preds = %switch_case_branch_1_block.i.i.i
  %memory_load_result7.i.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i68.i.i = inttoptr i256 %memory_load_result7.i.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i68.i.i, align 1
  %addition_result.i69.i.i = add i256 %memory_load_result7.i.i.i, 4
  %abi_encode_string_call.i.i.i = tail call fastcc i256 @abi_encode_string(i256 %addition_result.i69.i.i, i256 %addition_result28.i)
  %subtraction_result.i.i.i = sub i256 %abi_encode_string_call.i.i.i, %memory_load_result7.i.i.i
  %11 = tail call i256 @llvm.umin.i256(i256 %memory_load_result7.i.i.i, i256 4294967295)
  %12 = tail call i256 @llvm.umin.i256(i256 %subtraction_result.i.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i.i = shl nuw nsw i256 %11, 64
  %exit_length_shifted.i.i.i.i = shl nuw nsw i256 %12, 96
  %exit_abi_data.i.i.i.i = or i256 %exit_length_shifted.i.i.i.i, %exit_offset_shifted.i.i.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i.i)
  unreachable

switch_default_block.i70.i.i:                     ; preds = %switch_case_branch_1_block.i.i.i
  %addition_result17.i.i.i = add i256 %return_pointer.0.i.i.i, 32
  %13 = tail call i256 @llvm.umin.i256(i256 %addition_result17.i.i.i, i256 4294967295)
  %14 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i67.i.i, i256 4294967295)
  %exit_offset_shifted.i24.i.i.i = shl nuw nsw i256 %13, 64
  %exit_length_shifted.i25.i.i.i = shl nuw nsw i256 %14, 96
  %exit_abi_data.i26.i.i.i = or i256 %exit_length_shifted.i25.i.i.i, %exit_offset_shifted.i24.i.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i26.i.i.i)
  unreachable

fun_verifyCallResult.exit.i.i:                    ; preds = %extract_returndata.exit.i.i
  br i1 %comparison_result.not.i.i.i, label %fun_uniTransfer.exit, label %if_main45.i.i

if_main45.i.i:                                    ; preds = %fun_verifyCallResult.exit.i.i
  %comparison_result.i.i.i = icmp slt i256 %memory_load_result.i67.i.i, 32
  br i1 %comparison_result.i.i.i, label %if_main.i71.i.i, label %if_join.i.i.i

if_main.i71.i.i:                                  ; preds = %if_main45.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i.i.i:                                    ; preds = %if_main45.i.i
  %addition_result54.i.i = add i256 %return_pointer.0.i.i.i, 32
  %memory_load_pointer.i72.i.i = inttoptr i256 %addition_result54.i.i to ptr addrspace(1)
  %memory_load_result.i73.i.i = load i256, ptr addrspace(1) %memory_load_pointer.i72.i.i, align 1
  %comparison_result5.i.i.i = icmp ne i256 %memory_load_result.i73.i.i, 0
  %comparison_result_extended8.i.i.i = zext i1 %comparison_result5.i.i.i to i256
  %comparison_result10.not.i.i.i = icmp eq i256 %memory_load_result.i73.i.i, %comparison_result_extended8.i.i.i
  br i1 %comparison_result10.not.i.i.i, label %abi_decode_bool_fromMemory.exit.i.i, label %if_main15.i.i.i

if_main15.i.i.i:                                  ; preds = %if_join.i.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_bool_fromMemory.exit.i.i:              ; preds = %if_join.i.i.i
  %comparison_result.i74.i.i = icmp eq i256 %memory_load_result.i73.i.i, 0
  br i1 %comparison_result.i74.i.i, label %if_main.i80.i.i, label %fun_uniTransfer.exit

if_main.i80.i.i:                                  ; preds = %abi_decode_bool_fromMemory.exit.i.i
  %memory_load_result.i75.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i76.i.i = inttoptr i256 %memory_load_result.i75.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i76.i.i, align 1
  %addition_result.i77.i.i = add i256 %memory_load_result.i75.i.i, 4
  %memory_store_pointer4.i.i.i = inttoptr i256 %addition_result.i77.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i.i.i, align 1
  %addition_result6.i.i.i = add i256 %memory_load_result.i75.i.i, 36
  %memory_store_pointer7.i.i.i = inttoptr i256 %addition_result6.i.i.i to ptr addrspace(1)
  store i256 42, ptr addrspace(1) %memory_store_pointer7.i.i.i, align 1
  %addition_result9.i.i.i = add i256 %memory_load_result.i75.i.i, 68
  %memory_store_pointer10.i.i.i = inttoptr i256 %addition_result9.i.i.i to ptr addrspace(1)
  store i256 37714057306076988483118529433182395293628422681814405642689417129066110394478, ptr addrspace(1) %memory_store_pointer10.i.i.i, align 1
  %addition_result12.i.i.i = add i256 %memory_load_result.i75.i.i, 100
  %memory_store_pointer13.i.i.i = inttoptr i256 %addition_result12.i.i.i to ptr addrspace(1)
  store i256 50411904420896249798390057088552747694053213439589473829759729709664159399936, ptr addrspace(1) %memory_store_pointer13.i.i.i, align 1
  %15 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i75.i.i, i256 4294967295)
  %exit_offset_shifted.i.i78.i.i = shl nuw nsw i256 %15, 64
  %exit_abi_data.i.i79.i.i = or i256 %exit_offset_shifted.i.i78.i.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i79.i.i)
  unreachable

switch_default_block.i:                           ; preds = %if_main.i102
  %and_result49.i = and i256 %caller, 1461501637330902918203684832716283019655932542975
  %cond56.i = icmp eq i256 %and_result49.i, 4
  br i1 %cond56.i, label %fun_uniTransfer.exit, label %contract_call_value_non_zero_block.i

contract_call_value_non_zero_block.i:             ; preds = %switch_default_block.i
  %system_far_call_external.i = tail call { ptr addrspace(3), i1 } @__farcall(i256 904625697166532776746648320380374280103671755200316906558262375061821325312, i256 32777, i256 %calldata_value30, i256 %and_result49.i, i256 0, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_far_call_external_result_abi_data.i = extractvalue { ptr addrspace(3), i1 } %system_far_call_external.i, 0
  %system_far_call_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %system_far_call_external.i, 1
  %system_far_call_memcpy_from_child_pointer_casted.i = ptrtoint ptr addrspace(3) %system_far_call_external_result_abi_data.i to i256
  %system_far_call_memcpy_from_child_return_data_size_shifted.i = lshr i256 %system_far_call_memcpy_from_child_pointer_casted.i, 96
  %system_far_call_memcpy_from_child_return_data_size_truncated.i = and i256 %system_far_call_memcpy_from_child_return_data_size_shifted.i, 4294967295
  store ptr addrspace(3) %system_far_call_external_result_abi_data.i, ptr @ptr_return_data, align 32
  store i256 %system_far_call_memcpy_from_child_return_data_size_truncated.i, ptr @returndatasize, align 32
  br i1 %system_far_call_external_result_status_code_boolean.i, label %fun_uniTransfer.exit, label %if_main54.i

if_main54.i:                                      ; preds = %contract_call_value_non_zero_block.i
  %memory_load_result.i65.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i.i = inttoptr i256 %memory_load_result.i65.i to ptr addrspace(1)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i, ptr addrspace(3) align 1 %system_far_call_external_result_abi_data.i, i256 %system_far_call_memcpy_from_child_return_data_size_truncated.i, i1 false)
  %returndatasize3.i.i = load i256, ptr @returndatasize, align 32
  %16 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i65.i, i256 4294967295)
  %17 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i.i, i256 4294967295)
  %exit_offset_shifted.i.i66.i = shl nuw nsw i256 %16, 64
  %exit_length_shifted.i.i.i = shl nuw nsw i256 %17, 96
  %exit_abi_data.i.i67.i = or i256 %exit_length_shifted.i.i.i, %exit_offset_shifted.i.i66.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i67.i)
  unreachable

fun_uniTransfer.exit:                             ; preds = %if_main21, %fun_verifyCallResult.exit.i.i, %abi_decode_bool_fromMemory.exit.i.i, %switch_default_block.i, %contract_call_value_non_zero_block.i
  %memory_load_result39240 = load i256, ptr addrspace(1) %memory_store_pointer.i100, align 1
  %comparison_result41.not241.not = icmp eq i256 %memory_load_result39240, 0
  br i1 %comparison_result41.not241.not, label %if_main46, label %if_join47

if_join22:                                        ; preds = %allocate_and_zero_memory_array_array_uint256_dyn.exit, %memory_array_index_access_contract_IERC20_dyn.1.exit
  %storemerge239 = phi i256 [ %addition_result.i140, %memory_array_index_access_contract_IERC20_dyn.1.exit ], [ 0, %allocate_and_zero_memory_array_array_uint256_dyn.exit ]
  %storage_load.i = tail call i256 @llvm.syncvm.sload(i256 8)
  %comparison_result.not.i = icmp ugt i256 %storage_load.i, %storemerge239
  br i1 %comparison_result.not.i, label %storage_array_index_access_contract_IERC20_dyn.exit, label %if_main.i108

if_main.i108:                                     ; preds = %if_join22
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

storage_array_index_access_contract_IERC20_dyn.exit: ; preds = %if_join22
  store i256 8, ptr addrspace(1) null, align 4294967296
  %addition_result.i109 = add i256 %storemerge239, -5442482557903504250613150719145357533886713417884903185095341029921719619869
  %address = tail call i256 @llvm.syncvm.this()
  %storage_load24 = tail call i256 @llvm.syncvm.sload(i256 %addition_result.i109)
  %phi.bo.i = and i256 %storage_load24, 1461501637330902918203684832716283019655932542975
  %comparison_result.not.i110 = icmp eq i256 %phi.bo.i, 0
  br i1 %comparison_result.not.i110, label %switch_default_block.i131, label %switch_case_branch_1_block.i114

switch_case_branch_1_block.i114:                  ; preds = %storage_array_index_access_contract_IERC20_dyn.exit
  %memory_load_result.i111 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i112 = inttoptr i256 %memory_load_result.i111 to ptr addrspace(1)
  store i256 50942633119752846454219349998365661925608737367104304655302372697894809501696, ptr addrspace(1) %memory_store_pointer.i112, align 1
  %and_result12.i = and i256 %address, 1461501637330902918203684832716283019655932542975
  %addition_result.i113 = add i256 %memory_load_result.i111, 4
  %memory_store_pointer14.i = inttoptr i256 %addition_result.i113 to ptr addrspace(1)
  store i256 %and_result12.i, ptr addrspace(1) %memory_store_pointer14.i, align 1
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %cond40.i = icmp eq i256 %phi.bo.i, 4
  br i1 %cond40.i, label %if_join.i, label %contract_call_ordinary_block.i

contract_call_ordinary_block.i:                   ; preds = %switch_case_branch_1_block.i114
  %18 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i111, i256 4294967295)
  %19 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_input_offset_shifted.i.i = shl nuw nsw i256 %18, 64
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %19, 192
  %abi_data_offset_and_length.i.i = or i256 %abi_data_gas_shifted.i.i, %abi_data_input_offset_shifted.i.i
  %abi_data_add_gas.i.i = or i256 %abi_data_offset_and_length.i.i, 2852213850513516153367582212096
  %contract_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_gas.i.i, i256 %phi.bo.i, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 0
  %contract_call_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 1
  %contract_call_memcpy_from_child_pointer_casted.i.i = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i.i to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i.i = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i.i, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i.i = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i.i, 4294967295
  %20 = tail call i256 @llvm.umin.i256(i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i256 32)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %memory_store_pointer.i112, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i, i256 %20, i1 false)
  store ptr addrspace(3) %contract_call_external_result_abi_data.i.i, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, ptr @returndatasize, align 32
  br i1 %contract_call_external_result_status_code_boolean.i.i, label %if_join.i, label %if_main.i122

if_main.i122:                                     ; preds = %contract_call_ordinary_block.i
  %contract_call_external_result_abi_data.i.i.le = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 0
  %memory_load_result.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i.i116 = inttoptr i256 %memory_load_result.i.i to ptr addrspace(1)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i116, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i.le, i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i1 false)
  %returndatasize3.i.i118 = load i256, ptr @returndatasize, align 32
  %21 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i, i256 4294967295)
  %22 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i.i118, i256 4294967295)
  %exit_offset_shifted.i.i.i119 = shl nuw nsw i256 %21, 64
  %exit_length_shifted.i.i.i120 = shl nuw nsw i256 %22, 96
  %exit_abi_data.i.i.i121 = or i256 %exit_length_shifted.i.i.i120, %exit_offset_shifted.i.i.i119
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i121)
  unreachable

if_join.i:                                        ; preds = %contract_call_ordinary_block.i, %switch_case_branch_1_block.i114
  %returndatasize.i = load i256, ptr @returndatasize, align 32
  %23 = tail call i256 @llvm.umin.i256(i256 %returndatasize.i, i256 32)
  %addition_result.i.i123 = add nuw nsw i256 %23, 31
  %and_result.i.i124 = and i256 %addition_result.i.i123, 96
  %addition_result3.i.i125 = add i256 %and_result.i.i124, %memory_load_result.i111
  %comparison_result.i.i126 = icmp ult i256 %addition_result3.i.i125, %memory_load_result.i111
  %comparison_result7.i.i127 = icmp ugt i256 %addition_result3.i.i125, 18446744073709551615
  %or_result13.i.i128 = or i1 %comparison_result7.i.i127, %comparison_result.i.i126
  br i1 %or_result13.i.i128, label %if_main.i.i129, label %finalize_allocation.exit.i

if_main.i.i129:                                   ; preds = %if_join.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit.i:                       ; preds = %if_join.i
  store i256 %addition_result3.i.i125, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %comparison_result.i44.i = icmp ult i256 %returndatasize.i, 32
  br i1 %comparison_result.i44.i, label %if_main.i45.i, label %abi_decode_uint256_fromMemory.exit.i

if_main.i45.i:                                    ; preds = %finalize_allocation.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_uint256_fromMemory.exit.i:             ; preds = %finalize_allocation.exit.i
  %memory_load_result.i46.i = load i256, ptr addrspace(1) %memory_store_pointer.i112, align 1
  br label %fun_uniBalanceOf.exit

switch_default_block.i131:                        ; preds = %storage_array_index_access_contract_IERC20_dyn.exit
  store i256 -44877977326897262784168444354156441158329539312518651612887364914072161059015, ptr addrspace(2) null, align 4294967296
  store i256 %address, ptr addrspace(2) inttoptr (i256 4 to ptr addrspace(2)), align 4
  %gas_left.i.i130 = tail call i256 @llvm.syncvm.gasleft()
  %24 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i130, i256 4294967295)
  %abi_data_gas_shifted.i47.i = shl nuw nsw i256 %24, 192
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_gas_shifted.i47.i, 904625751086426111047927909714404454142933105326819602152923490636624035840
  %system_request.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i, i256 32778, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 1
  br i1 %system_request_result_status_code_boolean.i.i, label %__system_request.exit.i, label %system_request_error_block.i.i

system_request_error_block.i.i:                   ; preds = %switch_default_block.i131
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i:                          ; preds = %switch_default_block.i131
  %system_request_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 0
  %system_request_child_address.i.i = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i, align 1
  br label %fun_uniBalanceOf.exit

fun_uniBalanceOf.exit:                            ; preds = %abi_decode_uint256_fromMemory.exit.i, %__system_request.exit.i
  %return_pointer.0.i = phi i256 [ %memory_load_result.i46.i, %abi_decode_uint256_fromMemory.exit.i ], [ %system_request_child_address.i.i, %__system_request.exit.i ]
  %memory_load_result.i132 = load i256, ptr addrspace(1) %memory_store_pointer.i100, align 1
  %comparison_result.not.i133 = icmp ugt i256 %memory_load_result.i132, %storemerge239
  br i1 %comparison_result.not.i133, label %memory_array_index_access_contract_IERC20_dyn.1.exit, label %if_main.i134

if_main.i134:                                     ; preds = %fun_uniBalanceOf.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit: ; preds = %fun_uniBalanceOf.exit
  %shift_left_non_overflow_result.i135 = shl i256 %storemerge239, 5
  %addition_result7.i = add i256 %shift_left_non_overflow_result.i135, %addition_result10.i
  %memory_store_pointer = inttoptr i256 %addition_result7.i to ptr addrspace(1)
  store i256 %return_pointer.0.i, ptr addrspace(1) %memory_store_pointer, align 1
  %addition_result.i140 = add nuw i256 %storemerge239, 1
  %memory_load_result = load i256, ptr addrspace(1) %memory_store_pointer.i100, align 1
  %comparison_result16.not = icmp ult i256 %addition_result.i140, %memory_load_result
  br i1 %comparison_result16.not, label %if_join22, label %if_main21

if_main46:                                        ; preds = %require_helper_stringliteral_0005.exit, %fun_uniTransfer.exit
  %address73 = tail call i256 @llvm.syncvm.this()
  %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866_call = tail call fastcc i256 @mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866(i256 %address73)
  %storage_load74 = tail call i256 @llvm.syncvm.sload(i256 %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866_call)
  %comparison_result75 = icmp ugt i256 %storage_load74, 999
  %comparison_result_extended78 = zext i1 %comparison_result75 to i256
  tail call fastcc void @require_helper_stringliteral_0005(i256 %comparison_result_extended78)
  tail call void @llvm.syncvm.sstore(i256 5, i256 1)
  %memory_load_result79 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %25 = tail call i256 @llvm.umin.i256(i256 %memory_load_result79, i256 4294967295)
  %exit_offset_shifted.i = shl nuw nsw i256 %25, 64
  tail call void @llvm.syncvm.return(i256 %exit_offset_shifted.i)
  unreachable

if_join47:                                        ; preds = %fun_uniTransfer.exit, %require_helper_stringliteral_0005.exit
  %storemerge82242 = phi i256 [ %addition_result.i234, %require_helper_stringliteral_0005.exit ], [ 0, %fun_uniTransfer.exit ]
  %storage_load.i142 = tail call i256 @llvm.syncvm.sload(i256 8)
  %comparison_result.not.i143 = icmp ugt i256 %storage_load.i142, %storemerge82242
  br i1 %comparison_result.not.i143, label %storage_array_index_access_contract_IERC20_dyn.exit149, label %if_main.i144

if_main.i144:                                     ; preds = %if_join47
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

storage_array_index_access_contract_IERC20_dyn.exit149: ; preds = %if_join47
  store i256 8, ptr addrspace(1) null, align 4294967296
  %addition_result.i145 = add i256 %storemerge82242, -5442482557903504250613150719145357533886713417884903185095341029921719619869
  %address57 = tail call i256 @llvm.syncvm.this()
  %storage_load58 = tail call i256 @llvm.syncvm.sload(i256 %addition_result.i145)
  %phi.bo.i153 = and i256 %storage_load58, 1461501637330902918203684832716283019655932542975
  %comparison_result.not.i155 = icmp eq i256 %phi.bo.i153, 0
  br i1 %comparison_result.not.i155, label %switch_default_block.i204, label %switch_case_branch_1_block.i164

switch_case_branch_1_block.i164:                  ; preds = %storage_array_index_access_contract_IERC20_dyn.exit149
  %memory_load_result.i157 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i158 = inttoptr i256 %memory_load_result.i157 to ptr addrspace(1)
  store i256 50942633119752846454219349998365661925608737367104304655302372697894809501696, ptr addrspace(1) %memory_store_pointer.i158, align 1
  %and_result12.i159 = and i256 %address57, 1461501637330902918203684832716283019655932542975
  %addition_result.i160 = add i256 %memory_load_result.i157, 4
  %memory_store_pointer14.i161 = inttoptr i256 %addition_result.i160 to ptr addrspace(1)
  store i256 %and_result12.i159, ptr addrspace(1) %memory_store_pointer14.i161, align 1
  %gas_left.i162 = tail call i256 @llvm.syncvm.gasleft()
  %cond40.i163 = icmp eq i256 %phi.bo.i153, 4
  br i1 %cond40.i163, label %if_join.i192, label %contract_call_ordinary_block.i175

contract_call_ordinary_block.i175:                ; preds = %switch_case_branch_1_block.i164
  %26 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i157, i256 4294967295)
  %27 = tail call i256 @llvm.umin.i256(i256 %gas_left.i162, i256 4294967295)
  %abi_data_input_offset_shifted.i.i165 = shl nuw nsw i256 %26, 64
  %abi_data_gas_shifted.i.i166 = shl nuw nsw i256 %27, 192
  %abi_data_offset_and_length.i.i167 = or i256 %abi_data_gas_shifted.i.i166, %abi_data_input_offset_shifted.i.i165
  %abi_data_add_gas.i.i168 = or i256 %abi_data_offset_and_length.i.i167, 2852213850513516153367582212096
  %contract_call_external.i.i169 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_gas.i.i168, i256 %phi.bo.i153, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i.i170 = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i169, 0
  %contract_call_external_result_status_code_boolean.i.i171 = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i169, 1
  %contract_call_memcpy_from_child_pointer_casted.i.i172 = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i.i170 to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i.i173 = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i.i172, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i.i174 = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i.i173, 4294967295
  %28 = tail call i256 @llvm.umin.i256(i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i174, i256 32)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %memory_store_pointer.i158, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i170, i256 %28, i1 false)
  store ptr addrspace(3) %contract_call_external_result_abi_data.i.i170, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i174, ptr @returndatasize, align 32
  br i1 %contract_call_external_result_status_code_boolean.i.i171, label %if_join.i192, label %if_main.i184

if_main.i184:                                     ; preds = %contract_call_ordinary_block.i175
  %contract_call_external_result_abi_data.i.i170.le = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i169, 0
  %memory_load_result.i.i177 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i.i178 = inttoptr i256 %memory_load_result.i.i177 to ptr addrspace(1)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i178, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i170.le, i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i174, i1 false)
  %returndatasize3.i.i180 = load i256, ptr @returndatasize, align 32
  %29 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i177, i256 4294967295)
  %30 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i.i180, i256 4294967295)
  %exit_offset_shifted.i.i.i181 = shl nuw nsw i256 %29, 64
  %exit_length_shifted.i.i.i182 = shl nuw nsw i256 %30, 96
  %exit_abi_data.i.i.i183 = or i256 %exit_length_shifted.i.i.i182, %exit_offset_shifted.i.i.i181
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i183)
  unreachable

if_join.i192:                                     ; preds = %contract_call_ordinary_block.i175, %switch_case_branch_1_block.i164
  %returndatasize.i185 = load i256, ptr @returndatasize, align 32
  %31 = tail call i256 @llvm.umin.i256(i256 %returndatasize.i185, i256 32)
  %addition_result.i.i186 = add nuw nsw i256 %31, 31
  %and_result.i.i187 = and i256 %addition_result.i.i186, 96
  %addition_result3.i.i188 = add i256 %and_result.i.i187, %memory_load_result.i157
  %comparison_result.i.i189 = icmp ult i256 %addition_result3.i.i188, %memory_load_result.i157
  %comparison_result7.i.i190 = icmp ugt i256 %addition_result3.i.i188, 18446744073709551615
  %or_result13.i.i191 = or i1 %comparison_result7.i.i190, %comparison_result.i.i189
  br i1 %or_result13.i.i191, label %if_main.i.i193, label %finalize_allocation.exit.i195

if_main.i.i193:                                   ; preds = %if_join.i192
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit.i195:                    ; preds = %if_join.i192
  store i256 %addition_result3.i.i188, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %comparison_result.i44.i194 = icmp ult i256 %returndatasize.i185, 32
  br i1 %comparison_result.i44.i194, label %if_main.i45.i196, label %abi_decode_uint256_fromMemory.exit.i198

if_main.i45.i196:                                 ; preds = %finalize_allocation.exit.i195
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_uint256_fromMemory.exit.i198:          ; preds = %finalize_allocation.exit.i195
  %memory_load_result.i46.i197 = load i256, ptr addrspace(1) %memory_store_pointer.i158, align 1
  br label %fun_uniBalanceOf.exit209

switch_default_block.i204:                        ; preds = %storage_array_index_access_contract_IERC20_dyn.exit149
  store i256 -44877977326897262784168444354156441158329539312518651612887364914072161059015, ptr addrspace(2) null, align 4294967296
  store i256 %address57, ptr addrspace(2) inttoptr (i256 4 to ptr addrspace(2)), align 4
  %gas_left.i.i199 = tail call i256 @llvm.syncvm.gasleft()
  %32 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i199, i256 4294967295)
  %abi_data_gas_shifted.i47.i200 = shl nuw nsw i256 %32, 192
  %abi_data_add_system_call_marker.i.i201 = or i256 %abi_data_gas_shifted.i47.i200, 904625751086426111047927909714404454142933105326819602152923490636624035840
  %system_request.i.i202 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i201, i256 32778, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i203 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i202, 1
  br i1 %system_request_result_status_code_boolean.i.i203, label %__system_request.exit.i208, label %system_request_error_block.i.i205

system_request_error_block.i.i205:                ; preds = %switch_default_block.i204
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i208:                       ; preds = %switch_default_block.i204
  %system_request_result_abi_data.i.i206 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i202, 0
  %system_request_child_address.i.i207 = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i206, align 1
  br label %fun_uniBalanceOf.exit209

fun_uniBalanceOf.exit209:                         ; preds = %abi_decode_uint256_fromMemory.exit.i198, %__system_request.exit.i208
  %return_pointer.0.i156 = phi i256 [ %memory_load_result.i46.i197, %abi_decode_uint256_fromMemory.exit.i198 ], [ %system_request_child_address.i.i207, %__system_request.exit.i208 ]
  %memory_load_result.i211 = load i256, ptr addrspace(1) %memory_store_pointer.i100, align 1
  %comparison_result.not.i212 = icmp ugt i256 %memory_load_result.i211, %storemerge82242
  br i1 %comparison_result.not.i212, label %memory_array_index_access_contract_IERC20_dyn.1.exit218, label %if_main.i213

if_main.i213:                                     ; preds = %fun_uniBalanceOf.exit209
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit218: ; preds = %fun_uniBalanceOf.exit209
  %shift_left_non_overflow_result.i214 = shl i256 %storemerge82242, 5
  %addition_result7.i216 = add i256 %shift_left_non_overflow_result.i214, %addition_result10.i
  %memory_load_pointer64 = inttoptr i256 %addition_result7.i216 to ptr addrspace(1)
  %memory_load_result65 = load i256, ptr addrspace(1) %memory_load_pointer64, align 1
  %comparison_result67.not = icmp ult i256 %return_pointer.0.i156, %memory_load_result65
  br i1 %comparison_result67.not, label %if_main.i230, label %require_helper_stringliteral_0005.exit

if_main.i230:                                     ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit218
  %memory_load_result.i220 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i221 = inttoptr i256 %memory_load_result.i220 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i221, align 1
  %addition_result.i222 = add i256 %memory_load_result.i220, 4
  %memory_store_pointer4.i223 = inttoptr i256 %addition_result.i222 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i223, align 1
  %addition_result6.i224 = add i256 %memory_load_result.i220, 36
  %memory_store_pointer7.i225 = inttoptr i256 %addition_result6.i224 to ptr addrspace(1)
  store i256 24, ptr addrspace(1) %memory_store_pointer7.i225, align 1
  %addition_result9.i226 = add i256 %memory_load_result.i220, 68
  %memory_store_pointer10.i227 = inttoptr i256 %addition_result9.i226 to ptr addrspace(1)
  store i256 35024978435645830422959912878365208132433882559487967362983714244802937618432, ptr addrspace(1) %memory_store_pointer10.i227, align 1
  %33 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i220, i256 4294967295)
  %exit_offset_shifted.i.i228 = shl nuw nsw i256 %33, 64
  %exit_abi_data.i.i229 = or i256 %exit_offset_shifted.i.i228, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i229)
  unreachable

require_helper_stringliteral_0005.exit:           ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit218
  %addition_result.i234 = add nuw i256 %storemerge82242, 1
  %memory_load_result39 = load i256, ptr addrspace(1) %memory_store_pointer.i100, align 1
  %comparison_result41.not = icmp ult i256 %addition_result.i234, %memory_load_result39
  br i1 %comparison_result41.not, label %if_join47, label %if_main46
}

; Function Attrs: nofree noreturn null_pointer_is_valid
define private fastcc void @external_fun_decreaseAllowance() unnamed_addr #7 personality ptr @__personality {
entry:
  %get_u128_value = tail call i256 @llvm.syncvm.getu128()
  %if_condition_compared.not = icmp eq i256 %get_u128_value, 0
  br i1 %if_condition_compared.not, label %if_join, label %if_main

if_main:                                          ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join:                                          ; preds = %entry
  %calldatasize = load i256, ptr @calldatasize, align 32
  %addition_result = add i256 %calldatasize, -4
  %comparison_result = icmp slt i256 %addition_result, 64
  br i1 %comparison_result, label %if_main2, label %if_join3

if_main2:                                         ; preds = %if_join
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join3:                                         ; preds = %if_join
  %calldata_pointer = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 4
  %calldata_value = load i256, ptr addrspace(3) %calldata_pointer_with_offset, align 32
  %0 = icmp ugt i256 %calldata_value, 1461501637330902918203684832716283019655932542975
  br i1 %0, label %if_main.i, label %validator_revert_address.exit

if_main.i:                                        ; preds = %if_join3
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit:                    ; preds = %if_join3
  %calldata_pointer_with_offset6 = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 36
  %calldata_value7 = load i256, ptr addrspace(3) %calldata_pointer_with_offset6, align 32
  %caller = tail call i256 @llvm.syncvm.caller()
  store i256 %caller, ptr addrspace(1) null, align 4294967296
  store i256 1, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %1 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_gas_shifted.i = shl nuw nsw i256 %1, 192
  %abi_data_add_system_call_marker.i = or i256 %abi_data_gas_shifted.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i, label %__keccak256.exit, label %keccak256_failure_block.i

keccak256_failure_block.i:                        ; preds = %validator_revert_address.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit:                                 ; preds = %validator_revert_address.exit
  %keccak256_call_external_result_abi_data_pointer.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 0
  %keccak256_child_data.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i, align 1
  %and_result.i = and i256 %calldata_value, 1461501637330902918203684832716283019655932542975
  store i256 %and_result.i, ptr addrspace(1) null, align 4294967296
  store i256 %keccak256_child_data.i, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %2 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %2, 192
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_gas_shifted.i.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit, label %keccak256_failure_block.i.i

keccak256_failure_block.i.i:                      ; preds = %__keccak256.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit: ; preds = %__keccak256.exit
  %keccak256_call_external_result_abi_data_pointer.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 0
  %keccak256_child_data.i.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i, align 1
  %storage_load = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i)
  %comparison_result11 = icmp ult i256 %storage_load, %calldata_value7
  br i1 %comparison_result11, label %if_main14, label %if_join15

if_main14:                                        ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer, align 1
  %addition_result18 = add i256 %memory_load_result, 4
  %memory_store_pointer19 = inttoptr i256 %addition_result18 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer19, align 1
  %addition_result21 = add i256 %memory_load_result, 36
  %memory_store_pointer22 = inttoptr i256 %addition_result21 to ptr addrspace(1)
  store i256 37, ptr addrspace(1) %memory_store_pointer22, align 1
  %addition_result24 = add i256 %memory_load_result, 68
  %memory_store_pointer25 = inttoptr i256 %addition_result24 to ptr addrspace(1)
  store i256 31354931781638678506476475496475743842680577777870365728514456330491174612855, ptr addrspace(1) %memory_store_pointer25, align 1
  %addition_result27 = add i256 %memory_load_result, 100
  %memory_store_pointer28 = inttoptr i256 %addition_result27 to ptr addrspace(1)
  store i256 14690266658072097593480850647027335513285713462661904985951319567533531463680, ptr addrspace(1) %memory_store_pointer28, align 1
  %3 = tail call i256 @llvm.umin.i256(i256 %memory_load_result, i256 4294967295)
  %exit_offset_shifted.i = shl nuw nsw i256 %3, 64
  %exit_abi_data.i = or i256 %exit_offset_shifted.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i)
  unreachable

if_join15:                                        ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit
  %subtraction_result = sub i256 %storage_load, %calldata_value7
  tail call fastcc void @fun_approve(i256 %caller, i256 %calldata_value, i256 %subtraction_result)
  %memory_load_result34 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result34 to ptr addrspace(1)
  store i256 1, ptr addrspace(1) %memory_store_pointer.i, align 1
  %4 = tail call i256 @llvm.umin.i256(i256 %memory_load_result34, i256 4294967295)
  %exit_offset_shifted.i41 = shl nuw nsw i256 %4, 64
  %exit_abi_data_add_heap_auxiliary_marker.i = or i256 %exit_offset_shifted.i41, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i)
  unreachable
}

; Function Attrs: nofree noreturn null_pointer_is_valid
define private fastcc void @external_fun_swap() unnamed_addr #7 personality ptr @__personality {
entry:
  %calldatasize = load i256, ptr @calldatasize, align 32
  %addition_result = add i256 %calldatasize, -4
  %comparison_result = icmp slt i256 %addition_result, 160
  br i1 %comparison_result, label %if_main, label %if_join

if_main:                                          ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join:                                          ; preds = %entry
  %calldata_pointer = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 4
  %calldata_value = load i256, ptr addrspace(3) %calldata_pointer_with_offset, align 32
  %0 = icmp ugt i256 %calldata_value, 1461501637330902918203684832716283019655932542975
  br i1 %0, label %if_main.i, label %validator_revert_address.exit

if_main.i:                                        ; preds = %if_join
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit:                    ; preds = %if_join
  %calldata_pointer_with_offset3 = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 36
  %calldata_value4 = load i256, ptr addrspace(3) %calldata_pointer_with_offset3, align 32
  %1 = icmp ugt i256 %calldata_value4, 1461501637330902918203684832716283019655932542975
  br i1 %1, label %if_main.i74, label %validator_revert_address.exit75

if_main.i74:                                      ; preds = %validator_revert_address.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit75:                  ; preds = %validator_revert_address.exit
  %calldata_pointer_with_offset7 = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 68
  %calldata_value8 = load i256, ptr addrspace(3) %calldata_pointer_with_offset7, align 32
  %calldata_pointer_with_offset10 = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 132
  %calldata_value11 = load i256, ptr addrspace(3) %calldata_pointer_with_offset10, align 32
  %2 = icmp ugt i256 %calldata_value11, 1461501637330902918203684832716283019655932542975
  br i1 %2, label %if_main.i76, label %validator_revert_address.exit77

if_main.i76:                                      ; preds = %validator_revert_address.exit75
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

validator_revert_address.exit77:                  ; preds = %validator_revert_address.exit75
  %storage_load = tail call i256 @llvm.syncvm.sload(i256 5)
  %comparison_result12.not = icmp eq i256 %storage_load, 2
  br i1 %comparison_result12.not, label %if_main.i78, label %require_helper_stringliteral_ebf7.exit

if_main.i78:                                      ; preds = %validator_revert_address.exit77
  %memory_load_result.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i, align 1
  %addition_result.i = add i256 %memory_load_result.i, 4
  %memory_store_pointer4.i = inttoptr i256 %addition_result.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i, align 1
  %addition_result6.i = add i256 %memory_load_result.i, 36
  %memory_store_pointer7.i = inttoptr i256 %addition_result6.i to ptr addrspace(1)
  store i256 31, ptr addrspace(1) %memory_store_pointer7.i, align 1
  %addition_result9.i = add i256 %memory_load_result.i, 68
  %memory_store_pointer10.i = inttoptr i256 %addition_result9.i to ptr addrspace(1)
  store i256 37268805191608899176760263720700790282416321829889089033725955971341467020288, ptr addrspace(1) %memory_store_pointer10.i, align 1
  %3 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i, i256 4294967295)
  %exit_offset_shifted.i.i = shl nuw nsw i256 %3, 64
  %exit_abi_data.i.i = or i256 %exit_offset_shifted.i.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i)
  unreachable

require_helper_stringliteral_ebf7.exit:           ; preds = %validator_revert_address.exit77
  tail call void @llvm.syncvm.sstore(i256 5, i256 2)
  %and_result = and i256 %calldata_value, 1461501637330902918203684832716283019655932542975
  %comparison_result17 = icmp eq i256 %and_result, 0
  %storemerge = select i1 %comparison_result17, i256 %calldata_value8, i256 0
  %get_u128_value = tail call i256 @llvm.syncvm.getu128()
  %comparison_result23.not = icmp eq i256 %get_u128_value, %storemerge
  br i1 %comparison_result23.not, label %require_helper_stringliteral_a468.exit, label %if_main.i90

if_main.i90:                                      ; preds = %require_helper_stringliteral_ebf7.exit
  %memory_load_result.i80 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i81 = inttoptr i256 %memory_load_result.i80 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i81, align 1
  %addition_result.i82 = add i256 %memory_load_result.i80, 4
  %memory_store_pointer4.i83 = inttoptr i256 %addition_result.i82 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i83, align 1
  %addition_result6.i84 = add i256 %memory_load_result.i80, 36
  %memory_store_pointer7.i85 = inttoptr i256 %addition_result6.i84 to ptr addrspace(1)
  store i256 28, ptr addrspace(1) %memory_store_pointer7.i85, align 1
  %addition_result9.i86 = add i256 %memory_load_result.i80, 68
  %memory_store_pointer10.i87 = inttoptr i256 %addition_result9.i86 to ptr addrspace(1)
  store i256 35024978435645830422959912910604147404035792256690403065796751455643838185472, ptr addrspace(1) %memory_store_pointer10.i87, align 1
  %4 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i80, i256 4294967295)
  %exit_offset_shifted.i.i88 = shl nuw nsw i256 %4, 64
  %exit_abi_data.i.i89 = or i256 %exit_offset_shifted.i.i88, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i89)
  unreachable

require_helper_stringliteral_a468.exit:           ; preds = %require_helper_stringliteral_ebf7.exit
  %address = tail call i256 @llvm.syncvm.this()
  br i1 %comparison_result17, label %switch_default_block.i, label %switch_case_branch_1_block.i

switch_case_branch_1_block.i:                     ; preds = %require_helper_stringliteral_a468.exit
  %memory_load_result.i91 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i92 = inttoptr i256 %memory_load_result.i91 to ptr addrspace(1)
  store i256 50942633119752846454219349998365661925608737367104304655302372697894809501696, ptr addrspace(1) %memory_store_pointer.i92, align 1
  %and_result12.i = and i256 %address, 1461501637330902918203684832716283019655932542975
  %addition_result.i93 = add i256 %memory_load_result.i91, 4
  %memory_store_pointer14.i = inttoptr i256 %addition_result.i93 to ptr addrspace(1)
  store i256 %and_result12.i, ptr addrspace(1) %memory_store_pointer14.i, align 1
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %cond40.i = icmp eq i256 %and_result, 4
  br i1 %cond40.i, label %if_join.i, label %contract_call_ordinary_block.i

contract_call_ordinary_block.i:                   ; preds = %switch_case_branch_1_block.i
  %5 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i91, i256 4294967295)
  %6 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_input_offset_shifted.i.i = shl nuw nsw i256 %5, 64
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %6, 192
  %abi_data_offset_and_length.i.i = or i256 %abi_data_gas_shifted.i.i, %abi_data_input_offset_shifted.i.i
  %abi_data_add_gas.i.i = or i256 %abi_data_offset_and_length.i.i, 2852213850513516153367582212096
  %contract_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_gas.i.i, i256 %and_result, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 0
  %contract_call_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 1
  %contract_call_memcpy_from_child_pointer_casted.i.i = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i.i to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i.i = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i.i, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i.i = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i.i, 4294967295
  %7 = tail call i256 @llvm.umin.i256(i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i256 32)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %memory_store_pointer.i92, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i, i256 %7, i1 false)
  store ptr addrspace(3) %contract_call_external_result_abi_data.i.i, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, ptr @returndatasize, align 32
  br i1 %contract_call_external_result_status_code_boolean.i.i, label %if_join.i, label %if_main.i94

if_main.i94:                                      ; preds = %contract_call_ordinary_block.i
  %memory_load_result.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i.i = inttoptr i256 %memory_load_result.i.i to ptr addrspace(1)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i, i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i1 false)
  %returndatasize3.i.i = load i256, ptr @returndatasize, align 32
  %8 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i, i256 4294967295)
  %9 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i = shl nuw nsw i256 %8, 64
  %exit_length_shifted.i.i.i = shl nuw nsw i256 %9, 96
  %exit_abi_data.i.i.i = or i256 %exit_length_shifted.i.i.i, %exit_offset_shifted.i.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i)
  unreachable

if_join.i:                                        ; preds = %contract_call_ordinary_block.i, %switch_case_branch_1_block.i
  %returndatasize.i = load i256, ptr @returndatasize, align 32
  %10 = tail call i256 @llvm.umin.i256(i256 %returndatasize.i, i256 32)
  %addition_result.i.i = add nuw nsw i256 %10, 31
  %and_result.i.i = and i256 %addition_result.i.i, 96
  %addition_result3.i.i = add i256 %and_result.i.i, %memory_load_result.i91
  %comparison_result.i.i = icmp ult i256 %addition_result3.i.i, %memory_load_result.i91
  %comparison_result7.i.i = icmp ugt i256 %addition_result3.i.i, 18446744073709551615
  %or_result13.i.i = or i1 %comparison_result7.i.i, %comparison_result.i.i
  br i1 %or_result13.i.i, label %if_main.i.i, label %finalize_allocation.exit.i

if_main.i.i:                                      ; preds = %if_join.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit.i:                       ; preds = %if_join.i
  store i256 %addition_result3.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %comparison_result.i44.i = icmp ult i256 %returndatasize.i, 32
  br i1 %comparison_result.i44.i, label %if_main.i45.i, label %abi_decode_uint256_fromMemory.exit.i

if_main.i45.i:                                    ; preds = %finalize_allocation.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_uint256_fromMemory.exit.i:             ; preds = %finalize_allocation.exit.i
  %memory_load_result.i46.i = load i256, ptr addrspace(1) %memory_store_pointer.i92, align 1
  br label %fun_uniBalanceOf.exit

switch_default_block.i:                           ; preds = %require_helper_stringliteral_a468.exit
  store i256 -44877977326897262784168444354156441158329539312518651612887364914072161059015, ptr addrspace(2) null, align 4294967296
  store i256 %address, ptr addrspace(2) inttoptr (i256 4 to ptr addrspace(2)), align 4
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %11 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_gas_shifted.i47.i = shl nuw nsw i256 %11, 192
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_gas_shifted.i47.i, 904625751086426111047927909714404454142933105326819602152923490636624035840
  %system_request.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i, i256 32778, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 1
  br i1 %system_request_result_status_code_boolean.i.i, label %__system_request.exit.i, label %system_request_error_block.i.i

system_request_error_block.i.i:                   ; preds = %switch_default_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i:                          ; preds = %switch_default_block.i
  %system_request_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 0
  %system_request_child_address.i.i = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i, align 1
  br label %fun_uniBalanceOf.exit

fun_uniBalanceOf.exit:                            ; preds = %abi_decode_uint256_fromMemory.exit.i, %__system_request.exit.i
  %return_pointer.0.i = phi i256 [ %memory_load_result.i46.i, %abi_decode_uint256_fromMemory.exit.i ], [ %system_request_child_address.i.i, %__system_request.exit.i ]
  br i1 %comparison_result17, label %switch_default_block30, label %switch_join_block27

switch_join_block27:                              ; preds = %fun_uniBalanceOf.exit, %switch_default_block30
  %storemerge73 = phi i256 [ %get_u128_value31, %switch_default_block30 ], [ 0, %fun_uniBalanceOf.exit ]
  %fun_sub_call = tail call fastcc i256 @fun_sub(i256 %return_pointer.0.i, i256 %storemerge73)
  %fun_uniBalanceOf_call36 = tail call fastcc i256 @fun_uniBalanceOf(i256 %calldata_value4, i256 %address)
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  tail call fastcc void @finalize_allocation_14877(i256 %memory_load_result)
  %memory_store_pointer = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 %fun_sub_call, ptr addrspace(1) %memory_store_pointer, align 1
  %addition_result41 = add i256 %memory_load_result, 32
  %memory_store_pointer44 = inttoptr i256 %addition_result41 to ptr addrspace(1)
  store i256 %fun_uniBalanceOf_call36, ptr addrspace(1) %memory_store_pointer44, align 1
  %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14878_call = tail call fastcc i256 @mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14878(i256 %calldata_value)
  %read_from_storage_reference_type_struct_Data_call = tail call fastcc i256 @read_from_storage_reference_type_struct_Data(i256 %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14878_call)
  %memory_load_result47 = load i256, ptr addrspace(1) %memory_store_pointer, align 1
  %fun_current_call = tail call fastcc i256 @fun_current(i256 %read_from_storage_reference_type_struct_Data_call, i256 %memory_load_result47)
  %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14879_call = tail call fastcc i256 @mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14879(i256 %calldata_value4)
  %read_from_storage_reference_type_struct_Data_call50 = tail call fastcc i256 @read_from_storage_reference_type_struct_Data(i256 %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14879_call)
  %memory_load_result53 = load i256, ptr addrspace(1) %memory_store_pointer44, align 1
  %fun_current_call55 = tail call fastcc i256 @fun_current(i256 %read_from_storage_reference_type_struct_Data_call50, i256 %memory_load_result53)
  tail call fastcc void @fun_uniTransferFromSenderToThis(i256 %calldata_value, i256 %calldata_value8)
  %fun_uniBalanceOf_call60 = tail call fastcc i256 @fun_uniBalanceOf(i256 %calldata_value, i256 %address)
  %memory_load_result63 = load i256, ptr addrspace(1) %memory_store_pointer, align 1
  %fun_sub_call65 = tail call fastcc i256 @fun_sub(i256 %fun_uniBalanceOf_call60, i256 %memory_load_result63)
  tail call void @llvm.syncvm.sstore(i256 5, i256 1)
  %memory_load_result66 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i96 = inttoptr i256 %memory_load_result66 to ptr addrspace(1)
  store i256 %fun_sub_call65, ptr addrspace(1) %memory_store_pointer.i96, align 1
  %12 = tail call i256 @llvm.umin.i256(i256 %memory_load_result66, i256 4294967295)
  %exit_offset_shifted.i = shl nuw nsw i256 %12, 64
  %exit_abi_data_add_heap_auxiliary_marker.i = or i256 %exit_offset_shifted.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i)
  unreachable

switch_default_block30:                           ; preds = %fun_uniBalanceOf.exit
  %get_u128_value31 = tail call i256 @llvm.syncvm.getu128()
  br label %switch_join_block27
}

; Function Attrs: nofree noreturn null_pointer_is_valid
define private fastcc void @external_fun_deposit() unnamed_addr #7 personality ptr @__personality {
entry:
  %calldatasize = load i256, ptr @calldatasize, align 32
  %addition_result = add i256 %calldatasize, -4
  %comparison_result = icmp slt i256 %addition_result, 64
  br i1 %comparison_result, label %if_main, label %if_join

if_main:                                          ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join:                                          ; preds = %entry
  %calldata_pointer = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 4
  %calldata_value = load i256, ptr addrspace(3) %calldata_pointer_with_offset, align 32
  %comparison_result3 = icmp ugt i256 %calldata_value, 18446744073709551615
  br i1 %comparison_result3, label %if_main6, label %if_join7

if_main6:                                         ; preds = %if_join
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join7:                                         ; preds = %if_join
  %binding_0_pointer = alloca i256, align 32
  store i256 0, ptr %binding_0_pointer, align 32
  %binding_1_pointer = alloca i256, align 32
  store i256 0, ptr %binding_1_pointer, align 32
  %addition_result.i = add i256 %calldata_value, 35
  %comparison_result.not.i = icmp slt i256 %addition_result.i, %calldatasize
  br i1 %comparison_result.not.i, label %if_join.i, label %if_main.i

if_main.i:                                        ; preds = %if_join7
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i:                                        ; preds = %if_join7
  %addition_result10 = add i256 %calldata_value, 4
  %calldata_pointer_with_offset.i = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 %addition_result10
  %calldata_value.i = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i, align 32
  %comparison_result6.i = icmp ugt i256 %calldata_value.i, 18446744073709551615
  br i1 %comparison_result6.i, label %if_main9.i, label %if_join10.i

if_main9.i:                                       ; preds = %if_join.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join10.i:                                      ; preds = %if_join.i
  %shift_left_non_overflow_result.i = shl i256 %calldata_value.i, 5
  %addition_result16.i = add i256 %calldata_value, 36
  %addition_result17.i = add i256 %shift_left_non_overflow_result.i, %addition_result16.i
  %comparison_result18.i = icmp ugt i256 %addition_result17.i, %calldatasize
  br i1 %comparison_result18.i, label %if_main21.i, label %abi_decode_array_uint256_dyn_calldata.exit

if_main21.i:                                      ; preds = %if_join10.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_array_uint256_dyn_calldata.exit:       ; preds = %if_join10.i
  store i256 %addition_result16.i, ptr %binding_0_pointer, align 32
  store i256 %calldata_value.i, ptr %binding_1_pointer, align 32
  %calldata_pointer_with_offset12 = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 36
  %calldata_value13 = load i256, ptr addrspace(3) %calldata_pointer_with_offset12, align 32
  %comparison_result16 = icmp ugt i256 %calldata_value13, 18446744073709551615
  br i1 %comparison_result16, label %if_main19, label %if_join20

if_main19:                                        ; preds = %abi_decode_array_uint256_dyn_calldata.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join20:                                        ; preds = %abi_decode_array_uint256_dyn_calldata.exit
  %binding_0_pointer21 = alloca i256, align 32
  store i256 0, ptr %binding_0_pointer21, align 32
  %binding_1_pointer22 = alloca i256, align 32
  store i256 0, ptr %binding_1_pointer22, align 32
  %addition_result.i324 = add i256 %calldata_value13, 35
  %comparison_result.not.i325 = icmp slt i256 %addition_result.i324, %calldatasize
  br i1 %comparison_result.not.i325, label %if_join.i331, label %if_main.i326

if_main.i326:                                     ; preds = %if_join20
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i331:                                     ; preds = %if_join20
  %addition_result25 = add i256 %calldata_value13, 4
  %calldata_pointer_with_offset.i328 = getelementptr i8, ptr addrspace(3) %calldata_pointer, i256 %addition_result25
  %calldata_value.i329 = load i256, ptr addrspace(3) %calldata_pointer_with_offset.i328, align 32
  %comparison_result6.i330 = icmp ugt i256 %calldata_value.i329, 18446744073709551615
  br i1 %comparison_result6.i330, label %if_main9.i332, label %if_join10.i337

if_main9.i332:                                    ; preds = %if_join.i331
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join10.i337:                                   ; preds = %if_join.i331
  %shift_left_non_overflow_result.i333 = shl i256 %calldata_value.i329, 5
  %addition_result16.i334 = add i256 %calldata_value13, 36
  %addition_result17.i335 = add i256 %shift_left_non_overflow_result.i333, %addition_result16.i334
  %comparison_result18.i336 = icmp ugt i256 %addition_result17.i335, %calldatasize
  br i1 %comparison_result18.i336, label %if_main21.i338, label %abi_decode_array_uint256_dyn_calldata.exit342

if_main21.i338:                                   ; preds = %if_join10.i337
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_array_uint256_dyn_calldata.exit342:    ; preds = %if_join10.i337
  store i256 %addition_result16.i334, ptr %binding_0_pointer21, align 32
  store i256 %calldata_value.i329, ptr %binding_1_pointer22, align 32
  %storage_load = tail call i256 @llvm.syncvm.sload(i256 5)
  %comparison_result32.not = icmp eq i256 %storage_load, 2
  br i1 %comparison_result32.not, label %if_main.i344, label %require_helper_stringliteral_ebf7.exit

if_main.i344:                                     ; preds = %abi_decode_array_uint256_dyn_calldata.exit342
  %memory_load_result.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i, align 1
  %addition_result.i343 = add i256 %memory_load_result.i, 4
  %memory_store_pointer4.i = inttoptr i256 %addition_result.i343 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i, align 1
  %addition_result6.i = add i256 %memory_load_result.i, 36
  %memory_store_pointer7.i = inttoptr i256 %addition_result6.i to ptr addrspace(1)
  store i256 31, ptr addrspace(1) %memory_store_pointer7.i, align 1
  %addition_result9.i = add i256 %memory_load_result.i, 68
  %memory_store_pointer10.i = inttoptr i256 %addition_result9.i to ptr addrspace(1)
  store i256 37268805191608899176760263720700790282416321829889089033725955971341467020288, ptr addrspace(1) %memory_store_pointer10.i, align 1
  %0 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i, i256 4294967295)
  %exit_offset_shifted.i.i = shl nuw nsw i256 %0, 64
  %exit_abi_data.i.i = or i256 %exit_offset_shifted.i.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i)
  unreachable

require_helper_stringliteral_ebf7.exit:           ; preds = %abi_decode_array_uint256_dyn_calldata.exit342
  tail call void @llvm.syncvm.sstore(i256 5, i256 2)
  %var_fairSupply = alloca i256, align 32
  store i256 0, ptr %var_fairSupply, align 32
  %var_tokens_mpos = alloca i256, align 32
  %memory_load_result.i346 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %storage_load.i = tail call i256 @llvm.syncvm.sload(i256 8)
  %memory_store_pointer.i347 = inttoptr i256 %memory_load_result.i346 to ptr addrspace(1)
  store i256 %storage_load.i, ptr addrspace(1) %memory_store_pointer.i347, align 1
  store i256 8, ptr addrspace(1) null, align 4294967296
  %pos.033.i = add i256 %memory_load_result.i346, 32
  %comparison_result34.not.i = icmp eq i256 %storage_load.i, 0
  br i1 %comparison_result34.not.i, label %for_join.i, label %for_body.i

for_body.i:                                       ; preds = %require_helper_stringliteral_ebf7.exit, %for_body.i
  %pos.037.i = phi i256 [ %pos.0.i, %for_body.i ], [ %pos.033.i, %require_helper_stringliteral_ebf7.exit ]
  %i.036.i = phi i256 [ %addition_result17.i349, %for_body.i ], [ 0, %require_helper_stringliteral_ebf7.exit ]
  %srcPtr.035.i = phi i256 [ %addition_result15.i, %for_body.i ], [ -5442482557903504250613150719145357533886713417884903185095341029921719619869, %require_helper_stringliteral_ebf7.exit ]
  %storage_load8.i = tail call i256 @llvm.syncvm.sload(i256 %srcPtr.035.i)
  %and_result.i = and i256 %storage_load8.i, 1461501637330902918203684832716283019655932542975
  %memory_store_pointer10.i348 = inttoptr i256 %pos.037.i to ptr addrspace(1)
  store i256 %and_result.i, ptr addrspace(1) %memory_store_pointer10.i348, align 1
  %addition_result15.i = add i256 %srcPtr.035.i, 1
  %addition_result17.i349 = add nuw i256 %i.036.i, 1
  %pos.0.i = add i256 %pos.037.i, 32
  %comparison_result.i350 = icmp ult i256 %addition_result17.i349, %storage_load.i
  br i1 %comparison_result.i350, label %for_body.i, label %for_join.i

for_join.i:                                       ; preds = %for_body.i, %require_helper_stringliteral_ebf7.exit
  %pos.0.lcssa.i = phi i256 [ %pos.033.i, %require_helper_stringliteral_ebf7.exit ], [ %pos.0.i, %for_body.i ]
  %subtraction_result20.i = sub i256 31, %memory_load_result.i346
  %addition_result.i.i = add i256 %subtraction_result20.i, %pos.0.lcssa.i
  %and_result.i.i = and i256 %addition_result.i.i, -32
  %addition_result3.i.i = add i256 %and_result.i.i, %memory_load_result.i346
  %comparison_result.i.i = icmp ult i256 %addition_result3.i.i, %memory_load_result.i346
  %comparison_result7.i.i = icmp ugt i256 %addition_result3.i.i, 18446744073709551615
  %or_result13.i.i = or i1 %comparison_result7.i.i, %comparison_result.i.i
  br i1 %or_result13.i.i, label %if_main.i.i, label %copy_array_from_storage_to_memory_array_contract_IERC20_dyn.exit

if_main.i.i:                                      ; preds = %for_join.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

copy_array_from_storage_to_memory_array_contract_IERC20_dyn.exit: ; preds = %for_join.i
  store i256 %addition_result3.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  store i256 %memory_load_result.i346, ptr %var_tokens_mpos, align 32
  %memory_load_result = load i256, ptr addrspace(1) %memory_store_pointer.i347, align 1
  %comparison_result37.not = icmp eq i256 %calldata_value.i, %memory_load_result
  br i1 %comparison_result37.not, label %require_helper_stringliteral_732a.exit, label %if_main.i362

if_main.i362:                                     ; preds = %copy_array_from_storage_to_memory_array_contract_IERC20_dyn.exit
  %memory_store_pointer.i353 = inttoptr i256 %addition_result3.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i353, align 1
  %addition_result.i354 = add i256 %addition_result3.i.i, 4
  %memory_store_pointer4.i355 = inttoptr i256 %addition_result.i354 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i355, align 1
  %addition_result6.i356 = add i256 %addition_result3.i.i, 36
  %memory_store_pointer7.i357 = inttoptr i256 %addition_result6.i356 to ptr addrspace(1)
  store i256 31, ptr addrspace(1) %memory_store_pointer7.i357, align 1
  %addition_result9.i358 = add i256 %addition_result3.i.i, 68
  %memory_store_pointer10.i359 = inttoptr i256 %addition_result9.i358 to ptr addrspace(1)
  store i256 35024978435645830422959912910604147404035683462082984842747680333694885980160, ptr addrspace(1) %memory_store_pointer10.i359, align 1
  %1 = tail call i256 @llvm.umin.i256(i256 %addition_result3.i.i, i256 4294967295)
  %exit_offset_shifted.i.i360 = shl nuw nsw i256 %1, 64
  %exit_abi_data.i.i361 = or i256 %exit_offset_shifted.i.i360, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i361)
  unreachable

require_helper_stringliteral_732a.exit:           ; preds = %copy_array_from_storage_to_memory_array_contract_IERC20_dyn.exit
  %comparison_result.i365 = icmp eq i256 %memory_load_result, 0
  br i1 %comparison_result.i365, label %if_main.i366, label %memory_array_index_access_contract_IERC20_dyn_14882.exit

if_main.i366:                                     ; preds = %require_helper_stringliteral_732a.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn_14882.exit: ; preds = %require_helper_stringliteral_732a.exit
  %memory_load_pointer.i369 = inttoptr i256 %pos.033.i to ptr addrspace(1)
  %memory_load_result.i370 = load i256, ptr addrspace(1) %memory_load_pointer.i369, align 1
  %and_result.i371 = and i256 %memory_load_result.i370, 1461501637330902918203684832716283019655932542975
  %comparison_result.i372.not = icmp eq i256 %and_result.i371, 0
  br i1 %comparison_result.i372.not, label %switch_default_block55, label %switch_case_branch_1_block

switch_join_block.sink.split:                     ; preds = %switch_default_block55, %calldata_array_index_access_uint256_dyn_calldata_14884.exit
  %addition_result.i408.sink = phi i256 [ %addition_result.i408, %calldata_array_index_access_uint256_dyn_calldata_14884.exit ], [ %addition_result16.i, %switch_default_block55 ]
  %calldata_pointer51 = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset52 = getelementptr i8, ptr addrspace(3) %calldata_pointer51, i256 %addition_result.i408.sink
  %calldata_value53 = load i256, ptr addrspace(3) %calldata_pointer_with_offset52, align 32
  br label %switch_join_block

switch_join_block:                                ; preds = %switch_join_block.sink.split, %memory_array_index_access_contract_IERC20_dyn_14883.exit
  %storemerge = phi i256 [ 0, %memory_array_index_access_contract_IERC20_dyn_14883.exit ], [ %calldata_value53, %switch_join_block.sink.split ]
  %get_u128_value = tail call i256 @llvm.syncvm.getu128()
  %comparison_result62.not = icmp eq i256 %get_u128_value, %storemerge
  br i1 %comparison_result62.not, label %require_helper_stringliteral_a468.exit, label %if_main.i384

if_main.i384:                                     ; preds = %switch_join_block
  %memory_load_result.i374 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i375 = inttoptr i256 %memory_load_result.i374 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i375, align 1
  %addition_result.i376 = add i256 %memory_load_result.i374, 4
  %memory_store_pointer4.i377 = inttoptr i256 %addition_result.i376 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i377, align 1
  %addition_result6.i378 = add i256 %memory_load_result.i374, 36
  %memory_store_pointer7.i379 = inttoptr i256 %addition_result6.i378 to ptr addrspace(1)
  store i256 28, ptr addrspace(1) %memory_store_pointer7.i379, align 1
  %addition_result9.i380 = add i256 %memory_load_result.i374, 68
  %memory_store_pointer10.i381 = inttoptr i256 %addition_result9.i380 to ptr addrspace(1)
  store i256 35024978435645830422959912910604147404035792256690403065796751455643838185472, ptr addrspace(1) %memory_store_pointer10.i381, align 1
  %2 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i374, i256 4294967295)
  %exit_offset_shifted.i.i382 = shl nuw nsw i256 %2, 64
  %exit_abi_data.i.i383 = or i256 %exit_offset_shifted.i.i382, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i383)
  unreachable

require_helper_stringliteral_a468.exit:           ; preds = %switch_join_block
  %expr_mpos = alloca i256, align 32
  %memory_load_result.i388 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %addition_result.i16.i = add i256 %shift_left_non_overflow_result.i, 63
  %and_result.i.i389 = and i256 %addition_result.i16.i, -32
  %addition_result3.i.i390 = add i256 %memory_load_result.i388, %and_result.i.i389
  %comparison_result.i17.i = icmp ult i256 %addition_result3.i.i390, %memory_load_result.i388
  %comparison_result7.i.i391 = icmp ugt i256 %addition_result3.i.i390, 18446744073709551615
  %or_result13.i.i392 = or i1 %comparison_result7.i.i391, %comparison_result.i17.i
  br i1 %or_result13.i.i392, label %if_main.i18.i, label %allocate_and_zero_memory_array_array_uint256_dyn.exit

if_main.i18.i:                                    ; preds = %require_helper_stringliteral_a468.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

allocate_and_zero_memory_array_array_uint256_dyn.exit: ; preds = %require_helper_stringliteral_a468.exit
  store i256 %addition_result3.i.i390, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i393 = inttoptr i256 %memory_load_result.i388 to ptr addrspace(1)
  store i256 %calldata_value.i, ptr addrspace(1) %memory_store_pointer.i393, align 1
  %calldatasize.i = load i256, ptr @calldatasize, align 32
  %addition_result10.i = add i256 %memory_load_result.i388, 32
  %calldata_copy_destination_pointer.i = inttoptr i256 %addition_result10.i to ptr addrspace(1)
  %calldata_pointer.i394 = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_source_pointer.i = getelementptr i8, ptr addrspace(3) %calldata_pointer.i394, i256 %calldatasize.i
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %calldata_copy_destination_pointer.i, ptr addrspace(3) align 1 %calldata_source_pointer.i, i256 %shift_left_non_overflow_result.i, i1 false)
  store i256 %memory_load_result.i388, ptr %expr_mpos, align 32
  %memory_load_result681279 = load i256, ptr addrspace(1) %memory_store_pointer.i393, align 1
  %comparison_result70.not1280.not = icmp eq i256 %memory_load_result681279, 0
  br i1 %comparison_result70.not1280.not, label %if_main75, label %if_join76.lr.ph

if_join76.lr.ph:                                  ; preds = %allocate_and_zero_memory_array_array_uint256_dyn.exit
  %address = tail call i256 @llvm.syncvm.this()
  %and_result12.i = and i256 %address, 1461501637330902918203684832716283019655932542975
  br label %if_join76

switch_case_branch_1_block:                       ; preds = %memory_array_index_access_contract_IERC20_dyn_14882.exit
  %comparison_result.i397 = icmp ult i256 %memory_load_result, 2
  br i1 %comparison_result.i397, label %if_main.i398, label %memory_array_index_access_contract_IERC20_dyn_14883.exit

if_main.i398:                                     ; preds = %switch_case_branch_1_block
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn_14883.exit: ; preds = %switch_case_branch_1_block
  %addition_result.i399 = add i256 %memory_load_result.i346, 64
  %memory_load_pointer.i401 = inttoptr i256 %addition_result.i399 to ptr addrspace(1)
  %memory_load_result.i402 = load i256, ptr addrspace(1) %memory_load_pointer.i401, align 1
  %and_result.i403 = and i256 %memory_load_result.i402, 1461501637330902918203684832716283019655932542975
  %comparison_result.i404.not = icmp eq i256 %and_result.i403, 0
  br i1 %comparison_result.i404.not, label %switch_default_block, label %switch_join_block

switch_default_block:                             ; preds = %memory_array_index_access_contract_IERC20_dyn_14883.exit
  %comparison_result.i406 = icmp ult i256 %calldata_value.i, 2
  br i1 %comparison_result.i406, label %if_main.i407, label %calldata_array_index_access_uint256_dyn_calldata_14884.exit

if_main.i407:                                     ; preds = %switch_default_block
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

calldata_array_index_access_uint256_dyn_calldata_14884.exit: ; preds = %switch_default_block
  %addition_result.i408 = add i256 %calldata_value, 68
  br label %switch_join_block.sink.split

switch_default_block55:                           ; preds = %memory_array_index_access_contract_IERC20_dyn_14882.exit
  %comparison_result.i410 = icmp eq i256 %calldata_value.i, 0
  br i1 %comparison_result.i410, label %if_main.i411, label %switch_join_block.sink.split

if_main.i411:                                     ; preds = %switch_default_block55
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_main75:                                        ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit467, %allocate_and_zero_memory_array_array_uint256_dyn.exit
  %memory_load_result68.lcssa = phi i256 [ %memory_load_result681279, %allocate_and_zero_memory_array_array_uint256_dyn.exit ], [ %memory_load_result68, %memory_array_index_access_contract_IERC20_dyn.1.exit467 ]
  %_2 = alloca i256, align 32
  %storage_load98 = tail call i256 @llvm.syncvm.sload(i256 2)
  store i256 %storage_load98, ptr %_2, align 32
  %expr_7 = alloca i256, align 32
  %comparison_result100 = icmp eq i256 %storage_load98, 0
  %comparison_result_extended101 = zext i1 %comparison_result100 to i256
  store i256 %comparison_result_extended101, ptr %expr_7, align 32
  br i1 %comparison_result100, label %switch_default_block129, label %switch_case_branch_1_block104

if_join76:                                        ; preds = %if_join76.lr.ph, %memory_array_index_access_contract_IERC20_dyn.1.exit467
  %storemerge3151281 = phi i256 [ 0, %if_join76.lr.ph ], [ %addition_result.i470, %memory_array_index_access_contract_IERC20_dyn.1.exit467 ]
  %memory_load_result.i414 = load i256, ptr addrspace(1) %memory_store_pointer.i347, align 1
  %comparison_result.not.i415 = icmp ugt i256 %memory_load_result.i414, %storemerge3151281
  br i1 %comparison_result.not.i415, label %memory_array_index_access_contract_IERC20_dyn.1.exit, label %if_main.i416

if_main.i416:                                     ; preds = %if_join76
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit: ; preds = %if_join76
  %shift_left_non_overflow_result.i417 = shl i256 %storemerge3151281, 5
  %addition_result7.i = add i256 %shift_left_non_overflow_result.i417, %pos.033.i
  %memory_load_pointer.i420 = inttoptr i256 %addition_result7.i to ptr addrspace(1)
  %memory_load_result.i421 = load i256, ptr addrspace(1) %memory_load_pointer.i420, align 1
  %and_result.i422 = and i256 %memory_load_result.i421, 1461501637330902918203684832716283019655932542975
  %comparison_result.not.i423 = icmp eq i256 %and_result.i422, 0
  br i1 %comparison_result.not.i423, label %switch_default_block.i, label %switch_case_branch_1_block.i

switch_case_branch_1_block.i:                     ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit
  %memory_load_result.i424 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i425 = inttoptr i256 %memory_load_result.i424 to ptr addrspace(1)
  store i256 50942633119752846454219349998365661925608737367104304655302372697894809501696, ptr addrspace(1) %memory_store_pointer.i425, align 1
  %addition_result.i426 = add i256 %memory_load_result.i424, 4
  %memory_store_pointer14.i = inttoptr i256 %addition_result.i426 to ptr addrspace(1)
  store i256 %and_result12.i, ptr addrspace(1) %memory_store_pointer14.i, align 1
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %cond40.i = icmp eq i256 %and_result.i422, 4
  br i1 %cond40.i, label %if_join.i434, label %contract_call_ordinary_block.i

contract_call_ordinary_block.i:                   ; preds = %switch_case_branch_1_block.i
  %3 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i424, i256 4294967295)
  %4 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_input_offset_shifted.i.i = shl nuw nsw i256 %3, 64
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %4, 192
  %abi_data_offset_and_length.i.i = or i256 %abi_data_gas_shifted.i.i, %abi_data_input_offset_shifted.i.i
  %abi_data_add_gas.i.i = or i256 %abi_data_offset_and_length.i.i, 2852213850513516153367582212096
  %contract_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_gas.i.i, i256 %and_result.i422, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 0
  %contract_call_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 1
  %contract_call_memcpy_from_child_pointer_casted.i.i = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i.i to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i.i = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i.i, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i.i = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i.i, 4294967295
  %5 = tail call i256 @llvm.umin.i256(i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i256 32)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %memory_store_pointer.i425, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i, i256 %5, i1 false)
  store ptr addrspace(3) %contract_call_external_result_abi_data.i.i, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, ptr @returndatasize, align 32
  br i1 %contract_call_external_result_status_code_boolean.i.i, label %if_join.i434, label %if_main.i427

if_main.i427:                                     ; preds = %contract_call_ordinary_block.i
  %contract_call_external_result_abi_data.i.i.le = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 0
  %memory_load_result.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i.i = inttoptr i256 %memory_load_result.i.i to ptr addrspace(1)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i.le, i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i1 false)
  %returndatasize3.i.i = load i256, ptr @returndatasize, align 32
  %6 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i, i256 4294967295)
  %7 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i = shl nuw nsw i256 %6, 64
  %exit_length_shifted.i.i.i = shl nuw nsw i256 %7, 96
  %exit_abi_data.i.i.i = or i256 %exit_length_shifted.i.i.i, %exit_offset_shifted.i.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i)
  unreachable

if_join.i434:                                     ; preds = %contract_call_ordinary_block.i, %switch_case_branch_1_block.i
  %returndatasize.i = load i256, ptr @returndatasize, align 32
  %8 = tail call i256 @llvm.umin.i256(i256 %returndatasize.i, i256 32)
  %addition_result.i.i428 = add nuw nsw i256 %8, 31
  %and_result.i.i429 = and i256 %addition_result.i.i428, 96
  %addition_result3.i.i430 = add i256 %and_result.i.i429, %memory_load_result.i424
  %comparison_result.i.i431 = icmp ult i256 %addition_result3.i.i430, %memory_load_result.i424
  %comparison_result7.i.i432 = icmp ugt i256 %addition_result3.i.i430, 18446744073709551615
  %or_result13.i.i433 = or i1 %comparison_result7.i.i432, %comparison_result.i.i431
  br i1 %or_result13.i.i433, label %if_main.i.i435, label %finalize_allocation.exit.i

if_main.i.i435:                                   ; preds = %if_join.i434
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit.i:                       ; preds = %if_join.i434
  store i256 %addition_result3.i.i430, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %comparison_result.i44.i = icmp ult i256 %returndatasize.i, 32
  br i1 %comparison_result.i44.i, label %if_main.i45.i, label %abi_decode_uint256_fromMemory.exit.i

if_main.i45.i:                                    ; preds = %finalize_allocation.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_uint256_fromMemory.exit.i:             ; preds = %finalize_allocation.exit.i
  %memory_load_result.i46.i = load i256, ptr addrspace(1) %memory_store_pointer.i425, align 1
  br label %fun_uniBalanceOf.exit

switch_default_block.i:                           ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit
  store i256 -44877977326897262784168444354156441158329539312518651612887364914072161059015, ptr addrspace(2) null, align 4294967296
  store i256 %address, ptr addrspace(2) inttoptr (i256 4 to ptr addrspace(2)), align 4
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %9 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_gas_shifted.i47.i = shl nuw nsw i256 %9, 192
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_gas_shifted.i47.i, 904625751086426111047927909714404454142933105326819602152923490636624035840
  %system_request.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i, i256 32778, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 1
  br i1 %system_request_result_status_code_boolean.i.i, label %__system_request.exit.i, label %system_request_error_block.i.i

system_request_error_block.i.i:                   ; preds = %switch_default_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i:                          ; preds = %switch_default_block.i
  %system_request_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 0
  %system_request_child_address.i.i = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i, align 1
  br label %fun_uniBalanceOf.exit

fun_uniBalanceOf.exit:                            ; preds = %abi_decode_uint256_fromMemory.exit.i, %__system_request.exit.i
  %return_pointer.0.i = phi i256 [ %memory_load_result.i46.i, %abi_decode_uint256_fromMemory.exit.i ], [ %system_request_child_address.i.i, %__system_request.exit.i ]
  %memory_load_result.i437 = load i256, ptr addrspace(1) %memory_store_pointer.i347, align 1
  %comparison_result.not.i438 = icmp ugt i256 %memory_load_result.i437, %storemerge3151281
  br i1 %comparison_result.not.i438, label %memory_array_index_access_contract_IERC20_dyn.1.exit444, label %if_main.i439

if_main.i439:                                     ; preds = %fun_uniBalanceOf.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit444: ; preds = %fun_uniBalanceOf.exit
  %memory_load_result.i446 = load i256, ptr addrspace(1) %memory_load_pointer.i420, align 1
  %and_result.i447 = and i256 %memory_load_result.i446, 1461501637330902918203684832716283019655932542975
  %comparison_result.i448.not = icmp eq i256 %and_result.i447, 0
  br i1 %comparison_result.i448.not, label %switch_default_block90, label %switch_join_block87

switch_join_block87:                              ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit444, %switch_default_block90
  %storemerge316 = phi i256 [ %get_u128_value91, %switch_default_block90 ], [ 0, %memory_array_index_access_contract_IERC20_dyn.1.exit444 ]
  %comparison_result.i450 = icmp ult i256 %return_pointer.0.i, %storemerge316
  br i1 %comparison_result.i450, label %if_main.i458, label %fun_sub.exit

if_main.i458:                                     ; preds = %switch_join_block87
  %memory_load_result.i451 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i452 = inttoptr i256 %memory_load_result.i451 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i452, align 1
  %addition_result.i453 = add i256 %memory_load_result.i451, 4
  %memory_store_pointer5.i = inttoptr i256 %addition_result.i453 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5.i, align 1
  %addition_result7.i454 = add i256 %memory_load_result.i451, 36
  %memory_store_pointer8.i = inttoptr i256 %addition_result7.i454 to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8.i, align 1
  %addition_result10.i455 = add i256 %memory_load_result.i451, 68
  %memory_store_pointer11.i = inttoptr i256 %addition_result10.i455 to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11.i, align 1
  %10 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i451, i256 4294967295)
  %exit_offset_shifted.i.i456 = shl nuw nsw i256 %10, 64
  %exit_abi_data.i.i457 = or i256 %exit_offset_shifted.i.i456, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i457)
  unreachable

fun_sub.exit:                                     ; preds = %switch_join_block87
  %memory_load_result.i460 = load i256, ptr addrspace(1) %memory_store_pointer.i393, align 1
  %comparison_result.not.i461 = icmp ugt i256 %memory_load_result.i460, %storemerge3151281
  br i1 %comparison_result.not.i461, label %memory_array_index_access_contract_IERC20_dyn.1.exit467, label %if_main.i462

if_main.i462:                                     ; preds = %fun_sub.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit467: ; preds = %fun_sub.exit
  %subtraction_result.i = sub i256 %return_pointer.0.i, %storemerge316
  %addition_result7.i465 = add i256 %shift_left_non_overflow_result.i417, %addition_result10.i
  %memory_store_pointer = inttoptr i256 %addition_result7.i465 to ptr addrspace(1)
  store i256 %subtraction_result.i, ptr addrspace(1) %memory_store_pointer, align 1
  %addition_result.i470 = add nuw i256 %storemerge3151281, 1
  %memory_load_result68 = load i256, ptr addrspace(1) %memory_store_pointer.i393, align 1
  %comparison_result70.not = icmp ult i256 %addition_result.i470, %memory_load_result68
  br i1 %comparison_result70.not, label %if_join76, label %if_main75

switch_default_block90:                           ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit444
  %get_u128_value91 = tail call i256 @llvm.syncvm.getu128()
  br label %switch_join_block87

switch_join_block103:                             ; preds = %fun_div.exit, %calldata_array_index_access_uint256_dyn_calldata.exit532, %switch_case_branch_1_block104, %for_condition131.preheader
  %storemerge1301 = phi i256 [ %var_fairSupply.promoted1290, %for_condition131.preheader ], [ -1, %switch_case_branch_1_block104 ], [ %20, %calldata_array_index_access_uint256_dyn_calldata.exit532 ], [ %14, %fun_div.exit ]
  store i256 %storemerge1301, ptr %var_fairSupply, align 32
  %value1158 = load i256, ptr %binding_1_pointer, align 32
  %comparison_result1601296.not = icmp eq i256 %value1158, 0
  br i1 %comparison_result1601296.not, label %for_join157, label %for_body155.lr.ph

for_body155.lr.ph:                                ; preds = %switch_join_block103
  %value0165 = load i256, ptr %binding_0_pointer, align 32
  %expr_7174 = load i256, ptr %expr_7, align 32
  %cond307 = icmp eq i256 %expr_7174, 0
  %expr_mpos179 = load i256, ptr %expr_mpos, align 32
  %memory_load_pointer.i617 = inttoptr i256 %expr_mpos179 to ptr addrspace(1)
  %_2184 = load i256, ptr %_2, align 32
  %comparison_result.i650 = icmp eq i256 %_2184, 0
  %xor_result.i.i = sub i256 0, %_2184
  %value3 = load i256, ptr %binding_1_pointer22, align 32
  %value2 = load i256, ptr %binding_0_pointer21, align 32
  %var_tokens_mpos208 = load i256, ptr %var_tokens_mpos, align 32
  %memory_load_pointer.i576 = inttoptr i256 %var_tokens_mpos208 to ptr addrspace(1)
  %expr_mpos222 = load i256, ptr %expr_mpos, align 32
  %memory_load_pointer.i758 = inttoptr i256 %expr_mpos222 to ptr addrspace(1)
  %_2228 = load i256, ptr %_2, align 32
  %comparison_result.i781 = icmp eq i256 %_2228, 0
  br label %for_body155

switch_case_branch_1_block104:                    ; preds = %if_main75
  store i256 -1, ptr %var_fairSupply, align 32
  %comparison_result1111287.not = icmp eq i256 %calldata_value.i, 0
  br i1 %comparison_result1111287.not, label %switch_join_block103, label %calldata_array_index_access_uint256_dyn_calldata.exit.lr.ph

calldata_array_index_access_uint256_dyn_calldata.exit.lr.ph: ; preds = %switch_case_branch_1_block104
  %calldata_pointer116 = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %division_result_non_zero.i = udiv i256 -1, %storage_load98
  br label %calldata_array_index_access_uint256_dyn_calldata.exit

calldata_array_index_access_uint256_dyn_calldata.exit: ; preds = %calldata_array_index_access_uint256_dyn_calldata.exit.lr.ph, %fun_div.exit
  %storemerge3201288 = phi i256 [ 0, %calldata_array_index_access_uint256_dyn_calldata.exit.lr.ph ], [ %addition_result.i510, %fun_div.exit ]
  %11 = phi i256 [ -1, %calldata_array_index_access_uint256_dyn_calldata.exit.lr.ph ], [ %14, %fun_div.exit ]
  %shift_left_non_overflow_result.i474 = shl i256 %storemerge3201288, 5
  %addition_result.i475 = add i256 %shift_left_non_overflow_result.i474, %addition_result16.i
  %calldata_pointer_with_offset117 = getelementptr i8, ptr addrspace(3) %calldata_pointer116, i256 %addition_result.i475
  %calldata_value118 = load i256, ptr addrspace(3) %calldata_pointer_with_offset117, align 32
  %comparison_result4.i = icmp ult i256 %division_result_non_zero.i, %calldata_value118
  br i1 %comparison_result4.i, label %if_main7.i, label %if_join8.i

if_main7.i:                                       ; preds = %calldata_array_index_access_uint256_dyn_calldata.exit
  store i256 %11, ptr %var_fairSupply, align 32
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i:                                       ; preds = %calldata_array_index_access_uint256_dyn_calldata.exit
  %multiplication_result.i = mul i256 %calldata_value118, %storage_load98
  %division_result_non_zero.i.i = udiv i256 %multiplication_result.i, %storage_load98
  %comparison_result14.not.i = icmp eq i256 %division_result_non_zero.i.i, %calldata_value118
  br i1 %comparison_result14.not.i, label %fun_mul.exit, label %if_main19.i

if_main19.i:                                      ; preds = %if_join8.i
  store i256 %11, ptr %var_fairSupply, align 32
  %memory_load_result.i480 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i481 = inttoptr i256 %memory_load_result.i480 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i481, align 1
  %addition_result.i482 = add i256 %memory_load_result.i480, 4
  %memory_store_pointer23.i = inttoptr i256 %addition_result.i482 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i, align 1
  %addition_result25.i = add i256 %memory_load_result.i480, 36
  %memory_store_pointer26.i = inttoptr i256 %addition_result25.i to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i, align 1
  %addition_result28.i = add i256 %memory_load_result.i480, 68
  %memory_store_pointer29.i = inttoptr i256 %addition_result28.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i, align 1
  %addition_result31.i = add i256 %memory_load_result.i480, 100
  %memory_store_pointer32.i = inttoptr i256 %addition_result31.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i, align 1
  %12 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i480, i256 4294967295)
  %exit_offset_shifted.i.i483 = shl nuw nsw i256 %12, 64
  %exit_abi_data.i.i484 = or i256 %exit_offset_shifted.i.i483, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i484)
  unreachable

fun_mul.exit:                                     ; preds = %if_join8.i
  %comparison_result.not.i487 = icmp ugt i256 %memory_load_result68.lcssa, %storemerge3201288
  br i1 %comparison_result.not.i487, label %memory_array_index_access_contract_IERC20_dyn.1.exit493, label %if_main.i488

if_main.i488:                                     ; preds = %fun_mul.exit
  store i256 %11, ptr %var_fairSupply, align 32
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit493: ; preds = %fun_mul.exit
  %addition_result7.i491 = add i256 %shift_left_non_overflow_result.i474, %addition_result10.i
  %memory_load_pointer123 = inttoptr i256 %addition_result7.i491 to ptr addrspace(1)
  %memory_load_result124 = load i256, ptr addrspace(1) %memory_load_pointer123, align 1
  %comparison_result.i494 = icmp eq i256 %memory_load_result124, 0
  br i1 %comparison_result.i494, label %if_main.i505, label %fun_div.exit

if_main.i505:                                     ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit493
  store i256 %11, ptr %var_fairSupply, align 32
  %memory_load_result.i495 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i496 = inttoptr i256 %memory_load_result.i495 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i496, align 1
  %addition_result.i497 = add i256 %memory_load_result.i495, 4
  %memory_store_pointer4.i498 = inttoptr i256 %addition_result.i497 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i498, align 1
  %addition_result6.i499 = add i256 %memory_load_result.i495, 36
  %memory_store_pointer7.i500 = inttoptr i256 %addition_result6.i499 to ptr addrspace(1)
  store i256 26, ptr addrspace(1) %memory_store_pointer7.i500, align 1
  %addition_result9.i501 = add i256 %memory_load_result.i495, 68
  %memory_store_pointer10.i502 = inttoptr i256 %addition_result9.i501 to ptr addrspace(1)
  store i256 37714057306925736537727338326753656978887423192446994710127794316522513498112, ptr addrspace(1) %memory_store_pointer10.i502, align 1
  %13 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i495, i256 4294967295)
  %exit_offset_shifted.i.i503 = shl nuw nsw i256 %13, 64
  %exit_abi_data.i.i504 = or i256 %exit_offset_shifted.i.i503, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i504)
  unreachable

fun_div.exit:                                     ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit493
  %division_result_non_zero.i.i506 = udiv i256 %multiplication_result.i, %memory_load_result124
  %14 = tail call i256 @llvm.umin.i256(i256 %11, i256 %division_result_non_zero.i.i506)
  %addition_result.i510 = add nuw i256 %storemerge3201288, 1
  %comparison_result111 = icmp ult i256 %addition_result.i510, %calldata_value.i
  br i1 %comparison_result111, label %calldata_array_index_access_uint256_dyn_calldata.exit, label %switch_join_block103

switch_default_block129:                          ; preds = %if_main75
  store i256 99000, ptr %var_fairSupply, align 32
  %address130 = tail call i256 @llvm.syncvm.this()
  %and_result.i513 = and i256 %address130, 1461501637330902918203684832716283019655932542975
  %comparison_result.i514 = icmp eq i256 %and_result.i513, 0
  br i1 %comparison_result.i514, label %if_main.i523, label %if_join.i525

if_main.i523:                                     ; preds = %switch_default_block129
  %memory_load_result.i515 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i516 = inttoptr i256 %memory_load_result.i515 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i516, align 1
  %addition_result.i517 = add i256 %memory_load_result.i515, 4
  %memory_store_pointer10.i518 = inttoptr i256 %addition_result.i517 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer10.i518, align 1
  %addition_result12.i519 = add i256 %memory_load_result.i515, 36
  %memory_store_pointer13.i = inttoptr i256 %addition_result12.i519 to ptr addrspace(1)
  store i256 31, ptr addrspace(1) %memory_store_pointer13.i, align 1
  %addition_result15.i520 = add i256 %memory_load_result.i515, 68
  %memory_store_pointer16.i = inttoptr i256 %addition_result15.i520 to ptr addrspace(1)
  store i256 31354931781638678563069525067809233856775101976563302031013534919694566519552, ptr addrspace(1) %memory_store_pointer16.i, align 1
  %15 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i515, i256 4294967295)
  %exit_offset_shifted.i.i521 = shl nuw nsw i256 %15, 64
  %exit_abi_data.i.i522 = or i256 %exit_offset_shifted.i.i521, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i522)
  unreachable

if_join.i525:                                     ; preds = %switch_default_block129
  %comparison_result20.i = icmp ugt i256 %storage_load98, -1001
  br i1 %comparison_result20.i, label %if_main23.i, label %if_join24.i

if_main23.i:                                      ; preds = %if_join.i525
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join24.i:                                      ; preds = %if_join.i525
  %addition_result27.i = add i256 %storage_load98, 1000
  tail call void @llvm.syncvm.sstore(i256 2, i256 %addition_result27.i)
  store i256 %and_result.i513, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i.i = tail call i256 @llvm.syncvm.gasleft()
  %16 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i.i, i256 4294967295)
  %abi_data_gas_shifted.i.i.i = shl nuw nsw i256 %16, 192
  %abi_data_add_system_call_marker.i.i.i = or i256 %abi_data_gas_shifted.i.i.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i, label %keccak256_failure_block.i.i.i

keccak256_failure_block.i.i.i:                    ; preds = %if_join24.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i: ; preds = %if_join24.i
  %keccak256_call_external_result_abi_data_pointer.i.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i.i, 0
  %keccak256_child_data.i.i.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i.i, align 1
  %storage_load30.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i.i)
  %comparison_result33.i = icmp ugt i256 %storage_load30.i, -1001
  br i1 %comparison_result33.i, label %if_main36.i, label %if_join37.i

if_main36.i:                                      ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join37.i:                                      ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i
  %addition_result40.i = add i256 %storage_load30.i, 1000
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i.i, i256 %addition_result40.i)
  %memory_load_result42.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i = inttoptr i256 %memory_load_result42.i to ptr addrspace(1)
  store i256 1000, ptr addrspace(1) %memory_store_pointer.i.i, align 1
  %gas_left.i526 = tail call i256 @llvm.syncvm.gasleft()
  %17 = tail call i256 @llvm.umin.i256(i256 %memory_load_result42.i, i256 4294967295)
  %18 = tail call i256 @llvm.umin.i256(i256 %gas_left.i526, i256 4294967295)
  %abi_data_input_offset_shifted.i = shl nuw nsw i256 %17, 64
  %abi_data_gas_shifted.i = shl nuw nsw i256 %18, 192
  %abi_data_offset_and_length.i = or i256 %abi_data_gas_shifted.i, %abi_data_input_offset_shifted.i
  %abi_data_add_system_call_marker.i = or i256 %abi_data_offset_and_length.i, 904625697166532776746648320380374280103671757735618107014721178055227736064
  %event_writer_call_external.i = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker.i, i256 32781, i256 3, i256 -15402802100530019096323380498944738953123845089667699673314898783681816316945, i256 0, i256 %and_result.i513, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %event_writer_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %event_writer_call_external.i, 1
  br i1 %event_writer_external_result_status_code_boolean.i, label %for_condition131.preheader, label %event_failure_block.i

for_condition131.preheader:                       ; preds = %if_join37.i
  %var_fairSupply.promoted1290 = load i256, ptr %var_fairSupply, align 32
  %comparison_result1371293.not = icmp eq i256 %calldata_value.i, 0
  br i1 %comparison_result1371293.not, label %switch_join_block103, label %calldata_array_index_access_uint256_dyn_calldata.exit532.lr.ph

calldata_array_index_access_uint256_dyn_calldata.exit532.lr.ph: ; preds = %for_condition131.preheader
  %calldata_pointer144 = load ptr addrspace(3), ptr @ptr_calldata, align 32
  br label %calldata_array_index_access_uint256_dyn_calldata.exit532

event_failure_block.i:                            ; preds = %if_join37.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

calldata_array_index_access_uint256_dyn_calldata.exit532: ; preds = %calldata_array_index_access_uint256_dyn_calldata.exit532.lr.ph, %calldata_array_index_access_uint256_dyn_calldata.exit532
  %storemerge3171294 = phi i256 [ 0, %calldata_array_index_access_uint256_dyn_calldata.exit532.lr.ph ], [ %addition_result.i535, %calldata_array_index_access_uint256_dyn_calldata.exit532 ]
  %19 = phi i256 [ %var_fairSupply.promoted1290, %calldata_array_index_access_uint256_dyn_calldata.exit532.lr.ph ], [ %20, %calldata_array_index_access_uint256_dyn_calldata.exit532 ]
  %shift_left_non_overflow_result.i529 = shl i256 %storemerge3171294, 5
  %addition_result.i530 = add i256 %shift_left_non_overflow_result.i529, %addition_result16.i
  %calldata_pointer_with_offset145 = getelementptr i8, ptr addrspace(3) %calldata_pointer144, i256 %addition_result.i530
  %calldata_value146 = load i256, ptr addrspace(3) %calldata_pointer_with_offset145, align 32
  %20 = tail call i256 @llvm.umax.i256(i256 %19, i256 %calldata_value146)
  %addition_result.i535 = add nuw i256 %storemerge3171294, 1
  %comparison_result137 = icmp ult i256 %addition_result.i535, %calldata_value.i
  br i1 %comparison_result137, label %calldata_array_index_access_uint256_dyn_calldata.exit532, label %switch_join_block103

for_body155:                                      ; preds = %for_body155.lr.ph, %if_join214
  %storemerge12251297 = phi i256 [ 0, %for_body155.lr.ph ], [ %addition_result.i831, %if_join214 ]
  %shift_left_non_overflow_result.i540 = shl i256 %storemerge12251297, 5
  %addition_result.i541 = add i256 %value0165, %shift_left_non_overflow_result.i540
  %calldata_pointer167 = load ptr addrspace(3), ptr @ptr_calldata, align 32
  %calldata_pointer_with_offset168 = getelementptr i8, ptr addrspace(3) %calldata_pointer167, i256 %addition_result.i541
  %calldata_value169 = load i256, ptr addrspace(3) %calldata_pointer_with_offset168, align 32
  %comparison_result170.not = icmp eq i256 %calldata_value169, 0
  br i1 %comparison_result170.not, label %if_main.i555, label %require_helper_stringliteral.exit

if_main.i555:                                     ; preds = %for_body155
  %memory_load_result.i545 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i546 = inttoptr i256 %memory_load_result.i545 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i546, align 1
  %addition_result.i547 = add i256 %memory_load_result.i545, 4
  %memory_store_pointer4.i548 = inttoptr i256 %addition_result.i547 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i548, align 1
  %addition_result6.i549 = add i256 %memory_load_result.i545, 36
  %memory_store_pointer7.i550 = inttoptr i256 %addition_result6.i549 to ptr addrspace(1)
  store i256 25, ptr addrspace(1) %memory_store_pointer7.i550, align 1
  %addition_result9.i551 = add i256 %memory_load_result.i545, 68
  %memory_store_pointer10.i552 = inttoptr i256 %addition_result9.i551 to ptr addrspace(1)
  store i256 35024978435645830422959912878422567041180995726260159189616562830371805200384, ptr addrspace(1) %memory_store_pointer10.i552, align 1
  %21 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i545, i256 4294967295)
  %exit_offset_shifted.i.i553 = shl nuw nsw i256 %21, 64
  %exit_abi_data.i.i554 = or i256 %exit_offset_shifted.i.i553, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i554)
  unreachable

require_helper_stringliteral.exit:                ; preds = %for_body155
  br i1 %cond307, label %switch_case_branch_1_block176, label %switch_join_block175

for_join157:                                      ; preds = %if_join214, %switch_join_block103
  %comparison_result100.not = xor i1 %comparison_result100, true
  %comparison_result2511299 = icmp ne i256 %value1158, 0
  %or.cond = select i1 %comparison_result100.not, i1 %comparison_result2511299, i1 false
  br i1 %or.cond, label %for_body246.lr.ph, label %if_join244

for_body246.lr.ph:                                ; preds = %for_join157
  %var_tokens_mpos255 = load i256, ptr %var_tokens_mpos, align 32
  %memory_load_pointer.i886 = inttoptr i256 %var_tokens_mpos255 to ptr addrspace(1)
  %expr_mpos259 = load i256, ptr %expr_mpos, align 32
  %memory_load_pointer.i901 = inttoptr i256 %expr_mpos259 to ptr addrspace(1)
  %_2263 = load i256, ptr %_2, align 32
  %var_fairSupply264 = load i256, ptr %var_fairSupply, align 32
  %xor_result.i.i910 = xor i256 %var_fairSupply264, -1
  %comparison_result.i.i911 = icmp ugt i256 %_2263, %xor_result.i.i910
  %addition_result.i.i913 = add i256 %var_fairSupply264, %_2263
  %comparison_result.i914 = icmp ult i256 %addition_result.i.i913, %_2263
  %comparison_result.i967 = icmp eq i256 %_2263, 0
  %xor_result.i.i.i = sub i256 0, %_2263
  %addition_result28.i979 = add i256 %_2263, -1
  br label %for_body246

switch_join_block175:                             ; preds = %require_helper_stringliteral.exit, %fun_div.exit684
  %storemerge319 = phi i256 [ %division_result_non_zero.i.i682, %fun_div.exit684 ], [ %calldata_value169, %require_helper_stringliteral.exit ]
  %comparison_result.not.i557 = icmp ult i256 %storemerge12251297, %value3
  br i1 %comparison_result.not.i557, label %calldata_array_index_access_uint256_dyn_calldata.exit562, label %if_main.i558

if_main.i558:                                     ; preds = %switch_join_block175
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

calldata_array_index_access_uint256_dyn_calldata.exit562: ; preds = %switch_join_block175
  %addition_result.i560 = add i256 %value2, %shift_left_non_overflow_result.i540
  %calldata_pointer_with_offset199 = getelementptr i8, ptr addrspace(3) %calldata_pointer167, i256 %addition_result.i560
  %calldata_value200 = load i256, ptr addrspace(3) %calldata_pointer_with_offset199, align 32
  %comparison_result202.not = icmp ult i256 %storemerge319, %calldata_value200
  br i1 %comparison_result202.not, label %if_main.i574, label %require_helper_stringliteral_9e9a.exit

if_main.i574:                                     ; preds = %calldata_array_index_access_uint256_dyn_calldata.exit562
  %memory_load_result.i564 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i565 = inttoptr i256 %memory_load_result.i564 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i565, align 1
  %addition_result.i566 = add i256 %memory_load_result.i564, 4
  %memory_store_pointer4.i567 = inttoptr i256 %addition_result.i566 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i567, align 1
  %addition_result6.i568 = add i256 %memory_load_result.i564, 36
  %memory_store_pointer7.i569 = inttoptr i256 %addition_result6.i568 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i569, align 1
  %addition_result9.i570 = add i256 %memory_load_result.i564, 68
  %memory_store_pointer10.i571 = inttoptr i256 %addition_result9.i570 to ptr addrspace(1)
  store i256 35024978435645830422959912895937723895137981344275851584977930861766626534756, ptr addrspace(1) %memory_store_pointer10.i571, align 1
  %22 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i564, i256 4294967295)
  %exit_offset_shifted.i.i572 = shl nuw nsw i256 %22, 64
  %exit_abi_data.i.i573 = or i256 %exit_offset_shifted.i.i572, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i573)
  unreachable

require_helper_stringliteral_9e9a.exit:           ; preds = %calldata_array_index_access_uint256_dyn_calldata.exit562
  %memory_load_result.i577 = load i256, ptr addrspace(1) %memory_load_pointer.i576, align 1
  %comparison_result.not.i578 = icmp ugt i256 %memory_load_result.i577, %storemerge12251297
  br i1 %comparison_result.not.i578, label %memory_array_index_access_contract_IERC20_dyn.1.exit584, label %if_main.i579

if_main.i579:                                     ; preds = %require_helper_stringliteral_9e9a.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit584: ; preds = %require_helper_stringliteral_9e9a.exit
  %addition_result.i581 = add i256 %shift_left_non_overflow_result.i540, 32
  %addition_result7.i582 = add i256 %addition_result.i581, %var_tokens_mpos208
  %memory_load_pointer.i585 = inttoptr i256 %addition_result7.i582 to ptr addrspace(1)
  %memory_load_result.i586 = load i256, ptr addrspace(1) %memory_load_pointer.i585, align 1
  %and_result.i587 = and i256 %memory_load_result.i586, 1461501637330902918203684832716283019655932542975
  %comparison_result.not.i588 = icmp eq i256 %storemerge319, 0
  br i1 %comparison_result.not.i588, label %fun_uniTransferFromSenderToThis.exit, label %if_main.i589

if_main.i589:                                     ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit584
  %comparison_result5.not.i = icmp eq i256 %and_result.i587, 0
  br i1 %comparison_result5.not.i, label %switch_default_block.i606, label %switch_case_branch_1_block.i595

switch_case_branch_1_block.i595:                  ; preds = %if_main.i589
  %memory_load_result.i591 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %addition_result.i592 = add i256 %memory_load_result.i591, 32
  %memory_store_pointer.i593 = inttoptr i256 %addition_result.i592 to ptr addrspace(1)
  store i256 16156842317565293874272834530371880720966471053262404558597773956279093428224, ptr addrspace(1) %memory_store_pointer.i593, align 1
  %caller.i = tail call i256 @llvm.syncvm.caller()
  %addition_result14.i = add i256 %memory_load_result.i591, 36
  %memory_store_pointer15.i = inttoptr i256 %addition_result14.i to ptr addrspace(1)
  store i256 %caller.i, ptr addrspace(1) %memory_store_pointer15.i, align 1
  %address.i = tail call i256 @llvm.syncvm.this()
  %addition_result17.i594 = add i256 %memory_load_result.i591, 68
  %memory_store_pointer18.i = inttoptr i256 %addition_result17.i594 to ptr addrspace(1)
  store i256 %address.i, ptr addrspace(1) %memory_store_pointer18.i, align 1
  %addition_result21.i = add i256 %memory_load_result.i591, 100
  %memory_store_pointer22.i = inttoptr i256 %addition_result21.i to ptr addrspace(1)
  store i256 %storemerge319, ptr addrspace(1) %memory_store_pointer22.i, align 1
  %memory_store_pointer24.i = inttoptr i256 %memory_load_result.i591 to ptr addrspace(1)
  store i256 100, ptr addrspace(1) %memory_store_pointer24.i, align 1
  %23 = icmp ugt i256 %memory_load_result.i591, 18446744073709551455
  br i1 %23, label %if_main.i.i596, label %finalize_allocation_22245.exit.i

if_main.i.i596:                                   ; preds = %switch_case_branch_1_block.i595
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation_22245.exit.i:                 ; preds = %switch_case_branch_1_block.i595
  %addition_result.i.i597 = add i256 %memory_load_result.i591, 160
  store i256 %addition_result.i.i597, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %24 = icmp ugt i256 %addition_result.i.i597, 18446744073709551551
  br i1 %24, label %if_main.i.i.i, label %finalize_allocation_14877.exit.i.i

if_main.i.i.i:                                    ; preds = %finalize_allocation_22245.exit.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation_14877.exit.i.i:               ; preds = %finalize_allocation_22245.exit.i
  %addition_result.i.i.i = add i256 %memory_load_result.i591, 224
  store i256 %addition_result.i.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i598 = inttoptr i256 %addition_result.i.i597 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer.i.i598, align 1
  %addition_result.i64.i = add i256 %memory_load_result.i591, 192
  %memory_store_pointer7.i.i = inttoptr i256 %addition_result.i64.i to ptr addrspace(1)
  store i256 37714057306076988483118529490347679105585116642029194716945419020321082336612, ptr addrspace(1) %memory_store_pointer7.i.i, align 1
  store i256 10867283408178898638301172343726954674910073630256871736220740970449699113859, ptr addrspace(2) null, align 4294967296
  store i256 %and_result.i587, ptr addrspace(2) inttoptr (i256 4 to ptr addrspace(2)), align 4
  %gas_left.i.i.i599 = tail call i256 @llvm.syncvm.gasleft()
  %25 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i.i599, i256 4294967295)
  %abi_data_gas_shifted.i.i.i600 = shl nuw nsw i256 %25, 192
  %abi_data_add_system_call_marker.i.i.i601 = or i256 %abi_data_gas_shifted.i.i.i600, 904625751086426111047927909714404454142933105326819602152923490636624035840
  %system_request.i.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i.i601, i256 32770, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i, 1
  br i1 %system_request_result_status_code_boolean.i.i.i, label %__system_request.exit.i.i, label %system_request_error_block.i.i.i

system_request_error_block.i.i.i:                 ; preds = %finalize_allocation_14877.exit.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i.i:                        ; preds = %finalize_allocation_14877.exit.i.i
  %system_request_result_abi_data.i.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i, 0
  %system_request_child_address.i.i.i = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i.i, align 1
  %comparison_result.i.i602 = icmp eq i256 %system_request_child_address.i.i.i, 0
  br i1 %comparison_result.i.i602, label %if_main.i65.i, label %if_join.i.i

if_main.i65.i:                                    ; preds = %__system_request.exit.i.i
  %memory_load_result9.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer16.i.i = inttoptr i256 %memory_load_result9.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer16.i.i, align 1
  %addition_result19.i.i = add i256 %memory_load_result9.i.i, 4
  %memory_store_pointer20.i.i = inttoptr i256 %addition_result19.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer20.i.i, align 1
  %addition_result22.i.i = add i256 %memory_load_result9.i.i, 36
  %memory_store_pointer23.i.i = inttoptr i256 %addition_result22.i.i to ptr addrspace(1)
  store i256 29, ptr addrspace(1) %memory_store_pointer23.i.i, align 1
  %addition_result25.i.i = add i256 %memory_load_result9.i.i, 68
  %memory_store_pointer26.i.i = inttoptr i256 %addition_result25.i.i to ptr addrspace(1)
  store i256 29577713123142787666064487680123823951345158729797978021083438401868913442816, ptr addrspace(1) %memory_store_pointer26.i.i, align 1
  %26 = tail call i256 @llvm.umin.i256(i256 %memory_load_result9.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i603 = shl nuw nsw i256 %26, 64
  %exit_abi_data.i.i.i604 = or i256 %exit_offset_shifted.i.i.i603, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i604)
  unreachable

if_join.i.i:                                      ; preds = %__system_request.exit.i.i
  %memory_load_result29.i.i = load i256, ptr addrspace(1) %memory_store_pointer24.i, align 1
  %gas_left.i.i605 = tail call i256 @llvm.syncvm.gasleft()
  %cond.i.i = icmp eq i256 %and_result.i587, 4
  br i1 %cond.i.i, label %contract_call_join_block.i.i, label %contract_call_ordinary_block.i.i

contract_call_ordinary_block.i.i:                 ; preds = %if_join.i.i
  %27 = tail call i256 @llvm.umin.i256(i256 %addition_result.i592, i256 4294967295)
  %28 = tail call i256 @llvm.umin.i256(i256 %memory_load_result29.i.i, i256 4294967295)
  %29 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i605, i256 4294967295)
  %abi_data_input_offset_shifted.i.i.i = shl nuw nsw i256 %27, 64
  %abi_data_input_length_shifted.i.i.i = shl nuw nsw i256 %28, 96
  %abi_data_gas_shifted.i65.i.i = shl nuw nsw i256 %29, 192
  %abi_data_offset_and_length.i.i.i = or i256 %abi_data_input_length_shifted.i.i.i, %abi_data_input_offset_shifted.i.i.i
  %abi_data_add_gas.i.i.i = or i256 %abi_data_offset_and_length.i.i.i, %abi_data_gas_shifted.i65.i.i
  %contract_call_external.i.i.i = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_gas.i.i.i, i256 %and_result.i587, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i.i, 0
  %contract_call_external_result_status_code_boolean.i.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i.i, 1
  %contract_call_external_result_status_code.i.i.i = zext i1 %contract_call_external_result_status_code_boolean.i.i.i to i256
  %contract_call_memcpy_from_child_pointer_casted.i.i.i = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i.i.i to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i.i.i = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i.i.i, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i.i.i = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i.i.i, 4294967295
  store ptr addrspace(3) %contract_call_external_result_abi_data.i.i.i, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i.i, ptr @returndatasize, align 32
  br label %contract_call_join_block.i.i

contract_call_join_block.i.i:                     ; preds = %contract_call_ordinary_block.i.i, %if_join.i.i
  %storemerge.i.i = phi i256 [ %contract_call_external_result_status_code.i.i.i, %contract_call_ordinary_block.i.i ], [ 1, %if_join.i.i ]
  %returndatasize.i.i.i = load i256, ptr @returndatasize, align 32
  %cond.i.i.i = icmp eq i256 %returndatasize.i.i.i, 0
  br i1 %cond.i.i.i, label %extract_returndata.exit.i.i, label %switch_default_block.i.i.i

switch_default_block.i.i.i:                       ; preds = %contract_call_join_block.i.i
  %memory_load_result.i.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %30 = add i256 %returndatasize.i.i.i, 63
  %and_result.i.i.i.i = and i256 %30, -32
  %addition_result3.i.i.i.i = add i256 %memory_load_result.i.i.i, %and_result.i.i.i.i
  %comparison_result.i.i.i.i = icmp ult i256 %addition_result3.i.i.i.i, %memory_load_result.i.i.i
  %comparison_result7.i.i.i.i = icmp ugt i256 %addition_result3.i.i.i.i, 18446744073709551615
  %or_result13.i.i.i.i = or i1 %comparison_result7.i.i.i.i, %comparison_result.i.i.i.i
  br i1 %or_result13.i.i.i.i, label %if_main.i.i.i.i, label %finalize_allocation.exit.i.i.i

if_main.i.i.i.i:                                  ; preds = %switch_default_block.i.i.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit.i.i.i:                   ; preds = %switch_default_block.i.i.i
  store i256 %addition_result3.i.i.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i.i = inttoptr i256 %memory_load_result.i.i.i to ptr addrspace(1)
  store i256 %returndatasize.i.i.i, ptr addrspace(1) %memory_store_pointer.i.i.i, align 1
  %addition_result11.i.i.i = add i256 %memory_load_result.i.i.i, 32
  %returndatasize9.i.i.i = load i256, ptr @returndatasize, align 32
  %return_data_copy_destination_pointer.i.i.i = inttoptr i256 %addition_result11.i.i.i to ptr addrspace(1)
  %return_data_pointer.i.i.i = load ptr addrspace(3), ptr @ptr_return_data, align 32
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i.i, ptr addrspace(3) align 1 %return_data_pointer.i.i.i, i256 %returndatasize9.i.i.i, i1 false)
  br label %extract_returndata.exit.i.i

extract_returndata.exit.i.i:                      ; preds = %finalize_allocation.exit.i.i.i, %contract_call_join_block.i.i
  %return_pointer.0.i.i.i = phi i256 [ %memory_load_result.i.i.i, %finalize_allocation.exit.i.i.i ], [ 96, %contract_call_join_block.i.i ]
  %cond.i66.i.i = icmp eq i256 %storemerge.i.i, 0
  %memory_load_pointer.i.i.i = inttoptr i256 %return_pointer.0.i.i.i to ptr addrspace(1)
  %memory_load_result.i67.i.i = load i256, ptr addrspace(1) %memory_load_pointer.i.i.i, align 1
  %comparison_result.not.i.i.i = icmp eq i256 %memory_load_result.i67.i.i, 0
  br i1 %cond.i66.i.i, label %switch_case_branch_1_block.i.i.i, label %fun_verifyCallResult.exit.i.i

switch_case_branch_1_block.i.i.i:                 ; preds = %extract_returndata.exit.i.i
  br i1 %comparison_result.not.i.i.i, label %switch_case_branch_1_block6.i.i.i, label %switch_default_block.i70.i.i

switch_case_branch_1_block6.i.i.i:                ; preds = %switch_case_branch_1_block.i.i.i
  %memory_load_result7.i.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i68.i.i = inttoptr i256 %memory_load_result7.i.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i68.i.i, align 1
  %addition_result.i69.i.i = add i256 %memory_load_result7.i.i.i, 4
  %abi_encode_string_call.i.i.i = tail call fastcc i256 @abi_encode_string(i256 %addition_result.i69.i.i, i256 %addition_result.i.i597)
  %subtraction_result.i.i.i = sub i256 %abi_encode_string_call.i.i.i, %memory_load_result7.i.i.i
  %31 = tail call i256 @llvm.umin.i256(i256 %memory_load_result7.i.i.i, i256 4294967295)
  %32 = tail call i256 @llvm.umin.i256(i256 %subtraction_result.i.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i.i = shl nuw nsw i256 %31, 64
  %exit_length_shifted.i.i.i.i = shl nuw nsw i256 %32, 96
  %exit_abi_data.i.i.i.i = or i256 %exit_length_shifted.i.i.i.i, %exit_offset_shifted.i.i.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i.i)
  unreachable

switch_default_block.i70.i.i:                     ; preds = %switch_case_branch_1_block.i.i.i
  %addition_result17.i.i.i = add i256 %return_pointer.0.i.i.i, 32
  %33 = tail call i256 @llvm.umin.i256(i256 %addition_result17.i.i.i, i256 4294967295)
  %34 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i67.i.i, i256 4294967295)
  %exit_offset_shifted.i24.i.i.i = shl nuw nsw i256 %33, 64
  %exit_length_shifted.i25.i.i.i = shl nuw nsw i256 %34, 96
  %exit_abi_data.i26.i.i.i = or i256 %exit_length_shifted.i25.i.i.i, %exit_offset_shifted.i24.i.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i26.i.i.i)
  unreachable

fun_verifyCallResult.exit.i.i:                    ; preds = %extract_returndata.exit.i.i
  br i1 %comparison_result.not.i.i.i, label %fun_uniTransferFromSenderToThis.exit, label %if_main45.i.i

if_main45.i.i:                                    ; preds = %fun_verifyCallResult.exit.i.i
  %comparison_result.i.i.i = icmp slt i256 %memory_load_result.i67.i.i, 32
  br i1 %comparison_result.i.i.i, label %if_main.i71.i.i, label %if_join.i.i.i

if_main.i71.i.i:                                  ; preds = %if_main45.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i.i.i:                                    ; preds = %if_main45.i.i
  %addition_result54.i.i = add i256 %return_pointer.0.i.i.i, 32
  %memory_load_pointer.i72.i.i = inttoptr i256 %addition_result54.i.i to ptr addrspace(1)
  %memory_load_result.i73.i.i = load i256, ptr addrspace(1) %memory_load_pointer.i72.i.i, align 1
  %comparison_result5.i.i.i = icmp ne i256 %memory_load_result.i73.i.i, 0
  %comparison_result_extended8.i.i.i = zext i1 %comparison_result5.i.i.i to i256
  %comparison_result10.not.i.i.i = icmp eq i256 %memory_load_result.i73.i.i, %comparison_result_extended8.i.i.i
  br i1 %comparison_result10.not.i.i.i, label %abi_decode_bool_fromMemory.exit.i.i, label %if_main15.i.i.i

if_main15.i.i.i:                                  ; preds = %if_join.i.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_bool_fromMemory.exit.i.i:              ; preds = %if_join.i.i.i
  %comparison_result.i74.i.i = icmp eq i256 %memory_load_result.i73.i.i, 0
  br i1 %comparison_result.i74.i.i, label %if_main.i80.i.i, label %fun_uniTransferFromSenderToThis.exit

if_main.i80.i.i:                                  ; preds = %abi_decode_bool_fromMemory.exit.i.i
  %memory_load_result.i75.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i76.i.i = inttoptr i256 %memory_load_result.i75.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i76.i.i, align 1
  %addition_result.i77.i.i = add i256 %memory_load_result.i75.i.i, 4
  %memory_store_pointer4.i.i.i = inttoptr i256 %addition_result.i77.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i.i.i, align 1
  %addition_result6.i.i.i = add i256 %memory_load_result.i75.i.i, 36
  %memory_store_pointer7.i.i.i = inttoptr i256 %addition_result6.i.i.i to ptr addrspace(1)
  store i256 42, ptr addrspace(1) %memory_store_pointer7.i.i.i, align 1
  %addition_result9.i.i.i = add i256 %memory_load_result.i75.i.i, 68
  %memory_store_pointer10.i.i.i = inttoptr i256 %addition_result9.i.i.i to ptr addrspace(1)
  store i256 37714057306076988483118529433182395293628422681814405642689417129066110394478, ptr addrspace(1) %memory_store_pointer10.i.i.i, align 1
  %addition_result12.i.i.i = add i256 %memory_load_result.i75.i.i, 100
  %memory_store_pointer13.i.i.i = inttoptr i256 %addition_result12.i.i.i to ptr addrspace(1)
  store i256 50411904420896249798390057088552747694053213439589473829759729709664159399936, ptr addrspace(1) %memory_store_pointer13.i.i.i, align 1
  %35 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i75.i.i, i256 4294967295)
  %exit_offset_shifted.i.i78.i.i = shl nuw nsw i256 %35, 64
  %exit_abi_data.i.i79.i.i = or i256 %exit_offset_shifted.i.i78.i.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i79.i.i)
  unreachable

switch_default_block.i606:                        ; preds = %if_main.i589
  %get_u128_value.i = tail call i256 @llvm.syncvm.getu128()
  %comparison_result29.not.i = icmp ult i256 %get_u128_value.i, %storemerge319
  br i1 %comparison_result29.not.i, label %if_main.i73.i, label %require_helper_stringliteral_f063.exit.i

if_main.i73.i:                                    ; preds = %switch_default_block.i606
  %memory_load_result.i67.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i68.i = inttoptr i256 %memory_load_result.i67.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i68.i, align 1
  %addition_result.i69.i = add i256 %memory_load_result.i67.i, 4
  %memory_store_pointer4.i.i = inttoptr i256 %addition_result.i69.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i.i, align 1
  %addition_result6.i.i = add i256 %memory_load_result.i67.i, 36
  %memory_store_pointer7.i70.i = inttoptr i256 %addition_result6.i.i to ptr addrspace(1)
  store i256 26, ptr addrspace(1) %memory_store_pointer7.i70.i, align 1
  %addition_result9.i.i = add i256 %memory_load_result.i67.i, 68
  %memory_store_pointer10.i.i = inttoptr i256 %addition_result9.i.i to ptr addrspace(1)
  store i256 38641671858969249098363720752928066808677092124346750725223143445875249905664, ptr addrspace(1) %memory_store_pointer10.i.i, align 1
  %36 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i67.i, i256 4294967295)
  %exit_offset_shifted.i.i71.i = shl nuw nsw i256 %36, 64
  %exit_abi_data.i.i72.i = or i256 %exit_offset_shifted.i.i71.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i72.i)
  unreachable

require_helper_stringliteral_f063.exit.i:         ; preds = %switch_default_block.i606
  %get_u128_value34.i = tail call i256 @llvm.syncvm.getu128()
  %comparison_result35.i = icmp ugt i256 %get_u128_value34.i, %storemerge319
  br i1 %comparison_result35.i, label %if_main38.i, label %fun_uniTransferFromSenderToThis.exit

if_main38.i:                                      ; preds = %require_helper_stringliteral_f063.exit.i
  %get_u128_value41.i = tail call i256 @llvm.syncvm.getu128()
  %comparison_result.i75.i = icmp ult i256 %get_u128_value41.i, %storemerge319
  br i1 %comparison_result.i75.i, label %if_main.i81.i, label %fun_sub.exit.i

if_main.i81.i:                                    ; preds = %if_main38.i
  %memory_load_result.i76.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i77.i = inttoptr i256 %memory_load_result.i76.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i77.i, align 1
  %addition_result.i78.i = add i256 %memory_load_result.i76.i, 4
  %memory_store_pointer5.i.i = inttoptr i256 %addition_result.i78.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5.i.i, align 1
  %addition_result7.i.i = add i256 %memory_load_result.i76.i, 36
  %memory_store_pointer8.i.i = inttoptr i256 %addition_result7.i.i to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8.i.i, align 1
  %addition_result10.i.i = add i256 %memory_load_result.i76.i, 68
  %memory_store_pointer11.i.i = inttoptr i256 %addition_result10.i.i to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11.i.i, align 1
  %37 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i76.i, i256 4294967295)
  %exit_offset_shifted.i.i79.i = shl nuw nsw i256 %37, 64
  %exit_abi_data.i.i80.i = or i256 %exit_offset_shifted.i.i79.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i80.i)
  unreachable

fun_sub.exit.i:                                   ; preds = %if_main38.i
  %subtraction_result.i.i = sub i256 %get_u128_value41.i, %storemerge319
  %caller49.i = tail call i256 @llvm.syncvm.caller()
  %cond56.i = icmp eq i256 %caller49.i, 4
  br i1 %cond56.i, label %fun_uniTransferFromSenderToThis.exit, label %contract_call_ordinary_block.i607

contract_call_ordinary_block.i607:                ; preds = %fun_sub.exit.i
  %comparison_result43.i = icmp eq i256 %get_u128_value41.i, %storemerge319
  %spec.store.select.i = select i1 %comparison_result43.i, i256 14437333991389365756822315673377632757035417522267279379660800, i256 0
  br i1 %comparison_result43.i, label %contract_call_value_zero_block.i, label %contract_call_value_non_zero_block.i

contract_call_join_block.i:                       ; preds = %contract_call_value_non_zero_block.i, %contract_call_value_zero_block.i
  %system_far_call_external.pn.i = phi { ptr addrspace(3), i1 } [ %system_far_call_external.i, %contract_call_value_non_zero_block.i ], [ %contract_call_external.i.i609, %contract_call_value_zero_block.i ]
  %storemerge.in.in.in.i = extractvalue { ptr addrspace(3), i1 } %system_far_call_external.pn.i, 0
  %storemerge63.shrunk.i = extractvalue { ptr addrspace(3), i1 } %system_far_call_external.pn.i, 1
  store ptr addrspace(3) %storemerge.in.in.in.i, ptr @ptr_return_data, align 32
  %storemerge.in.in.i = ptrtoint ptr addrspace(3) %storemerge.in.in.in.i to i256
  %storemerge.in.i = lshr i256 %storemerge.in.in.i, 96
  %storemerge.i = and i256 %storemerge.in.i, 4294967295
  store i256 %storemerge.i, ptr @returndatasize, align 32
  br i1 %storemerge63.shrunk.i, label %fun_uniTransferFromSenderToThis.exit, label %if_main54.i

contract_call_value_zero_block.i:                 ; preds = %contract_call_ordinary_block.i607
  %contract_call_external.i.i609 = tail call { ptr addrspace(3), i1 } @__farcall(i256 %spec.store.select.i, i256 %caller49.i, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  br label %contract_call_join_block.i

contract_call_value_non_zero_block.i:             ; preds = %contract_call_ordinary_block.i607
  %abi_data_add_system_call_marker.i611 = or i256 %spec.store.select.i, 904625697166532776746648320380374280103671755200316906558262375061821325312
  %system_far_call_external.i = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker.i611, i256 32777, i256 %subtraction_result.i.i, i256 %caller49.i, i256 0, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  br label %contract_call_join_block.i

if_main54.i:                                      ; preds = %contract_call_join_block.i
  %storemerge.in.in.in.i.le = extractvalue { ptr addrspace(3), i1 } %system_far_call_external.pn.i, 0
  %memory_load_result.i82.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i.i613 = inttoptr i256 %memory_load_result.i82.i to ptr addrspace(1)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i613, ptr addrspace(3) align 1 %storemerge.in.in.in.i.le, i256 %storemerge.i, i1 false)
  %returndatasize3.i.i615 = load i256, ptr @returndatasize, align 32
  %38 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i82.i, i256 4294967295)
  %39 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i.i615, i256 4294967295)
  %exit_offset_shifted.i.i83.i = shl nuw nsw i256 %38, 64
  %exit_length_shifted.i.i.i616 = shl nuw nsw i256 %39, 96
  %exit_abi_data.i.i84.i = or i256 %exit_length_shifted.i.i.i616, %exit_offset_shifted.i.i83.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i84.i)
  unreachable

fun_uniTransferFromSenderToThis.exit:             ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit584, %fun_verifyCallResult.exit.i.i, %abi_decode_bool_fromMemory.exit.i.i, %require_helper_stringliteral_f063.exit.i, %fun_sub.exit.i, %contract_call_join_block.i
  br i1 %comparison_result100, label %if_join214, label %if_main213

switch_case_branch_1_block176:                    ; preds = %require_helper_stringliteral.exit
  %memory_load_result.i618 = load i256, ptr addrspace(1) %memory_load_pointer.i617, align 1
  %comparison_result.not.i619 = icmp ugt i256 %memory_load_result.i618, %storemerge12251297
  br i1 %comparison_result.not.i619, label %memory_array_index_access_contract_IERC20_dyn.1.exit625, label %if_main.i620

if_main.i620:                                     ; preds = %switch_case_branch_1_block176
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit625: ; preds = %switch_case_branch_1_block176
  %addition_result.i622 = add i256 %shift_left_non_overflow_result.i540, 32
  %addition_result7.i623 = add i256 %addition_result.i622, %expr_mpos179
  %memory_load_pointer181 = inttoptr i256 %addition_result7.i623 to ptr addrspace(1)
  %memory_load_result182 = load i256, ptr addrspace(1) %memory_load_pointer181, align 1
  %comparison_result.i626 = icmp eq i256 %memory_load_result182, 0
  br i1 %comparison_result.i626, label %fun_mul.exit649, label %if_join.i630

if_join.i630:                                     ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit625
  %division_result_non_zero.i628 = udiv i256 -1, %memory_load_result182
  %comparison_result4.i629 = icmp ult i256 %division_result_non_zero.i628, %storemerge1301
  br i1 %comparison_result4.i629, label %if_main7.i631, label %if_join8.i635

if_main7.i631:                                    ; preds = %if_join.i630
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i635:                                    ; preds = %if_join.i630
  %multiplication_result.i632 = mul i256 %memory_load_result182, %storemerge1301
  %division_result_non_zero.i.i633 = udiv i256 %multiplication_result.i632, %memory_load_result182
  %comparison_result14.not.i634 = icmp eq i256 %division_result_non_zero.i.i633, %storemerge1301
  br i1 %comparison_result14.not.i634, label %fun_mul.exit649, label %if_main19.i648

if_main19.i648:                                   ; preds = %if_join8.i635
  %memory_load_result.i636 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i637 = inttoptr i256 %memory_load_result.i636 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i637, align 1
  %addition_result.i638 = add i256 %memory_load_result.i636, 4
  %memory_store_pointer23.i639 = inttoptr i256 %addition_result.i638 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i639, align 1
  %addition_result25.i640 = add i256 %memory_load_result.i636, 36
  %memory_store_pointer26.i641 = inttoptr i256 %addition_result25.i640 to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i641, align 1
  %addition_result28.i642 = add i256 %memory_load_result.i636, 68
  %memory_store_pointer29.i643 = inttoptr i256 %addition_result28.i642 to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i643, align 1
  %addition_result31.i644 = add i256 %memory_load_result.i636, 100
  %memory_store_pointer32.i645 = inttoptr i256 %addition_result31.i644 to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i645, align 1
  %40 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i636, i256 4294967295)
  %exit_offset_shifted.i.i646 = shl nuw nsw i256 %40, 64
  %exit_abi_data.i.i647 = or i256 %exit_offset_shifted.i.i646, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i647)
  unreachable

fun_mul.exit649:                                  ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit625, %if_join8.i635
  %return_pointer.0.i627 = phi i256 [ 0, %memory_array_index_access_contract_IERC20_dyn.1.exit625 ], [ %multiplication_result.i632, %if_join8.i635 ]
  br i1 %comparison_result.i650, label %if_main.i651, label %checked_sub_uint256_14888.exit

if_main.i651:                                     ; preds = %fun_mul.exit649
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_sub_uint256_14888.exit:                   ; preds = %fun_mul.exit649
  %comparison_result.i.i654 = icmp ugt i256 %return_pointer.0.i627, %xor_result.i.i
  br i1 %comparison_result.i.i654, label %if_main.i.i655, label %checked_add_uint256.exit.i

if_main.i.i655:                                   ; preds = %checked_sub_uint256_14888.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i:                       ; preds = %checked_sub_uint256_14888.exit
  %addition_result.i652 = add i256 %return_pointer.0.i627, -1
  %addition_result.i.i656 = add i256 %addition_result.i652, %_2184
  %comparison_result.i657 = icmp ult i256 %addition_result.i.i656, %return_pointer.0.i627
  br i1 %comparison_result.i657, label %if_main.i668, label %fun_div.exit684

if_main.i668:                                     ; preds = %checked_add_uint256.exit.i
  %memory_load_result.i658 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i659 = inttoptr i256 %memory_load_result.i658 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i659, align 1
  %addition_result.i660 = add i256 %memory_load_result.i658, 4
  %memory_store_pointer7.i661 = inttoptr i256 %addition_result.i660 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i661, align 1
  %addition_result9.i662 = add i256 %memory_load_result.i658, 36
  %memory_store_pointer10.i663 = inttoptr i256 %addition_result9.i662 to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i663, align 1
  %addition_result12.i664 = add i256 %memory_load_result.i658, 68
  %memory_store_pointer13.i665 = inttoptr i256 %addition_result12.i664 to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i665, align 1
  %41 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i658, i256 4294967295)
  %exit_offset_shifted.i.i666 = shl nuw nsw i256 %41, 64
  %exit_abi_data.i.i667 = or i256 %exit_offset_shifted.i.i666, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i667)
  unreachable

fun_div.exit684:                                  ; preds = %checked_add_uint256.exit.i
  %division_result_non_zero.i.i682 = udiv i256 %addition_result.i.i656, %_2184
  br label %switch_join_block175

if_main213:                                       ; preds = %fun_uniTransferFromSenderToThis.exit
  %address215 = tail call i256 @llvm.syncvm.this()
  %memory_load_result.i692 = load i256, ptr addrspace(1) %memory_load_pointer.i576, align 1
  %comparison_result.not.i693 = icmp ugt i256 %memory_load_result.i692, %storemerge12251297
  br i1 %comparison_result.not.i693, label %memory_array_index_access_contract_IERC20_dyn.1.exit699, label %if_main.i694

if_main.i694:                                     ; preds = %if_main213
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit699: ; preds = %if_main213
  %memory_load_result.i701 = load i256, ptr addrspace(1) %memory_load_pointer.i585, align 1
  %and_result.i702 = and i256 %memory_load_result.i701, 1461501637330902918203684832716283019655932542975
  %comparison_result.not.i703 = icmp eq i256 %and_result.i702, 0
  br i1 %comparison_result.not.i703, label %switch_default_block.i752, label %switch_case_branch_1_block.i712

switch_case_branch_1_block.i712:                  ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit699
  %memory_load_result.i705 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i706 = inttoptr i256 %memory_load_result.i705 to ptr addrspace(1)
  store i256 50942633119752846454219349998365661925608737367104304655302372697894809501696, ptr addrspace(1) %memory_store_pointer.i706, align 1
  %and_result12.i707 = and i256 %address215, 1461501637330902918203684832716283019655932542975
  %addition_result.i708 = add i256 %memory_load_result.i705, 4
  %memory_store_pointer14.i709 = inttoptr i256 %addition_result.i708 to ptr addrspace(1)
  store i256 %and_result12.i707, ptr addrspace(1) %memory_store_pointer14.i709, align 1
  %gas_left.i710 = tail call i256 @llvm.syncvm.gasleft()
  %cond40.i711 = icmp eq i256 %and_result.i702, 4
  br i1 %cond40.i711, label %if_join.i740, label %contract_call_ordinary_block.i723

contract_call_ordinary_block.i723:                ; preds = %switch_case_branch_1_block.i712
  %42 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i705, i256 4294967295)
  %43 = tail call i256 @llvm.umin.i256(i256 %gas_left.i710, i256 4294967295)
  %abi_data_input_offset_shifted.i.i713 = shl nuw nsw i256 %42, 64
  %abi_data_gas_shifted.i.i714 = shl nuw nsw i256 %43, 192
  %abi_data_offset_and_length.i.i715 = or i256 %abi_data_gas_shifted.i.i714, %abi_data_input_offset_shifted.i.i713
  %abi_data_add_gas.i.i716 = or i256 %abi_data_offset_and_length.i.i715, 2852213850513516153367582212096
  %contract_call_external.i.i717 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_gas.i.i716, i256 %and_result.i702, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i.i718 = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i717, 0
  %contract_call_external_result_status_code_boolean.i.i719 = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i717, 1
  %contract_call_memcpy_from_child_pointer_casted.i.i720 = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i.i718 to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i.i721 = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i.i720, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i.i722 = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i.i721, 4294967295
  %44 = tail call i256 @llvm.umin.i256(i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i722, i256 32)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %memory_store_pointer.i706, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i718, i256 %44, i1 false)
  store ptr addrspace(3) %contract_call_external_result_abi_data.i.i718, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i722, ptr @returndatasize, align 32
  br i1 %contract_call_external_result_status_code_boolean.i.i719, label %if_join.i740, label %if_main.i732

if_main.i732:                                     ; preds = %contract_call_ordinary_block.i723
  %contract_call_external_result_abi_data.i.i718.le = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i717, 0
  %memory_load_result.i.i725 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i.i726 = inttoptr i256 %memory_load_result.i.i725 to ptr addrspace(1)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i726, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i718.le, i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i722, i1 false)
  %returndatasize3.i.i728 = load i256, ptr @returndatasize, align 32
  %45 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i725, i256 4294967295)
  %46 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i.i728, i256 4294967295)
  %exit_offset_shifted.i.i.i729 = shl nuw nsw i256 %45, 64
  %exit_length_shifted.i.i.i730 = shl nuw nsw i256 %46, 96
  %exit_abi_data.i.i.i731 = or i256 %exit_length_shifted.i.i.i730, %exit_offset_shifted.i.i.i729
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i731)
  unreachable

if_join.i740:                                     ; preds = %contract_call_ordinary_block.i723, %switch_case_branch_1_block.i712
  %returndatasize.i733 = load i256, ptr @returndatasize, align 32
  %47 = tail call i256 @llvm.umin.i256(i256 %returndatasize.i733, i256 32)
  %addition_result.i.i734 = add nuw nsw i256 %47, 31
  %and_result.i.i735 = and i256 %addition_result.i.i734, 96
  %addition_result3.i.i736 = add i256 %and_result.i.i735, %memory_load_result.i705
  %comparison_result.i.i737 = icmp ult i256 %addition_result3.i.i736, %memory_load_result.i705
  %comparison_result7.i.i738 = icmp ugt i256 %addition_result3.i.i736, 18446744073709551615
  %or_result13.i.i739 = or i1 %comparison_result7.i.i738, %comparison_result.i.i737
  br i1 %or_result13.i.i739, label %if_main.i.i741, label %finalize_allocation.exit.i743

if_main.i.i741:                                   ; preds = %if_join.i740
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit.i743:                    ; preds = %if_join.i740
  store i256 %addition_result3.i.i736, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %comparison_result.i44.i742 = icmp ult i256 %returndatasize.i733, 32
  br i1 %comparison_result.i44.i742, label %if_main.i45.i744, label %abi_decode_uint256_fromMemory.exit.i746

if_main.i45.i744:                                 ; preds = %finalize_allocation.exit.i743
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_uint256_fromMemory.exit.i746:          ; preds = %finalize_allocation.exit.i743
  %memory_load_result.i46.i745 = load i256, ptr addrspace(1) %memory_store_pointer.i706, align 1
  br label %fun_uniBalanceOf.exit757

switch_default_block.i752:                        ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit699
  store i256 -44877977326897262784168444354156441158329539312518651612887364914072161059015, ptr addrspace(2) null, align 4294967296
  store i256 %address215, ptr addrspace(2) inttoptr (i256 4 to ptr addrspace(2)), align 4
  %gas_left.i.i747 = tail call i256 @llvm.syncvm.gasleft()
  %48 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i747, i256 4294967295)
  %abi_data_gas_shifted.i47.i748 = shl nuw nsw i256 %48, 192
  %abi_data_add_system_call_marker.i.i749 = or i256 %abi_data_gas_shifted.i47.i748, 904625751086426111047927909714404454142933105326819602152923490636624035840
  %system_request.i.i750 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i749, i256 32778, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i751 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i750, 1
  br i1 %system_request_result_status_code_boolean.i.i751, label %__system_request.exit.i756, label %system_request_error_block.i.i753

system_request_error_block.i.i753:                ; preds = %switch_default_block.i752
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i756:                       ; preds = %switch_default_block.i752
  %system_request_result_abi_data.i.i754 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i750, 0
  %system_request_child_address.i.i755 = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i754, align 1
  br label %fun_uniBalanceOf.exit757

fun_uniBalanceOf.exit757:                         ; preds = %abi_decode_uint256_fromMemory.exit.i746, %__system_request.exit.i756
  %return_pointer.0.i704 = phi i256 [ %memory_load_result.i46.i745, %abi_decode_uint256_fromMemory.exit.i746 ], [ %system_request_child_address.i.i755, %__system_request.exit.i756 ]
  %memory_load_result.i759 = load i256, ptr addrspace(1) %memory_load_pointer.i758, align 1
  %comparison_result.not.i760 = icmp ugt i256 %memory_load_result.i759, %storemerge12251297
  br i1 %comparison_result.not.i760, label %memory_array_index_access_contract_IERC20_dyn.1.exit766, label %if_main.i761

if_main.i761:                                     ; preds = %fun_uniBalanceOf.exit757
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit766: ; preds = %fun_uniBalanceOf.exit757
  %addition_result.i763 = add i256 %shift_left_non_overflow_result.i540, 32
  %addition_result7.i764 = add i256 %addition_result.i763, %expr_mpos222
  %memory_load_pointer224 = inttoptr i256 %addition_result7.i764 to ptr addrspace(1)
  %memory_load_result225 = load i256, ptr addrspace(1) %memory_load_pointer224, align 1
  %comparison_result.i767 = icmp ult i256 %return_pointer.0.i704, %memory_load_result225
  br i1 %comparison_result.i767, label %if_main.i778, label %fun_sub.exit780

if_main.i778:                                     ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit766
  %memory_load_result.i768 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i769 = inttoptr i256 %memory_load_result.i768 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i769, align 1
  %addition_result.i770 = add i256 %memory_load_result.i768, 4
  %memory_store_pointer5.i771 = inttoptr i256 %addition_result.i770 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5.i771, align 1
  %addition_result7.i772 = add i256 %memory_load_result.i768, 36
  %memory_store_pointer8.i773 = inttoptr i256 %addition_result7.i772 to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8.i773, align 1
  %addition_result10.i774 = add i256 %memory_load_result.i768, 68
  %memory_store_pointer11.i775 = inttoptr i256 %addition_result10.i774 to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11.i775, align 1
  %49 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i768, i256 4294967295)
  %exit_offset_shifted.i.i776 = shl nuw nsw i256 %49, 64
  %exit_abi_data.i.i777 = or i256 %exit_offset_shifted.i.i776, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i777)
  unreachable

fun_sub.exit780:                                  ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit766
  %subtraction_result.i779 = sub i256 %return_pointer.0.i704, %memory_load_result225
  br i1 %comparison_result.i781, label %memory_array_index_access_contract_IERC20_dyn.1.exit813, label %if_join.i785

if_join.i785:                                     ; preds = %fun_sub.exit780
  %division_result_non_zero.i783 = udiv i256 -1, %_2228
  %comparison_result4.i784 = icmp ult i256 %division_result_non_zero.i783, %subtraction_result.i779
  br i1 %comparison_result4.i784, label %if_main7.i786, label %if_join8.i790

if_main7.i786:                                    ; preds = %if_join.i785
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i790:                                    ; preds = %if_join.i785
  %multiplication_result.i787 = mul i256 %_2228, %subtraction_result.i779
  %division_result_non_zero.i.i788 = udiv i256 %multiplication_result.i787, %_2228
  %comparison_result14.not.i789 = icmp eq i256 %division_result_non_zero.i.i788, %subtraction_result.i779
  br i1 %comparison_result14.not.i789, label %memory_array_index_access_contract_IERC20_dyn.1.exit813, label %if_main19.i803

if_main19.i803:                                   ; preds = %if_join8.i790
  %memory_load_result.i791 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i792 = inttoptr i256 %memory_load_result.i791 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i792, align 1
  %addition_result.i793 = add i256 %memory_load_result.i791, 4
  %memory_store_pointer23.i794 = inttoptr i256 %addition_result.i793 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i794, align 1
  %addition_result25.i795 = add i256 %memory_load_result.i791, 36
  %memory_store_pointer26.i796 = inttoptr i256 %addition_result25.i795 to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i796, align 1
  %addition_result28.i797 = add i256 %memory_load_result.i791, 68
  %memory_store_pointer29.i798 = inttoptr i256 %addition_result28.i797 to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i798, align 1
  %addition_result31.i799 = add i256 %memory_load_result.i791, 100
  %memory_store_pointer32.i800 = inttoptr i256 %addition_result31.i799 to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i800, align 1
  %50 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i791, i256 4294967295)
  %exit_offset_shifted.i.i801 = shl nuw nsw i256 %50, 64
  %exit_abi_data.i.i802 = or i256 %exit_offset_shifted.i.i801, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i802)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit813: ; preds = %if_join8.i790, %fun_sub.exit780
  %return_pointer.0.i782 = phi i256 [ 0, %fun_sub.exit780 ], [ %multiplication_result.i787, %if_join8.i790 ]
  %comparison_result.i814 = icmp eq i256 %memory_load_result225, 0
  br i1 %comparison_result.i814, label %if_main.i825, label %fun_div.exit828

if_main.i825:                                     ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit813
  %memory_load_result.i815 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i816 = inttoptr i256 %memory_load_result.i815 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i816, align 1
  %addition_result.i817 = add i256 %memory_load_result.i815, 4
  %memory_store_pointer4.i818 = inttoptr i256 %addition_result.i817 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i818, align 1
  %addition_result6.i819 = add i256 %memory_load_result.i815, 36
  %memory_store_pointer7.i820 = inttoptr i256 %addition_result6.i819 to ptr addrspace(1)
  store i256 26, ptr addrspace(1) %memory_store_pointer7.i820, align 1
  %addition_result9.i821 = add i256 %memory_load_result.i815, 68
  %memory_store_pointer10.i822 = inttoptr i256 %addition_result9.i821 to ptr addrspace(1)
  store i256 37714057306925736537727338326753656978887423192446994710127794316522513498112, ptr addrspace(1) %memory_store_pointer10.i822, align 1
  %51 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i815, i256 4294967295)
  %exit_offset_shifted.i.i823 = shl nuw nsw i256 %51, 64
  %exit_abi_data.i.i824 = or i256 %exit_offset_shifted.i.i823, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i824)
  unreachable

fun_div.exit828:                                  ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit813
  %division_result_non_zero.i.i826 = udiv i256 %return_pointer.0.i782, %memory_load_result225
  %var_fairSupply237 = load i256, ptr %var_fairSupply, align 32
  %52 = tail call i256 @llvm.umin.i256(i256 %var_fairSupply237, i256 %division_result_non_zero.i.i826)
  store i256 %52, ptr %var_fairSupply, align 32
  br label %if_join214

if_join214:                                       ; preds = %fun_div.exit828, %fun_uniTransferFromSenderToThis.exit
  %addition_result.i831 = add nuw i256 %storemerge12251297, 1
  %comparison_result160 = icmp ult i256 %addition_result.i831, %value1158
  br i1 %comparison_result160, label %for_body155, label %for_join157

if_join244:                                       ; preds = %fun_scale.exit1216, %for_join157
  %var_fairSupply286 = load i256, ptr %var_fairSupply, align 32
  %comparison_result287.not = icmp eq i256 %var_fairSupply286, 0
  br i1 %comparison_result287.not, label %if_main.i845, label %require_helper_stringliteral_a6f1.exit

if_main.i845:                                     ; preds = %if_join244
  %memory_load_result.i835 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i836 = inttoptr i256 %memory_load_result.i835 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i836, align 1
  %addition_result.i837 = add i256 %memory_load_result.i835, 4
  %memory_store_pointer4.i838 = inttoptr i256 %addition_result.i837 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i838, align 1
  %addition_result6.i839 = add i256 %memory_load_result.i835, 36
  %memory_store_pointer7.i840 = inttoptr i256 %addition_result6.i839 to ptr addrspace(1)
  store i256 31, ptr addrspace(1) %memory_store_pointer7.i840, align 1
  %addition_result9.i841 = add i256 %memory_load_result.i835, 68
  %memory_store_pointer10.i842 = inttoptr i256 %addition_result9.i841 to ptr addrspace(1)
  store i256 35024978435645830422959912903222512151939984008179610950862390640503314409472, ptr addrspace(1) %memory_store_pointer10.i842, align 1
  %53 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i835, i256 4294967295)
  %exit_offset_shifted.i.i843 = shl nuw nsw i256 %53, 64
  %exit_abi_data.i.i844 = or i256 %exit_offset_shifted.i.i843, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i844)
  unreachable

require_helper_stringliteral_a6f1.exit:           ; preds = %if_join244
  %caller = tail call i256 @llvm.syncvm.caller()
  %and_result.i847 = and i256 %caller, 1461501637330902918203684832716283019655932542975
  %comparison_result.i848 = icmp eq i256 %and_result.i847, 0
  br i1 %comparison_result.i848, label %if_main.i859, label %if_join.i863

if_main.i859:                                     ; preds = %require_helper_stringliteral_a6f1.exit
  %memory_load_result.i849 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i850 = inttoptr i256 %memory_load_result.i849 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i850, align 1
  %addition_result.i851 = add i256 %memory_load_result.i849, 4
  %memory_store_pointer10.i852 = inttoptr i256 %addition_result.i851 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer10.i852, align 1
  %addition_result12.i853 = add i256 %memory_load_result.i849, 36
  %memory_store_pointer13.i854 = inttoptr i256 %addition_result12.i853 to ptr addrspace(1)
  store i256 31, ptr addrspace(1) %memory_store_pointer13.i854, align 1
  %addition_result15.i855 = add i256 %memory_load_result.i849, 68
  %memory_store_pointer16.i856 = inttoptr i256 %addition_result15.i855 to ptr addrspace(1)
  store i256 31354931781638678563069525067809233856775101976563302031013534919694566519552, ptr addrspace(1) %memory_store_pointer16.i856, align 1
  %54 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i849, i256 4294967295)
  %exit_offset_shifted.i.i857 = shl nuw nsw i256 %54, 64
  %exit_abi_data.i.i858 = or i256 %exit_offset_shifted.i.i857, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i858)
  unreachable

if_join.i863:                                     ; preds = %require_helper_stringliteral_a6f1.exit
  %storage_load.i860 = tail call i256 @llvm.syncvm.sload(i256 2)
  %xor_result.i.i861 = xor i256 %var_fairSupply286, -1
  %comparison_result.i.i862 = icmp ugt i256 %storage_load.i860, %xor_result.i.i861
  br i1 %comparison_result.i.i862, label %if_main.i.i864, label %checked_add_uint256.exit.i871

if_main.i.i864:                                   ; preds = %if_join.i863
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i871:                    ; preds = %if_join.i863
  %addition_result.i.i865 = add i256 %storage_load.i860, %var_fairSupply286
  tail call void @llvm.syncvm.sstore(i256 2, i256 %addition_result.i.i865)
  store i256 %and_result.i847, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i.i866 = tail call i256 @llvm.syncvm.gasleft()
  %55 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i.i866, i256 4294967295)
  %abi_data_gas_shifted.i.i.i867 = shl nuw nsw i256 %55, 192
  %abi_data_add_system_call_marker.i.i.i868 = or i256 %abi_data_gas_shifted.i.i.i867, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i.i869 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i.i868, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i.i870 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i.i869, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i.i870, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i875, label %keccak256_failure_block.i.i.i872

keccak256_failure_block.i.i.i872:                 ; preds = %checked_add_uint256.exit.i871
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i875: ; preds = %checked_add_uint256.exit.i871
  %keccak256_call_external_result_abi_data_pointer.i.i.i873 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i.i869, 0
  %keccak256_child_data.i.i.i874 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i.i873, align 1
  %storage_load22.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i.i874)
  %comparison_result.i37.i = icmp ugt i256 %storage_load22.i, %xor_result.i.i861
  br i1 %comparison_result.i37.i, label %if_main.i38.i, label %checked_add_uint256.exit40.i

if_main.i38.i:                                    ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i875
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit40.i:                     ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i875
  %addition_result.i39.i = add i256 %storage_load22.i, %var_fairSupply286
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i.i874, i256 %addition_result.i39.i)
  %memory_load_result25.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer28.i = inttoptr i256 %memory_load_result25.i to ptr addrspace(1)
  store i256 %var_fairSupply286, ptr addrspace(1) %memory_store_pointer28.i, align 1
  %gas_left.i876 = tail call i256 @llvm.syncvm.gasleft()
  %56 = tail call i256 @llvm.umin.i256(i256 %memory_load_result25.i, i256 4294967295)
  %57 = tail call i256 @llvm.umin.i256(i256 %gas_left.i876, i256 4294967295)
  %abi_data_input_offset_shifted.i877 = shl nuw nsw i256 %56, 64
  %abi_data_gas_shifted.i878 = shl nuw nsw i256 %57, 192
  %abi_data_offset_and_length.i879 = or i256 %abi_data_gas_shifted.i878, %abi_data_input_offset_shifted.i877
  %abi_data_add_system_call_marker.i880 = or i256 %abi_data_offset_and_length.i879, 904625697166532776746648320380374280103671757735618107014721178055227736064
  %event_writer_call_external.i881 = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker.i880, i256 32781, i256 3, i256 -15402802100530019096323380498944738953123845089667699673314898783681816316945, i256 0, i256 %and_result.i847, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %event_writer_external_result_status_code_boolean.i882 = extractvalue { ptr addrspace(3), i1 } %event_writer_call_external.i881, 1
  br i1 %event_writer_external_result_status_code_boolean.i882, label %fun_mint.exit, label %event_failure_block.i883

event_failure_block.i883:                         ; preds = %checked_add_uint256.exit40.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

fun_mint.exit:                                    ; preds = %checked_add_uint256.exit40.i
  %memory_load_result292 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i885 = inttoptr i256 %memory_load_result292 to ptr addrspace(1)
  store i256 %var_fairSupply286, ptr addrspace(1) %memory_store_pointer.i885, align 1
  %gas_left = tail call i256 @llvm.syncvm.gasleft()
  %58 = tail call i256 @llvm.umin.i256(i256 %memory_load_result292, i256 4294967295)
  %59 = tail call i256 @llvm.umin.i256(i256 %gas_left, i256 4294967295)
  %abi_data_input_offset_shifted = shl nuw nsw i256 %58, 64
  %abi_data_gas_shifted = shl nuw nsw i256 %59, 192
  %abi_data_offset_and_length = or i256 %abi_data_gas_shifted, %abi_data_input_offset_shifted
  %abi_data_add_system_call_marker = or i256 %abi_data_offset_and_length, 904625697166532776746648320380374280103671757735618107014721178055227736064
  %event_writer_call_external = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker, i256 32781, i256 2, i256 20644549604082266639320257001935285394590065917650136896563126397825491550916, i256 %caller, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %event_writer_external_result_status_code_boolean = extractvalue { ptr addrspace(3), i1 } %event_writer_call_external, 1
  br i1 %event_writer_external_result_status_code_boolean, label %event_join_block, label %event_failure_block

for_body246:                                      ; preds = %for_body246.lr.ph, %fun_scale.exit1216
  %storemerge3181300 = phi i256 [ 0, %for_body246.lr.ph ], [ %addition_result.i1219, %fun_scale.exit1216 ]
  %memory_load_result.i887 = load i256, ptr addrspace(1) %memory_load_pointer.i886, align 1
  %comparison_result.not.i888 = icmp ugt i256 %memory_load_result.i887, %storemerge3181300
  br i1 %comparison_result.not.i888, label %memory_array_index_access_contract_IERC20_dyn.1.exit894, label %if_main.i889

if_main.i889:                                     ; preds = %for_body246
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit894: ; preds = %for_body246
  %shift_left_non_overflow_result.i890 = shl i256 %storemerge3181300, 5
  %addition_result.i891 = add i256 %shift_left_non_overflow_result.i890, 32
  %addition_result7.i892 = add i256 %addition_result.i891, %var_tokens_mpos255
  %memory_load_pointer.i895 = inttoptr i256 %addition_result7.i892 to ptr addrspace(1)
  %memory_load_result.i896 = load i256, ptr addrspace(1) %memory_load_pointer.i895, align 1
  %and_result.i897 = and i256 %memory_load_result.i896, 1461501637330902918203684832716283019655932542975
  store i256 %and_result.i897, ptr addrspace(1) null, align 4294967296
  store i256 12, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i898 = tail call i256 @llvm.syncvm.gasleft()
  %60 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i898, i256 4294967295)
  %abi_data_gas_shifted.i.i899 = shl nuw nsw i256 %60, 192
  %abi_data_add_system_call_marker.i.i900 = or i256 %abi_data_gas_shifted.i.i899, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i900, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14879.exit, label %keccak256_failure_block.i.i

keccak256_failure_block.i.i:                      ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit894
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14879.exit: ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit894
  %keccak256_call_external_result_abi_data_pointer.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 0
  %keccak256_child_data.i.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i, align 1
  %memory_load_result.i902 = load i256, ptr addrspace(1) %memory_load_pointer.i901, align 1
  %comparison_result.not.i903 = icmp ugt i256 %memory_load_result.i902, %storemerge3181300
  br i1 %comparison_result.not.i903, label %memory_array_index_access_contract_IERC20_dyn.1.exit909, label %if_main.i904

if_main.i904:                                     ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14879.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit909: ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14879.exit
  %addition_result.i906 = add i256 %shift_left_non_overflow_result.i890, 32
  %addition_result7.i907 = add i256 %addition_result.i906, %expr_mpos259
  %memory_load_pointer261 = inttoptr i256 %addition_result7.i907 to ptr addrspace(1)
  %memory_load_result262 = load i256, ptr addrspace(1) %memory_load_pointer261, align 1
  br i1 %comparison_result.i.i911, label %if_main.i.i912, label %checked_add_uint256.exit.i915

if_main.i.i912:                                   ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit909
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i915:                    ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit909
  %memory_load_result.i916 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  br i1 %comparison_result.i914, label %if_main.i926, label %fun_add.exit928

if_main.i926:                                     ; preds = %checked_add_uint256.exit.i915
  %memory_store_pointer.i917 = inttoptr i256 %memory_load_result.i916 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i917, align 1
  %addition_result.i918 = add i256 %memory_load_result.i916, 4
  %memory_store_pointer7.i919 = inttoptr i256 %addition_result.i918 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i919, align 1
  %addition_result9.i920 = add i256 %memory_load_result.i916, 36
  %memory_store_pointer10.i921 = inttoptr i256 %addition_result9.i920 to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i921, align 1
  %addition_result12.i922 = add i256 %memory_load_result.i916, 68
  %memory_store_pointer13.i923 = inttoptr i256 %addition_result12.i922 to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i923, align 1
  %61 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i916, i256 4294967295)
  %exit_offset_shifted.i.i924 = shl nuw nsw i256 %61, 64
  %exit_abi_data.i.i925 = or i256 %exit_offset_shifted.i.i924, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i925)
  unreachable

fun_add.exit928:                                  ; preds = %checked_add_uint256.exit.i915
  %62 = icmp ugt i256 %memory_load_result.i916, 18446744073709551551
  br i1 %62, label %if_main.i.i.i930, label %read_from_storage_reference_type_struct_Data.exit.i

if_main.i.i.i930:                                 ; preds = %fun_add.exit928
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

read_from_storage_reference_type_struct_Data.exit.i: ; preds = %fun_add.exit928
  %addition_result.i.i.i931 = add i256 %memory_load_result.i916, 64
  store i256 %addition_result.i.i.i931, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %storage_load.i.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i)
  %and_result.i.i932 = and i256 %storage_load.i.i, 105312291668557186697918027683670432318895095400549111254310977535
  %memory_store_pointer.i.i933 = inttoptr i256 %memory_load_result.i916 to ptr addrspace(1)
  store i256 %and_result.i.i932, ptr addrspace(1) %memory_store_pointer.i.i933, align 1
  %shift_right_non_overflow_result.i.i = lshr i256 %storage_load.i.i, 216
  %addition_result.i.i934 = add i256 %memory_load_result.i916, 32
  %memory_store_pointer8.i.i935 = inttoptr i256 %addition_result.i.i934 to ptr addrspace(1)
  store i256 %shift_right_non_overflow_result.i.i, ptr addrspace(1) %memory_store_pointer8.i.i935, align 1
  store i256 54919857843691310904240101001871775513466943666296306094405906504622902841650, ptr addrspace(2) null, align 4294967296
  %gas_left.i.i.i936 = tail call i256 @llvm.syncvm.gasleft()
  %63 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i.i936, i256 4294967295)
  %abi_data_gas_shifted.i.i.i937 = shl nuw nsw i256 %63, 192
  %abi_data_add_system_call_marker.i.i.i938 = or i256 %abi_data_gas_shifted.i.i.i937, 904625751086426111047927909714404454142933102791518401696464687643217625088
  %system_request.i.i.i939 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i.i938, i256 32779, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i.i940 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i939, 1
  br i1 %system_request_result_status_code_boolean.i.i.i940, label %__system_request.exit.i.i945, label %system_request_error_block.i.i.i941

system_request_error_block.i.i.i941:              ; preds = %read_from_storage_reference_type_struct_Data.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i.i945:                     ; preds = %read_from_storage_reference_type_struct_Data.exit.i
  %system_request_result_abi_data.i.i.i942 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i939, 0
  %system_request_child_address.i.i.i943 = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i.i942, align 1
  %comparison_result.i.i.i944 = icmp ult i256 %system_request_child_address.i.i.i943, %shift_right_non_overflow_result.i.i
  br i1 %comparison_result.i.i.i944, label %if_main.i.i60.i, label %fun_sub.exit.i.i

if_main.i.i60.i:                                  ; preds = %__system_request.exit.i.i945
  %memory_load_result.i.i.i946 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i.i947 = inttoptr i256 %memory_load_result.i.i.i946 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i.i.i947, align 1
  %addition_result.i.i59.i = add i256 %memory_load_result.i.i.i946, 4
  %memory_store_pointer5.i.i.i = inttoptr i256 %addition_result.i.i59.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5.i.i.i, align 1
  %addition_result7.i.i.i = add i256 %memory_load_result.i.i.i946, 36
  %memory_store_pointer8.i.i.i = inttoptr i256 %addition_result7.i.i.i to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8.i.i.i, align 1
  %addition_result10.i.i.i = add i256 %memory_load_result.i.i.i946, 68
  %memory_store_pointer11.i.i.i = inttoptr i256 %addition_result10.i.i.i to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11.i.i.i, align 1
  %64 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i.i946, i256 4294967295)
  %exit_offset_shifted.i.i.i.i948 = shl nuw nsw i256 %64, 64
  %exit_abi_data.i.i.i.i949 = or i256 %exit_offset_shifted.i.i.i.i948, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i.i949)
  unreachable

fun_sub.exit.i.i:                                 ; preds = %__system_request.exit.i.i945
  %subtraction_result.i.i.i950 = sub i256 %system_request_child_address.i.i.i943, %shift_right_non_overflow_result.i.i
  %65 = tail call i256 @llvm.umin.i256(i256 %subtraction_result.i.i.i950, i256 300)
  %memory_load_result39.i.i = load i256, ptr addrspace(1) %memory_store_pointer.i.i933, align 1
  %and_result40.i.i = and i256 %memory_load_result39.i.i, 105312291668557186697918027683670432318895095400549111254310977535
  %comparison_result.i54.i.i = icmp eq i256 %and_result40.i.i, 0
  br i1 %comparison_result.i54.i.i, label %fun_mul.exit.i.i, label %if_join8.i.i.i

if_join8.i.i.i:                                   ; preds = %fun_sub.exit.i.i
  %subtraction_result.i.i951 = sub nuw nsw i256 300, %65
  %multiplication_result.i.i.i = mul nsw i256 %and_result40.i.i, %subtraction_result.i.i951
  %division_result_non_zero.i.i.i.i = udiv i256 %multiplication_result.i.i.i, %and_result40.i.i
  %comparison_result14.not.i.i.i = icmp eq i256 %division_result_non_zero.i.i.i.i, %subtraction_result.i.i951
  br i1 %comparison_result14.not.i.i.i, label %fun_mul.exit.i.i, label %if_main19.i.i.i

if_main19.i.i.i:                                  ; preds = %if_join8.i.i.i
  %memory_load_result.i55.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i56.i.i = inttoptr i256 %memory_load_result.i55.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i56.i.i, align 1
  %addition_result.i57.i.i = add i256 %memory_load_result.i55.i.i, 4
  %memory_store_pointer23.i.i.i = inttoptr i256 %addition_result.i57.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i.i.i, align 1
  %addition_result25.i.i.i = add i256 %memory_load_result.i55.i.i, 36
  %memory_store_pointer26.i.i.i = inttoptr i256 %addition_result25.i.i.i to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i.i.i, align 1
  %addition_result28.i.i.i = add i256 %memory_load_result.i55.i.i, 68
  %memory_store_pointer29.i.i.i = inttoptr i256 %addition_result28.i.i.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i.i.i, align 1
  %addition_result31.i.i.i = add i256 %memory_load_result.i55.i.i, 100
  %memory_store_pointer32.i.i.i = inttoptr i256 %addition_result31.i.i.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i.i.i, align 1
  %66 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i55.i.i, i256 4294967295)
  %exit_offset_shifted.i.i58.i.i = shl nuw nsw i256 %66, 64
  %exit_abi_data.i.i59.i.i = or i256 %exit_offset_shifted.i.i58.i.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i59.i.i)
  unreachable

fun_mul.exit.i.i:                                 ; preds = %if_join8.i.i.i, %fun_sub.exit.i.i
  %return_pointer.0.i.i.i952 = phi i256 [ 0, %fun_sub.exit.i.i ], [ %multiplication_result.i.i.i, %if_join8.i.i.i ]
  %comparison_result.i60.i.i = icmp eq i256 %memory_load_result262, 0
  br i1 %comparison_result.i60.i.i, label %fun_mul.exit83.i.i, label %if_join.i64.i.i

if_join.i64.i.i:                                  ; preds = %fun_mul.exit.i.i
  %division_result_non_zero.i62.i.i = udiv i256 -1, %memory_load_result262
  %comparison_result4.i63.i.i = icmp ult i256 %division_result_non_zero.i62.i.i, %65
  br i1 %comparison_result4.i63.i.i, label %if_main7.i65.i.i, label %if_join8.i69.i.i

if_main7.i65.i.i:                                 ; preds = %if_join.i64.i.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i69.i.i:                                 ; preds = %if_join.i64.i.i
  %multiplication_result.i66.i.i = mul i256 %65, %memory_load_result262
  %division_result_non_zero.i.i67.i.i = udiv i256 %multiplication_result.i66.i.i, %memory_load_result262
  %comparison_result14.not.i68.i.i = icmp eq i256 %division_result_non_zero.i.i67.i.i, %65
  br i1 %comparison_result14.not.i68.i.i, label %fun_mul.exit83.i.i, label %if_main19.i82.i.i

if_main19.i82.i.i:                                ; preds = %if_join8.i69.i.i
  %memory_load_result.i70.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i71.i.i = inttoptr i256 %memory_load_result.i70.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i71.i.i, align 1
  %addition_result.i72.i.i = add i256 %memory_load_result.i70.i.i, 4
  %memory_store_pointer23.i73.i.i = inttoptr i256 %addition_result.i72.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i73.i.i, align 1
  %addition_result25.i74.i.i = add i256 %memory_load_result.i70.i.i, 36
  %memory_store_pointer26.i75.i.i = inttoptr i256 %addition_result25.i74.i.i to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i75.i.i, align 1
  %addition_result28.i76.i.i = add i256 %memory_load_result.i70.i.i, 68
  %memory_store_pointer29.i77.i.i = inttoptr i256 %addition_result28.i76.i.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i77.i.i, align 1
  %addition_result31.i78.i.i = add i256 %memory_load_result.i70.i.i, 100
  %memory_store_pointer32.i79.i.i = inttoptr i256 %addition_result31.i78.i.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i79.i.i, align 1
  %67 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i70.i.i, i256 4294967295)
  %exit_offset_shifted.i.i80.i.i = shl nuw nsw i256 %67, 64
  %exit_abi_data.i.i81.i.i = or i256 %exit_offset_shifted.i.i80.i.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i81.i.i)
  unreachable

fun_mul.exit83.i.i:                               ; preds = %if_join8.i69.i.i, %fun_mul.exit.i.i
  %return_pointer.0.i61.i.i = phi i256 [ 0, %fun_mul.exit.i.i ], [ %multiplication_result.i66.i.i, %if_join8.i69.i.i ]
  %xor_result.i.i.i.i = xor i256 %return_pointer.0.i61.i.i, -1
  %comparison_result.i.i.i.i953 = icmp ugt i256 %return_pointer.0.i.i.i952, %xor_result.i.i.i.i
  br i1 %comparison_result.i.i.i.i953, label %if_main.i.i.i.i954, label %checked_add_uint256.exit.i.i.i

if_main.i.i.i.i954:                               ; preds = %fun_mul.exit83.i.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i.i.i:                   ; preds = %fun_mul.exit83.i.i
  %addition_result.i.i.i.i = add i256 %return_pointer.0.i61.i.i, %return_pointer.0.i.i.i952
  %comparison_result.i84.i.i = icmp ult i256 %addition_result.i.i.i.i, %return_pointer.0.i.i.i952
  br i1 %comparison_result.i84.i.i, label %if_main.i90.i.i, label %fun_current.exit.i

if_main.i90.i.i:                                  ; preds = %checked_add_uint256.exit.i.i.i
  %memory_load_result.i85.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i86.i.i = inttoptr i256 %memory_load_result.i85.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i86.i.i, align 1
  %addition_result.i87.i.i = add i256 %memory_load_result.i85.i.i, 4
  %memory_store_pointer7.i.i.i955 = inttoptr i256 %addition_result.i87.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i.i.i955, align 1
  %addition_result9.i.i.i956 = add i256 %memory_load_result.i85.i.i, 36
  %memory_store_pointer10.i.i.i957 = inttoptr i256 %addition_result9.i.i.i956 to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i.i.i957, align 1
  %addition_result12.i.i.i958 = add i256 %memory_load_result.i85.i.i, 68
  %memory_store_pointer13.i.i.i959 = inttoptr i256 %addition_result12.i.i.i958 to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i.i.i959, align 1
  %68 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i85.i.i, i256 4294967295)
  %exit_offset_shifted.i.i88.i.i = shl nuw nsw i256 %68, 64
  %exit_abi_data.i.i89.i.i = or i256 %exit_offset_shifted.i.i88.i.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i89.i.i)
  unreachable

fun_current.exit.i:                               ; preds = %checked_add_uint256.exit.i.i.i
  %division_result_non_zero.i92.i.i = udiv i256 %addition_result.i.i.i.i, 300
  %69 = icmp ult i256 %addition_result.i.i.i.i, 300
  br i1 %69, label %fun_mul.exit.i, label %if_join.i.i961

if_join.i.i961:                                   ; preds = %fun_current.exit.i
  %division_result_non_zero.i.i960 = udiv i256 -1, %division_result_non_zero.i92.i.i
  %comparison_result4.i.i = icmp ult i256 %division_result_non_zero.i.i960, %addition_result.i.i913
  br i1 %comparison_result4.i.i, label %if_main7.i.i, label %if_join8.i.i

if_main7.i.i:                                     ; preds = %if_join.i.i961
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i.i:                                     ; preds = %if_join.i.i961
  %multiplication_result.i.i = mul i256 %division_result_non_zero.i92.i.i, %addition_result.i.i913
  %division_result_non_zero.i.i.i = udiv i256 %multiplication_result.i.i, %division_result_non_zero.i92.i.i
  %comparison_result14.not.i.i = icmp eq i256 %division_result_non_zero.i.i.i, %addition_result.i.i913
  br i1 %comparison_result14.not.i.i, label %fun_mul.exit.i, label %if_main19.i.i

if_main19.i.i:                                    ; preds = %if_join8.i.i
  %memory_load_result.i61.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i62.i = inttoptr i256 %memory_load_result.i61.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i62.i, align 1
  %addition_result.i63.i = add i256 %memory_load_result.i61.i, 4
  %memory_store_pointer23.i.i962 = inttoptr i256 %addition_result.i63.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i.i962, align 1
  %addition_result25.i.i963 = add i256 %memory_load_result.i61.i, 36
  %memory_store_pointer26.i.i964 = inttoptr i256 %addition_result25.i.i963 to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i.i964, align 1
  %addition_result28.i.i = add i256 %memory_load_result.i61.i, 68
  %memory_store_pointer29.i.i = inttoptr i256 %addition_result28.i.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i.i, align 1
  %addition_result31.i.i = add i256 %memory_load_result.i61.i, 100
  %memory_store_pointer32.i.i = inttoptr i256 %addition_result31.i.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i.i, align 1
  %70 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i61.i, i256 4294967295)
  %exit_offset_shifted.i.i.i965 = shl nuw nsw i256 %70, 64
  %exit_abi_data.i.i.i966 = or i256 %exit_offset_shifted.i.i.i965, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i966)
  unreachable

fun_mul.exit.i:                                   ; preds = %if_join8.i.i, %fun_current.exit.i
  %return_pointer.0.i.i = phi i256 [ 0, %fun_current.exit.i ], [ %multiplication_result.i.i, %if_join8.i.i ]
  br i1 %comparison_result.i967, label %if_main.i978, label %if_join20.i

if_main.i978:                                     ; preds = %fun_mul.exit.i
  %memory_load_result.i968 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i969 = inttoptr i256 %memory_load_result.i968 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i969, align 1
  %addition_result.i970 = add i256 %memory_load_result.i968, 4
  %memory_store_pointer7.i971 = inttoptr i256 %addition_result.i970 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i971, align 1
  %addition_result9.i972 = add i256 %memory_load_result.i968, 36
  %memory_store_pointer10.i973 = inttoptr i256 %addition_result9.i972 to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer10.i973, align 1
  %addition_result12.i974 = add i256 %memory_load_result.i968, 68
  %memory_store_pointer13.i975 = inttoptr i256 %addition_result12.i974 to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer13.i975, align 1
  %71 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i968, i256 4294967295)
  %exit_offset_shifted.i.i976 = shl nuw nsw i256 %71, 64
  %exit_abi_data.i.i977 = or i256 %exit_offset_shifted.i.i976, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i977)
  unreachable

if_join20.i:                                      ; preds = %fun_mul.exit.i
  %comparison_result.i.i64.i = icmp ugt i256 %return_pointer.0.i.i, %xor_result.i.i.i
  br i1 %comparison_result.i.i64.i, label %if_main.i.i65.i, label %checked_add_uint256.exit.i.i

if_main.i.i65.i:                                  ; preds = %if_join20.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i.i:                     ; preds = %if_join20.i
  %addition_result.i.i66.i = add i256 %return_pointer.0.i.i, %addition_result28.i979
  %comparison_result.i67.i = icmp ult i256 %addition_result.i.i66.i, %return_pointer.0.i.i
  br i1 %comparison_result.i67.i, label %if_main.i.i985, label %fun_div.exit.i

if_main.i.i985:                                   ; preds = %checked_add_uint256.exit.i.i
  %memory_load_result.i68.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i69.i = inttoptr i256 %memory_load_result.i68.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i69.i, align 1
  %addition_result.i70.i = add i256 %memory_load_result.i68.i, 4
  %memory_store_pointer7.i.i980 = inttoptr i256 %addition_result.i70.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i.i980, align 1
  %addition_result9.i.i981 = add i256 %memory_load_result.i68.i, 36
  %memory_store_pointer10.i.i982 = inttoptr i256 %addition_result9.i.i981 to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i.i982, align 1
  %addition_result12.i.i = add i256 %memory_load_result.i68.i, 68
  %memory_store_pointer13.i.i = inttoptr i256 %addition_result12.i.i to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i.i, align 1
  %72 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i68.i, i256 4294967295)
  %exit_offset_shifted.i.i71.i983 = shl nuw nsw i256 %72, 64
  %exit_abi_data.i.i72.i984 = or i256 %exit_offset_shifted.i.i71.i983, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i72.i984)
  unreachable

fun_div.exit.i:                                   ; preds = %checked_add_uint256.exit.i.i
  %division_result_non_zero.i.i84.i = udiv i256 %addition_result.i.i66.i, %_2263
  %and_result.i986 = and i256 %division_result_non_zero.i.i84.i, 105312291668557186697918027683670432318895095400549111254310977535
  %storage_load.i987 = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i)
  %and_result38.i = and i256 %storage_load.i987, -105312291668557186697918027683670432318895095400549111254310977536
  %or_result.i = or i256 %and_result38.i, %and_result.i986
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i, i256 %or_result.i)
  store i256 54919857843691310904240101001871775513466943666296306094405906504622902841650, ptr addrspace(2) null, align 4294967296
  %gas_left.i.i988 = tail call i256 @llvm.syncvm.gasleft()
  %73 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i988, i256 4294967295)
  %abi_data_gas_shifted.i.i989 = shl nuw nsw i256 %73, 192
  %abi_data_add_system_call_marker.i.i990 = or i256 %abi_data_gas_shifted.i.i989, 904625751086426111047927909714404454142933102791518401696464687643217625088
  %system_request.i.i991 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i990, i256 32779, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i992 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i991, 1
  br i1 %system_request_result_status_code_boolean.i.i992, label %fun_scale.exit, label %system_request_error_block.i.i993

system_request_error_block.i.i993:                ; preds = %fun_div.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

fun_scale.exit:                                   ; preds = %fun_div.exit.i
  %system_request_result_abi_data.i.i994 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i991, 0
  %system_request_child_address.i.i995 = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i994, align 1
  %shift_left_non_overflow_result.i996 = shl i256 %system_request_child_address.i.i995, 216
  %or_result48.i = or i256 %shift_left_non_overflow_result.i996, %and_result.i986
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i, i256 %or_result48.i)
  %memory_load_result.i999 = load i256, ptr addrspace(1) %memory_load_pointer.i886, align 1
  %comparison_result.not.i1000 = icmp ugt i256 %memory_load_result.i999, %storemerge3181300
  br i1 %comparison_result.not.i1000, label %memory_array_index_access_contract_IERC20_dyn.1.exit1006, label %if_main.i1001

if_main.i1001:                                    ; preds = %fun_scale.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit1006: ; preds = %fun_scale.exit
  %memory_load_result.i1008 = load i256, ptr addrspace(1) %memory_load_pointer.i895, align 1
  %and_result.i1009 = and i256 %memory_load_result.i1008, 1461501637330902918203684832716283019655932542975
  store i256 %and_result.i1009, ptr addrspace(1) null, align 4294967296
  store i256 11, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i1010 = tail call i256 @llvm.syncvm.gasleft()
  %74 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i1010, i256 4294967295)
  %abi_data_gas_shifted.i.i1011 = shl nuw nsw i256 %74, 192
  %abi_data_add_system_call_marker.i.i1012 = or i256 %abi_data_gas_shifted.i.i1011, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i1013 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i1012, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i1014 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i1013, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i1014, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14878.exit, label %keccak256_failure_block.i.i1015

keccak256_failure_block.i.i1015:                  ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit1006
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14878.exit: ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit1006
  %keccak256_call_external_result_abi_data_pointer.i.i1016 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i1013, 0
  %keccak256_child_data.i.i1017 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i1016, align 1
  %memory_load_result.i1019 = load i256, ptr addrspace(1) %memory_load_pointer.i901, align 1
  %comparison_result.not.i1020 = icmp ugt i256 %memory_load_result.i1019, %storemerge3181300
  br i1 %comparison_result.not.i1020, label %memory_array_index_access_contract_IERC20_dyn.1.exit1026, label %if_main.i1021

if_main.i1021:                                    ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14878.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 50, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

memory_array_index_access_contract_IERC20_dyn.1.exit1026: ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14878.exit
  %memory_load_result277 = load i256, ptr addrspace(1) %memory_load_pointer261, align 1
  %memory_load_result.i.i1046 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %75 = icmp ugt i256 %memory_load_result.i.i1046, 18446744073709551551
  br i1 %75, label %if_main.i.i.i1047, label %read_from_storage_reference_type_struct_Data.exit.i1060

if_main.i.i.i1047:                                ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit1026
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

read_from_storage_reference_type_struct_Data.exit.i1060: ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit1026
  %addition_result.i.i.i1048 = add i256 %memory_load_result.i.i1046, 64
  store i256 %addition_result.i.i.i1048, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %storage_load.i.i1049 = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i1017)
  %and_result.i.i1050 = and i256 %storage_load.i.i1049, 105312291668557186697918027683670432318895095400549111254310977535
  %memory_store_pointer.i.i1051 = inttoptr i256 %memory_load_result.i.i1046 to ptr addrspace(1)
  store i256 %and_result.i.i1050, ptr addrspace(1) %memory_store_pointer.i.i1051, align 1
  %shift_right_non_overflow_result.i.i1052 = lshr i256 %storage_load.i.i1049, 216
  %addition_result.i.i1053 = add i256 %memory_load_result.i.i1046, 32
  %memory_store_pointer8.i.i1054 = inttoptr i256 %addition_result.i.i1053 to ptr addrspace(1)
  store i256 %shift_right_non_overflow_result.i.i1052, ptr addrspace(1) %memory_store_pointer8.i.i1054, align 1
  store i256 54919857843691310904240101001871775513466943666296306094405906504622902841650, ptr addrspace(2) null, align 4294967296
  %gas_left.i.i.i1055 = tail call i256 @llvm.syncvm.gasleft()
  %76 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i.i1055, i256 4294967295)
  %abi_data_gas_shifted.i.i.i1056 = shl nuw nsw i256 %76, 192
  %abi_data_add_system_call_marker.i.i.i1057 = or i256 %abi_data_gas_shifted.i.i.i1056, 904625751086426111047927909714404454142933102791518401696464687643217625088
  %system_request.i.i.i1058 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i.i1057, i256 32779, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i.i1059 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i1058, 1
  br i1 %system_request_result_status_code_boolean.i.i.i1059, label %__system_request.exit.i.i1065, label %system_request_error_block.i.i.i1061

system_request_error_block.i.i.i1061:             ; preds = %read_from_storage_reference_type_struct_Data.exit.i1060
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i.i1065:                    ; preds = %read_from_storage_reference_type_struct_Data.exit.i1060
  %system_request_result_abi_data.i.i.i1062 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i1058, 0
  %system_request_child_address.i.i.i1063 = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i.i1062, align 1
  %comparison_result.i.i.i1064 = icmp ult i256 %system_request_child_address.i.i.i1063, %shift_right_non_overflow_result.i.i1052
  br i1 %comparison_result.i.i.i1064, label %if_main.i.i60.i1076, label %fun_sub.exit.i.i1081

if_main.i.i60.i1076:                              ; preds = %__system_request.exit.i.i1065
  %memory_load_result.i.i.i1066 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i.i1067 = inttoptr i256 %memory_load_result.i.i.i1066 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i.i.i1067, align 1
  %addition_result.i.i59.i1068 = add i256 %memory_load_result.i.i.i1066, 4
  %memory_store_pointer5.i.i.i1069 = inttoptr i256 %addition_result.i.i59.i1068 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5.i.i.i1069, align 1
  %addition_result7.i.i.i1070 = add i256 %memory_load_result.i.i.i1066, 36
  %memory_store_pointer8.i.i.i1071 = inttoptr i256 %addition_result7.i.i.i1070 to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8.i.i.i1071, align 1
  %addition_result10.i.i.i1072 = add i256 %memory_load_result.i.i.i1066, 68
  %memory_store_pointer11.i.i.i1073 = inttoptr i256 %addition_result10.i.i.i1072 to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11.i.i.i1073, align 1
  %77 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i.i1066, i256 4294967295)
  %exit_offset_shifted.i.i.i.i1074 = shl nuw nsw i256 %77, 64
  %exit_abi_data.i.i.i.i1075 = or i256 %exit_offset_shifted.i.i.i.i1074, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i.i1075)
  unreachable

fun_sub.exit.i.i1081:                             ; preds = %__system_request.exit.i.i1065
  %subtraction_result.i.i.i1077 = sub i256 %system_request_child_address.i.i.i1063, %shift_right_non_overflow_result.i.i1052
  %78 = tail call i256 @llvm.umin.i256(i256 %subtraction_result.i.i.i1077, i256 300)
  %memory_load_result39.i.i1078 = load i256, ptr addrspace(1) %memory_store_pointer.i.i1051, align 1
  %and_result40.i.i1079 = and i256 %memory_load_result39.i.i1078, 105312291668557186697918027683670432318895095400549111254310977535
  %comparison_result.i54.i.i1080 = icmp eq i256 %and_result40.i.i1079, 0
  br i1 %comparison_result.i54.i.i1080, label %fun_mul.exit.i.i1102, label %if_join8.i.i.i1086

if_join8.i.i.i1086:                               ; preds = %fun_sub.exit.i.i1081
  %subtraction_result.i.i1082 = sub nuw nsw i256 300, %78
  %multiplication_result.i.i.i1083 = mul nsw i256 %and_result40.i.i1079, %subtraction_result.i.i1082
  %division_result_non_zero.i.i.i.i1084 = udiv i256 %multiplication_result.i.i.i1083, %and_result40.i.i1079
  %comparison_result14.not.i.i.i1085 = icmp eq i256 %division_result_non_zero.i.i.i.i1084, %subtraction_result.i.i1082
  br i1 %comparison_result14.not.i.i.i1085, label %fun_mul.exit.i.i1102, label %if_main19.i.i.i1099

if_main19.i.i.i1099:                              ; preds = %if_join8.i.i.i1086
  %memory_load_result.i55.i.i1087 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i56.i.i1088 = inttoptr i256 %memory_load_result.i55.i.i1087 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i56.i.i1088, align 1
  %addition_result.i57.i.i1089 = add i256 %memory_load_result.i55.i.i1087, 4
  %memory_store_pointer23.i.i.i1090 = inttoptr i256 %addition_result.i57.i.i1089 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i.i.i1090, align 1
  %addition_result25.i.i.i1091 = add i256 %memory_load_result.i55.i.i1087, 36
  %memory_store_pointer26.i.i.i1092 = inttoptr i256 %addition_result25.i.i.i1091 to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i.i.i1092, align 1
  %addition_result28.i.i.i1093 = add i256 %memory_load_result.i55.i.i1087, 68
  %memory_store_pointer29.i.i.i1094 = inttoptr i256 %addition_result28.i.i.i1093 to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i.i.i1094, align 1
  %addition_result31.i.i.i1095 = add i256 %memory_load_result.i55.i.i1087, 100
  %memory_store_pointer32.i.i.i1096 = inttoptr i256 %addition_result31.i.i.i1095 to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i.i.i1096, align 1
  %79 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i55.i.i1087, i256 4294967295)
  %exit_offset_shifted.i.i58.i.i1097 = shl nuw nsw i256 %79, 64
  %exit_abi_data.i.i59.i.i1098 = or i256 %exit_offset_shifted.i.i58.i.i1097, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i59.i.i1098)
  unreachable

fun_mul.exit.i.i1102:                             ; preds = %if_join8.i.i.i1086, %fun_sub.exit.i.i1081
  %return_pointer.0.i.i.i1100 = phi i256 [ 0, %fun_sub.exit.i.i1081 ], [ %multiplication_result.i.i.i1083, %if_join8.i.i.i1086 ]
  %comparison_result.i60.i.i1101 = icmp eq i256 %memory_load_result277, 0
  br i1 %comparison_result.i60.i.i1101, label %fun_mul.exit83.i.i1127, label %if_join.i64.i.i1105

if_join.i64.i.i1105:                              ; preds = %fun_mul.exit.i.i1102
  %division_result_non_zero.i62.i.i1103 = udiv i256 -1, %memory_load_result277
  %comparison_result4.i63.i.i1104 = icmp ult i256 %division_result_non_zero.i62.i.i1103, %78
  br i1 %comparison_result4.i63.i.i1104, label %if_main7.i65.i.i1106, label %if_join8.i69.i.i1110

if_main7.i65.i.i1106:                             ; preds = %if_join.i64.i.i1105
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i69.i.i1110:                             ; preds = %if_join.i64.i.i1105
  %multiplication_result.i66.i.i1107 = mul i256 %78, %memory_load_result277
  %division_result_non_zero.i.i67.i.i1108 = udiv i256 %multiplication_result.i66.i.i1107, %memory_load_result277
  %comparison_result14.not.i68.i.i1109 = icmp eq i256 %division_result_non_zero.i.i67.i.i1108, %78
  br i1 %comparison_result14.not.i68.i.i1109, label %fun_mul.exit83.i.i1127, label %if_main19.i82.i.i1123

if_main19.i82.i.i1123:                            ; preds = %if_join8.i69.i.i1110
  %memory_load_result.i70.i.i1111 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i71.i.i1112 = inttoptr i256 %memory_load_result.i70.i.i1111 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i71.i.i1112, align 1
  %addition_result.i72.i.i1113 = add i256 %memory_load_result.i70.i.i1111, 4
  %memory_store_pointer23.i73.i.i1114 = inttoptr i256 %addition_result.i72.i.i1113 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i73.i.i1114, align 1
  %addition_result25.i74.i.i1115 = add i256 %memory_load_result.i70.i.i1111, 36
  %memory_store_pointer26.i75.i.i1116 = inttoptr i256 %addition_result25.i74.i.i1115 to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i75.i.i1116, align 1
  %addition_result28.i76.i.i1117 = add i256 %memory_load_result.i70.i.i1111, 68
  %memory_store_pointer29.i77.i.i1118 = inttoptr i256 %addition_result28.i76.i.i1117 to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i77.i.i1118, align 1
  %addition_result31.i78.i.i1119 = add i256 %memory_load_result.i70.i.i1111, 100
  %memory_store_pointer32.i79.i.i1120 = inttoptr i256 %addition_result31.i78.i.i1119 to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i79.i.i1120, align 1
  %80 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i70.i.i1111, i256 4294967295)
  %exit_offset_shifted.i.i80.i.i1121 = shl nuw nsw i256 %80, 64
  %exit_abi_data.i.i81.i.i1122 = or i256 %exit_offset_shifted.i.i80.i.i1121, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i81.i.i1122)
  unreachable

fun_mul.exit83.i.i1127:                           ; preds = %if_join8.i69.i.i1110, %fun_mul.exit.i.i1102
  %return_pointer.0.i61.i.i1124 = phi i256 [ 0, %fun_mul.exit.i.i1102 ], [ %multiplication_result.i66.i.i1107, %if_join8.i69.i.i1110 ]
  %xor_result.i.i.i.i1125 = xor i256 %return_pointer.0.i61.i.i1124, -1
  %comparison_result.i.i.i.i1126 = icmp ugt i256 %return_pointer.0.i.i.i1100, %xor_result.i.i.i.i1125
  br i1 %comparison_result.i.i.i.i1126, label %if_main.i.i.i.i1128, label %checked_add_uint256.exit.i.i.i1131

if_main.i.i.i.i1128:                              ; preds = %fun_mul.exit83.i.i1127
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i.i.i1131:               ; preds = %fun_mul.exit83.i.i1127
  %addition_result.i.i.i.i1129 = add i256 %return_pointer.0.i61.i.i1124, %return_pointer.0.i.i.i1100
  %comparison_result.i84.i.i1130 = icmp ult i256 %addition_result.i.i.i.i1129, %return_pointer.0.i.i.i1100
  br i1 %comparison_result.i84.i.i1130, label %if_main.i90.i.i1142, label %fun_current.exit.i1144

if_main.i90.i.i1142:                              ; preds = %checked_add_uint256.exit.i.i.i1131
  %memory_load_result.i85.i.i1132 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i86.i.i1133 = inttoptr i256 %memory_load_result.i85.i.i1132 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i86.i.i1133, align 1
  %addition_result.i87.i.i1134 = add i256 %memory_load_result.i85.i.i1132, 4
  %memory_store_pointer7.i.i.i1135 = inttoptr i256 %addition_result.i87.i.i1134 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i.i.i1135, align 1
  %addition_result9.i.i.i1136 = add i256 %memory_load_result.i85.i.i1132, 36
  %memory_store_pointer10.i.i.i1137 = inttoptr i256 %addition_result9.i.i.i1136 to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i.i.i1137, align 1
  %addition_result12.i.i.i1138 = add i256 %memory_load_result.i85.i.i1132, 68
  %memory_store_pointer13.i.i.i1139 = inttoptr i256 %addition_result12.i.i.i1138 to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i.i.i1139, align 1
  %81 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i85.i.i1132, i256 4294967295)
  %exit_offset_shifted.i.i88.i.i1140 = shl nuw nsw i256 %81, 64
  %exit_abi_data.i.i89.i.i1141 = or i256 %exit_offset_shifted.i.i88.i.i1140, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i89.i.i1141)
  unreachable

fun_current.exit.i1144:                           ; preds = %checked_add_uint256.exit.i.i.i1131
  %division_result_non_zero.i92.i.i1143 = udiv i256 %addition_result.i.i.i.i1129, 300
  %82 = icmp ult i256 %addition_result.i.i.i.i1129, 300
  br i1 %82, label %if_join20.i1182, label %if_join.i.i1147

if_join.i.i1147:                                  ; preds = %fun_current.exit.i1144
  %division_result_non_zero.i.i1145 = udiv i256 -1, %division_result_non_zero.i92.i.i1143
  %comparison_result4.i.i1146 = icmp ult i256 %division_result_non_zero.i.i1145, %addition_result.i.i913
  br i1 %comparison_result4.i.i1146, label %if_main7.i.i1148, label %if_join8.i.i1152

if_main7.i.i1148:                                 ; preds = %if_join.i.i1147
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i.i1152:                                 ; preds = %if_join.i.i1147
  %multiplication_result.i.i1149 = mul i256 %division_result_non_zero.i92.i.i1143, %addition_result.i.i913
  %division_result_non_zero.i.i.i1150 = udiv i256 %multiplication_result.i.i1149, %division_result_non_zero.i92.i.i1143
  %comparison_result14.not.i.i1151 = icmp eq i256 %division_result_non_zero.i.i.i1150, %addition_result.i.i913
  br i1 %comparison_result14.not.i.i1151, label %if_join20.i1182, label %if_main19.i.i1165

if_main19.i.i1165:                                ; preds = %if_join8.i.i1152
  %memory_load_result.i61.i1153 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i62.i1154 = inttoptr i256 %memory_load_result.i61.i1153 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i62.i1154, align 1
  %addition_result.i63.i1155 = add i256 %memory_load_result.i61.i1153, 4
  %memory_store_pointer23.i.i1156 = inttoptr i256 %addition_result.i63.i1155 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i.i1156, align 1
  %addition_result25.i.i1157 = add i256 %memory_load_result.i61.i1153, 36
  %memory_store_pointer26.i.i1158 = inttoptr i256 %addition_result25.i.i1157 to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i.i1158, align 1
  %addition_result28.i.i1159 = add i256 %memory_load_result.i61.i1153, 68
  %memory_store_pointer29.i.i1160 = inttoptr i256 %addition_result28.i.i1159 to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i.i1160, align 1
  %addition_result31.i.i1161 = add i256 %memory_load_result.i61.i1153, 100
  %memory_store_pointer32.i.i1162 = inttoptr i256 %addition_result31.i.i1161 to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i.i1162, align 1
  %83 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i61.i1153, i256 4294967295)
  %exit_offset_shifted.i.i.i1163 = shl nuw nsw i256 %83, 64
  %exit_abi_data.i.i.i1164 = or i256 %exit_offset_shifted.i.i.i1163, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i1164)
  unreachable

if_join20.i1182:                                  ; preds = %fun_current.exit.i1144, %if_join8.i.i1152
  %return_pointer.0.i.i1166 = phi i256 [ 0, %fun_current.exit.i1144 ], [ %multiplication_result.i.i1149, %if_join8.i.i1152 ]
  %comparison_result.i.i64.i1181 = icmp ugt i256 %return_pointer.0.i.i1166, %xor_result.i.i.i
  br i1 %comparison_result.i.i64.i1181, label %if_main.i.i65.i1183, label %checked_add_uint256.exit.i.i1187

if_main.i.i65.i1183:                              ; preds = %if_join20.i1182
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i.i1187:                 ; preds = %if_join20.i1182
  %addition_result.i.i66.i1185 = add i256 %return_pointer.0.i.i1166, %addition_result28.i979
  %comparison_result.i67.i1186 = icmp ult i256 %addition_result.i.i66.i1185, %return_pointer.0.i.i1166
  br i1 %comparison_result.i67.i1186, label %if_main.i.i1198, label %fun_div.exit.i1209

if_main.i.i1198:                                  ; preds = %checked_add_uint256.exit.i.i1187
  %memory_load_result.i68.i1188 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i69.i1189 = inttoptr i256 %memory_load_result.i68.i1188 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i69.i1189, align 1
  %addition_result.i70.i1190 = add i256 %memory_load_result.i68.i1188, 4
  %memory_store_pointer7.i.i1191 = inttoptr i256 %addition_result.i70.i1190 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i.i1191, align 1
  %addition_result9.i.i1192 = add i256 %memory_load_result.i68.i1188, 36
  %memory_store_pointer10.i.i1193 = inttoptr i256 %addition_result9.i.i1192 to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i.i1193, align 1
  %addition_result12.i.i1194 = add i256 %memory_load_result.i68.i1188, 68
  %memory_store_pointer13.i.i1195 = inttoptr i256 %addition_result12.i.i1194 to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i.i1195, align 1
  %84 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i68.i1188, i256 4294967295)
  %exit_offset_shifted.i.i71.i1196 = shl nuw nsw i256 %84, 64
  %exit_abi_data.i.i72.i1197 = or i256 %exit_offset_shifted.i.i71.i1196, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i72.i1197)
  unreachable

fun_div.exit.i1209:                               ; preds = %checked_add_uint256.exit.i.i1187
  %division_result_non_zero.i.i84.i1199 = udiv i256 %addition_result.i.i66.i1185, %_2263
  %and_result.i1200 = and i256 %division_result_non_zero.i.i84.i1199, 105312291668557186697918027683670432318895095400549111254310977535
  %storage_load.i1201 = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i1017)
  %and_result38.i1202 = and i256 %storage_load.i1201, -105312291668557186697918027683670432318895095400549111254310977536
  %or_result.i1203 = or i256 %and_result38.i1202, %and_result.i1200
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i1017, i256 %or_result.i1203)
  store i256 54919857843691310904240101001871775513466943666296306094405906504622902841650, ptr addrspace(2) null, align 4294967296
  %gas_left.i.i1204 = tail call i256 @llvm.syncvm.gasleft()
  %85 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i1204, i256 4294967295)
  %abi_data_gas_shifted.i.i1205 = shl nuw nsw i256 %85, 192
  %abi_data_add_system_call_marker.i.i1206 = or i256 %abi_data_gas_shifted.i.i1205, 904625751086426111047927909714404454142933102791518401696464687643217625088
  %system_request.i.i1207 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i1206, i256 32779, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i1208 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i1207, 1
  br i1 %system_request_result_status_code_boolean.i.i1208, label %fun_scale.exit1216, label %system_request_error_block.i.i1210

system_request_error_block.i.i1210:               ; preds = %fun_div.exit.i1209
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

fun_scale.exit1216:                               ; preds = %fun_div.exit.i1209
  %system_request_result_abi_data.i.i1211 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i1207, 0
  %system_request_child_address.i.i1212 = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i1211, align 1
  %shift_left_non_overflow_result.i1213 = shl i256 %system_request_child_address.i.i1212, 216
  %or_result48.i1214 = or i256 %shift_left_non_overflow_result.i1213, %and_result.i1200
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i1017, i256 %or_result48.i1214)
  %addition_result.i1219 = add nuw i256 %storemerge3181300, 1
  %comparison_result251 = icmp ult i256 %addition_result.i1219, %value1158
  br i1 %comparison_result251, label %for_body246, label %if_join244

event_failure_block:                              ; preds = %fun_mint.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

event_join_block:                                 ; preds = %fun_mint.exit
  tail call void @llvm.syncvm.sstore(i256 5, i256 1)
  %memory_load_result298 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i1224 = inttoptr i256 %memory_load_result298 to ptr addrspace(1)
  store i256 %var_fairSupply286, ptr addrspace(1) %memory_store_pointer.i1224, align 1
  %86 = tail call i256 @llvm.umin.i256(i256 %memory_load_result298, i256 4294967295)
  %exit_offset_shifted.i = shl nuw nsw i256 %86, 64
  %exit_abi_data_add_heap_auxiliary_marker.i = or i256 %exit_offset_shifted.i, 2535301200456458802993406410752
  tail call void @llvm.syncvm.return(i256 %exit_abi_data_add_heap_auxiliary_marker.i)
  unreachable
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc void @fun_transfer(i256 %0, i256 %1, i256 %2) unnamed_addr #6 personality ptr @__personality {
entry:
  %and_result = and i256 %0, 1461501637330902918203684832716283019655932542975
  %comparison_result = icmp eq i256 %and_result, 0
  br i1 %comparison_result, label %if_main, label %if_join

if_main:                                          ; preds = %entry
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer, align 1
  %addition_result = add i256 %memory_load_result, 4
  %memory_store_pointer11 = inttoptr i256 %addition_result to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer11, align 1
  %addition_result13 = add i256 %memory_load_result, 36
  %memory_store_pointer14 = inttoptr i256 %addition_result13 to ptr addrspace(1)
  store i256 37, ptr addrspace(1) %memory_store_pointer14, align 1
  %addition_result16 = add i256 %memory_load_result, 68
  %memory_store_pointer17 = inttoptr i256 %addition_result16 to ptr addrspace(1)
  store i256 31354931781638678607228669297131712859107492772550336241160036866987736981860, ptr addrspace(1) %memory_store_pointer17, align 1
  %addition_result19 = add i256 %memory_load_result, 100
  %memory_store_pointer20 = inttoptr i256 %addition_result19 to ptr addrspace(1)
  store i256 45433405612597180762055095701412804886438245671210399661410036396145969725440, ptr addrspace(1) %memory_store_pointer20, align 1
  %3 = tail call i256 @llvm.umin.i256(i256 %memory_load_result, i256 4294967295)
  %exit_offset_shifted.i = shl nuw nsw i256 %3, 64
  %exit_abi_data.i = or i256 %exit_offset_shifted.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i)
  unreachable

if_join:                                          ; preds = %entry
  %and_result24 = and i256 %1, 1461501637330902918203684832716283019655932542975
  %comparison_result26.not = icmp eq i256 %and_result24, 0
  br i1 %comparison_result26.not, label %if_main.i, label %require_helper_stringliteral_0557.exit

if_main.i:                                        ; preds = %if_join
  %memory_load_result.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i, align 1
  %addition_result.i = add i256 %memory_load_result.i, 4
  %memory_store_pointer4.i = inttoptr i256 %addition_result.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i, align 1
  %addition_result6.i = add i256 %memory_load_result.i, 36
  %memory_store_pointer7.i = inttoptr i256 %addition_result6.i to ptr addrspace(1)
  store i256 35, ptr addrspace(1) %memory_store_pointer7.i, align 1
  %addition_result9.i = add i256 %memory_load_result.i, 68
  %memory_store_pointer10.i = inttoptr i256 %addition_result9.i to ptr addrspace(1)
  store i256 31354931781638678607228669297131712859126084785867252355217498662940140921970, ptr addrspace(1) %memory_store_pointer10.i, align 1
  %addition_result12.i = add i256 %memory_load_result.i, 100
  %memory_store_pointer13.i = inttoptr i256 %addition_result12.i to ptr addrspace(1)
  store i256 45887578820189300338443374388718498632482616163288499555830078344056365121536, ptr addrspace(1) %memory_store_pointer13.i, align 1
  %4 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i, i256 4294967295)
  %exit_offset_shifted.i.i = shl nuw nsw i256 %4, 64
  %exit_abi_data.i.i = or i256 %exit_offset_shifted.i.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i)
  unreachable

require_helper_stringliteral_0557.exit:           ; preds = %if_join
  store i256 %and_result, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %5 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %5, 192
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_gas_shifted.i.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit, label %keccak256_failure_block.i.i

keccak256_failure_block.i.i:                      ; preds = %require_helper_stringliteral_0557.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit: ; preds = %require_helper_stringliteral_0557.exit
  %keccak256_call_external_result_abi_data_pointer.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 0
  %keccak256_child_data.i.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i, align 1
  %storage_load = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i)
  %comparison_result33.not = icmp ult i256 %storage_load, %2
  br i1 %comparison_result33.not, label %if_main.i79, label %require_helper_stringliteral_4107.exit

if_main.i79:                                      ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit
  %memory_load_result.i67 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i68 = inttoptr i256 %memory_load_result.i67 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i68, align 1
  %addition_result.i69 = add i256 %memory_load_result.i67, 4
  %memory_store_pointer4.i70 = inttoptr i256 %addition_result.i69 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i70, align 1
  %addition_result6.i71 = add i256 %memory_load_result.i67, 36
  %memory_store_pointer7.i72 = inttoptr i256 %addition_result6.i71 to ptr addrspace(1)
  store i256 38, ptr addrspace(1) %memory_store_pointer7.i72, align 1
  %addition_result9.i73 = add i256 %memory_load_result.i67, 68
  %memory_store_pointer10.i74 = inttoptr i256 %addition_result9.i73 to ptr addrspace(1)
  store i256 31354931781638678607228669297131712859100820671745083778533502622993977909346, ptr addrspace(1) %memory_store_pointer10.i74, align 1
  %addition_result12.i75 = add i256 %memory_load_result.i67, 100
  %memory_store_pointer13.i76 = inttoptr i256 %addition_result12.i75 to ptr addrspace(1)
  store i256 44065838241030143116324720188876985940908656145555552347773292252211112312832, ptr addrspace(1) %memory_store_pointer13.i76, align 1
  %6 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i67, i256 4294967295)
  %exit_offset_shifted.i.i77 = shl nuw nsw i256 %6, 64
  %exit_abi_data.i.i78 = or i256 %exit_offset_shifted.i.i77, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i78)
  unreachable

require_helper_stringliteral_4107.exit:           ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit
  store i256 %and_result, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i81 = tail call i256 @llvm.syncvm.gasleft()
  %7 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i81, i256 4294967295)
  %abi_data_gas_shifted.i.i82 = shl nuw nsw i256 %7, 192
  %abi_data_add_system_call_marker.i.i83 = or i256 %abi_data_gas_shifted.i.i82, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i84 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i83, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i85 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i84, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i85, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit89, label %keccak256_failure_block.i.i86

keccak256_failure_block.i.i86:                    ; preds = %require_helper_stringliteral_4107.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit89: ; preds = %require_helper_stringliteral_4107.exit
  %subtraction_result39 = sub i256 %storage_load, %2
  %keccak256_call_external_result_abi_data_pointer.i.i87 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i84, 0
  %keccak256_child_data.i.i88 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i87, align 1
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i88, i256 %subtraction_result39)
  store i256 %and_result24, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i91 = tail call i256 @llvm.syncvm.gasleft()
  %8 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i91, i256 4294967295)
  %abi_data_gas_shifted.i.i92 = shl nuw nsw i256 %8, 192
  %abi_data_add_system_call_marker.i.i93 = or i256 %abi_data_gas_shifted.i.i92, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i94 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i93, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i95 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i94, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i95, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit99, label %keccak256_failure_block.i.i96

keccak256_failure_block.i.i96:                    ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit89
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit99: ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit89
  %keccak256_call_external_result_abi_data_pointer.i.i97 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i94, 0
  %keccak256_child_data.i.i98 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i97, align 1
  %storage_load46 = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i98)
  %xor_result.i = xor i256 %2, -1
  %comparison_result.i100 = icmp ugt i256 %storage_load46, %xor_result.i
  br i1 %comparison_result.i100, label %if_main.i101, label %checked_add_uint256.exit

if_main.i101:                                     ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit99
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit:                         ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit99
  %addition_result.i102 = add i256 %storage_load46, %2
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i98, i256 %addition_result.i102)
  %memory_load_result48 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i104 = inttoptr i256 %memory_load_result48 to ptr addrspace(1)
  store i256 %2, ptr addrspace(1) %memory_store_pointer.i104, align 1
  %gas_left = tail call i256 @llvm.syncvm.gasleft()
  %9 = tail call i256 @llvm.umin.i256(i256 %memory_load_result48, i256 4294967295)
  %10 = tail call i256 @llvm.umin.i256(i256 %gas_left, i256 4294967295)
  %abi_data_input_offset_shifted = shl nuw nsw i256 %9, 64
  %abi_data_gas_shifted = shl nuw nsw i256 %10, 192
  %abi_data_offset_and_length = or i256 %abi_data_gas_shifted, %abi_data_input_offset_shifted
  %abi_data_add_system_call_marker = or i256 %abi_data_offset_and_length, 904625697166532776746648320380374280103671757735618107014721178055227736064
  %event_writer_call_external = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker, i256 32781, i256 3, i256 -15402802100530019096323380498944738953123845089667699673314898783681816316945, i256 %and_result, i256 %and_result24, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %event_writer_external_result_status_code_boolean = extractvalue { ptr addrspace(3), i1 } %event_writer_call_external, 1
  br i1 %event_writer_external_result_status_code_boolean, label %event_join_block, label %event_failure_block

event_failure_block:                              ; preds = %checked_add_uint256.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

event_join_block:                                 ; preds = %checked_add_uint256.exit
  ret void
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc void @fun_mint(i256 %0, i256 %1) unnamed_addr #6 personality ptr @__personality {
entry:
  %and_result = and i256 %0, 1461501637330902918203684832716283019655932542975
  %comparison_result = icmp eq i256 %and_result, 0
  br i1 %comparison_result, label %if_main, label %if_join

if_main:                                          ; preds = %entry
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer, align 1
  %addition_result = add i256 %memory_load_result, 4
  %memory_store_pointer10 = inttoptr i256 %addition_result to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer10, align 1
  %addition_result12 = add i256 %memory_load_result, 36
  %memory_store_pointer13 = inttoptr i256 %addition_result12 to ptr addrspace(1)
  store i256 31, ptr addrspace(1) %memory_store_pointer13, align 1
  %addition_result15 = add i256 %memory_load_result, 68
  %memory_store_pointer16 = inttoptr i256 %addition_result15 to ptr addrspace(1)
  store i256 31354931781638678563069525067809233856775101976563302031013534919694566519552, ptr addrspace(1) %memory_store_pointer16, align 1
  %2 = tail call i256 @llvm.umin.i256(i256 %memory_load_result, i256 4294967295)
  %exit_offset_shifted.i = shl nuw nsw i256 %2, 64
  %exit_abi_data.i = or i256 %exit_offset_shifted.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i)
  unreachable

if_join:                                          ; preds = %entry
  %storage_load = tail call i256 @llvm.syncvm.sload(i256 2)
  %xor_result.i = xor i256 %1, -1
  %comparison_result.i = icmp ugt i256 %storage_load, %xor_result.i
  br i1 %comparison_result.i, label %if_main.i, label %checked_add_uint256.exit

if_main.i:                                        ; preds = %if_join
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit:                         ; preds = %if_join
  %addition_result.i = add i256 %storage_load, %1
  tail call void @llvm.syncvm.sstore(i256 2, i256 %addition_result.i)
  store i256 %and_result, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %3 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %3, 192
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_gas_shifted.i.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit, label %keccak256_failure_block.i.i

keccak256_failure_block.i.i:                      ; preds = %checked_add_uint256.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit: ; preds = %checked_add_uint256.exit
  %keccak256_call_external_result_abi_data_pointer.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 0
  %keccak256_child_data.i.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i, align 1
  %storage_load22 = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i)
  %comparison_result.i37 = icmp ugt i256 %storage_load22, %xor_result.i
  br i1 %comparison_result.i37, label %if_main.i38, label %checked_add_uint256.exit40

if_main.i38:                                      ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit40:                       ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit
  %addition_result.i39 = add i256 %storage_load22, %1
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i, i256 %addition_result.i39)
  %memory_load_result25 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer28 = inttoptr i256 %memory_load_result25 to ptr addrspace(1)
  store i256 %1, ptr addrspace(1) %memory_store_pointer28, align 1
  %gas_left = tail call i256 @llvm.syncvm.gasleft()
  %4 = tail call i256 @llvm.umin.i256(i256 %memory_load_result25, i256 4294967295)
  %5 = tail call i256 @llvm.umin.i256(i256 %gas_left, i256 4294967295)
  %abi_data_input_offset_shifted = shl nuw nsw i256 %4, 64
  %abi_data_gas_shifted = shl nuw nsw i256 %5, 192
  %abi_data_offset_and_length = or i256 %abi_data_gas_shifted, %abi_data_input_offset_shifted
  %abi_data_add_system_call_marker = or i256 %abi_data_offset_and_length, 904625697166532776746648320380374280103671757735618107014721178055227736064
  %event_writer_call_external = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker, i256 32781, i256 3, i256 -15402802100530019096323380498944738953123845089667699673314898783681816316945, i256 0, i256 %and_result, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %event_writer_external_result_status_code_boolean = extractvalue { ptr addrspace(3), i1 } %event_writer_call_external, 1
  br i1 %event_writer_external_result_status_code_boolean, label %event_join_block, label %event_failure_block

event_failure_block:                              ; preds = %checked_add_uint256.exit40
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

event_join_block:                                 ; preds = %checked_add_uint256.exit40
  ret void
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc void @fun_burn(i256 %0, i256 %1) unnamed_addr #6 personality ptr @__personality {
entry:
  %and_result = and i256 %0, 1461501637330902918203684832716283019655932542975
  %comparison_result = icmp eq i256 %and_result, 0
  br i1 %comparison_result, label %if_main, label %if_join

if_main:                                          ; preds = %entry
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer, align 1
  %addition_result = add i256 %memory_load_result, 4
  %memory_store_pointer10 = inttoptr i256 %addition_result to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer10, align 1
  %addition_result12 = add i256 %memory_load_result, 36
  %memory_store_pointer13 = inttoptr i256 %addition_result12 to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer13, align 1
  %addition_result15 = add i256 %memory_load_result, 68
  %memory_store_pointer16 = inttoptr i256 %addition_result15 to ptr addrspace(1)
  store i256 31354931781638678494316026001340845558170976982936511063842609339963588896115, ptr addrspace(1) %memory_store_pointer16, align 1
  %addition_result18 = add i256 %memory_load_result, 100
  %memory_store_pointer19 = inttoptr i256 %addition_result18 to ptr addrspace(1)
  store i256 52015977587075634662932278421871521105961125924018222127100086566054726205440, ptr addrspace(1) %memory_store_pointer19, align 1
  %2 = tail call i256 @llvm.umin.i256(i256 %memory_load_result, i256 4294967295)
  %exit_offset_shifted.i = shl nuw nsw i256 %2, 64
  %exit_abi_data.i = or i256 %exit_offset_shifted.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i)
  unreachable

if_join:                                          ; preds = %entry
  store i256 %and_result, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %3 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %3, 192
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_gas_shifted.i.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit, label %keccak256_failure_block.i.i

keccak256_failure_block.i.i:                      ; preds = %if_join
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit: ; preds = %if_join
  %keccak256_call_external_result_abi_data_pointer.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 0
  %keccak256_child_data.i.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i, align 1
  %storage_load = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i)
  %comparison_result24 = icmp ult i256 %storage_load, %1
  br i1 %comparison_result24, label %if_main27, label %if_join28

if_main27:                                        ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit
  %memory_load_result29 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer36 = inttoptr i256 %memory_load_result29 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer36, align 1
  %addition_result38 = add i256 %memory_load_result29, 4
  %memory_store_pointer39 = inttoptr i256 %addition_result38 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer39, align 1
  %addition_result41 = add i256 %memory_load_result29, 36
  %memory_store_pointer42 = inttoptr i256 %addition_result41 to ptr addrspace(1)
  store i256 34, ptr addrspace(1) %memory_store_pointer42, align 1
  %addition_result44 = add i256 %memory_load_result29, 68
  %memory_store_pointer45 = inttoptr i256 %addition_result44 to ptr addrspace(1)
  store i256 31354931781638678494316026001312189103416802390932084224065329695412615668078, ptr addrspace(1) %memory_store_pointer45, align 1
  %addition_result47 = add i256 %memory_load_result29, 100
  %memory_store_pointer48 = inttoptr i256 %addition_result47 to ptr addrspace(1)
  store i256 44957423563285989266247004906403561635230327756000124389404269791890710200320, ptr addrspace(1) %memory_store_pointer48, align 1
  %4 = tail call i256 @llvm.umin.i256(i256 %memory_load_result29, i256 4294967295)
  %exit_offset_shifted.i72 = shl nuw nsw i256 %4, 64
  %exit_abi_data.i73 = or i256 %exit_offset_shifted.i72, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i73)
  unreachable

if_join28:                                        ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit
  store i256 %and_result, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i76 = tail call i256 @llvm.syncvm.gasleft()
  %5 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i76, i256 4294967295)
  %abi_data_gas_shifted.i.i77 = shl nuw nsw i256 %5, 192
  %abi_data_add_system_call_marker.i.i78 = or i256 %abi_data_gas_shifted.i.i77, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i79 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i78, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i80 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i79, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i80, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit84, label %keccak256_failure_block.i.i81

keccak256_failure_block.i.i81:                    ; preds = %if_join28
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit84: ; preds = %if_join28
  %subtraction_result52 = sub i256 %storage_load, %1
  %keccak256_call_external_result_abi_data_pointer.i.i82 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i79, 0
  %keccak256_child_data.i.i83 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i82, align 1
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i83, i256 %subtraction_result52)
  %storage_load56 = tail call i256 @llvm.syncvm.sload(i256 2)
  %comparison_result.i = icmp ult i256 %storage_load56, %1
  br i1 %comparison_result.i, label %if_main.i, label %checked_sub_uint256.exit

if_main.i:                                        ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit84
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_sub_uint256.exit:                         ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit84
  %subtraction_result.i = sub i256 %storage_load56, %1
  tail call void @llvm.syncvm.sstore(i256 2, i256 %subtraction_result.i)
  %memory_load_result57 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result57 to ptr addrspace(1)
  store i256 %1, ptr addrspace(1) %memory_store_pointer.i, align 1
  %gas_left = tail call i256 @llvm.syncvm.gasleft()
  %6 = tail call i256 @llvm.umin.i256(i256 %memory_load_result57, i256 4294967295)
  %7 = tail call i256 @llvm.umin.i256(i256 %gas_left, i256 4294967295)
  %abi_data_input_offset_shifted = shl nuw nsw i256 %6, 64
  %abi_data_gas_shifted = shl nuw nsw i256 %7, 192
  %abi_data_offset_and_length = or i256 %abi_data_gas_shifted, %abi_data_input_offset_shifted
  %abi_data_add_system_call_marker = or i256 %abi_data_offset_and_length, 904625697166532776746648320380374280103671757735618107014721178055227736064
  %event_writer_call_external = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker, i256 32781, i256 3, i256 -15402802100530019096323380498944738953123845089667699673314898783681816316945, i256 %and_result, i256 0, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %event_writer_external_result_status_code_boolean = extractvalue { ptr addrspace(3), i1 } %event_writer_call_external, 1
  br i1 %event_writer_external_result_status_code_boolean, label %event_join_block, label %event_failure_block

event_failure_block:                              ; preds = %checked_sub_uint256.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

event_join_block:                                 ; preds = %checked_sub_uint256.exit
  ret void
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc void @fun_approve(i256 %0, i256 %1, i256 %2) unnamed_addr #6 personality ptr @__personality {
entry:
  %and_result = and i256 %0, 1461501637330902918203684832716283019655932542975
  %comparison_result = icmp eq i256 %and_result, 0
  br i1 %comparison_result, label %if_main, label %if_join

if_main:                                          ; preds = %entry
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer, align 1
  %addition_result = add i256 %memory_load_result, 4
  %memory_store_pointer11 = inttoptr i256 %addition_result to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer11, align 1
  %addition_result13 = add i256 %memory_load_result, 36
  %memory_store_pointer14 = inttoptr i256 %addition_result13 to ptr addrspace(1)
  store i256 36, ptr addrspace(1) %memory_store_pointer14, align 1
  %addition_result16 = add i256 %memory_load_result, 68
  %memory_store_pointer17 = inttoptr i256 %addition_result16 to ptr addrspace(1)
  store i256 31354931781638678487916134672869638484047149969764982831501014746446650500196, ptr addrspace(1) %memory_store_pointer17, align 1
  %addition_result19 = add i256 %memory_load_result, 100
  %memory_store_pointer20 = inttoptr i256 %addition_result19 to ptr addrspace(1)
  store i256 51742913093258732729005998692887265601192425265805909375210916622055285719040, ptr addrspace(1) %memory_store_pointer20, align 1
  %3 = tail call i256 @llvm.umin.i256(i256 %memory_load_result, i256 4294967295)
  %exit_offset_shifted.i = shl nuw nsw i256 %3, 64
  %exit_abi_data.i = or i256 %exit_offset_shifted.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i)
  unreachable

if_join:                                          ; preds = %entry
  %and_result24 = and i256 %1, 1461501637330902918203684832716283019655932542975
  %comparison_result26 = icmp eq i256 %and_result24, 0
  br i1 %comparison_result26, label %if_main29, label %if_join30

if_main29:                                        ; preds = %if_join
  %memory_load_result31 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer38 = inttoptr i256 %memory_load_result31 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer38, align 1
  %addition_result40 = add i256 %memory_load_result31, 4
  %memory_store_pointer41 = inttoptr i256 %addition_result40 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer41, align 1
  %addition_result43 = add i256 %memory_load_result31, 36
  %memory_store_pointer44 = inttoptr i256 %addition_result43 to ptr addrspace(1)
  store i256 34, ptr addrspace(1) %memory_store_pointer44, align 1
  %addition_result46 = add i256 %memory_load_result31, 68
  %memory_store_pointer47 = inttoptr i256 %addition_result46 to ptr addrspace(1)
  store i256 31354931781638678487916134672869638488806705378895508030211234510262059168357, ptr addrspace(1) %memory_store_pointer47, align 1
  %addition_result49 = add i256 %memory_load_result31, 100
  %memory_store_pointer50 = inttoptr i256 %addition_result49 to ptr addrspace(1)
  store i256 52219164999525148860834357634456956735281286572158918307284071279203377479680, ptr addrspace(1) %memory_store_pointer50, align 1
  %4 = tail call i256 @llvm.umin.i256(i256 %memory_load_result31, i256 4294967295)
  %exit_offset_shifted.i70 = shl nuw nsw i256 %4, 64
  %exit_abi_data.i71 = or i256 %exit_offset_shifted.i70, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i71)
  unreachable

if_join30:                                        ; preds = %if_join
  store i256 %and_result, ptr addrspace(1) null, align 4294967296
  store i256 1, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %5 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %5, 192
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_gas_shifted.i.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14901.exit, label %keccak256_failure_block.i.i

keccak256_failure_block.i.i:                      ; preds = %if_join30
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14901.exit: ; preds = %if_join30
  %keccak256_call_external_result_abi_data_pointer.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 0
  %keccak256_child_data.i.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i, align 1
  store i256 %and_result24, ptr addrspace(1) null, align 4294967296
  store i256 %keccak256_child_data.i.i, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i74 = tail call i256 @llvm.syncvm.gasleft()
  %6 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i74, i256 4294967295)
  %abi_data_gas_shifted.i.i75 = shl nuw nsw i256 %6, 192
  %abi_data_add_system_call_marker.i.i76 = or i256 %abi_data_gas_shifted.i.i75, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i77 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i76, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i78 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i77, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i78, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit, label %keccak256_failure_block.i.i79

keccak256_failure_block.i.i79:                    ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14901.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit: ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14901.exit
  %keccak256_call_external_result_abi_data_pointer.i.i80 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i77, 0
  %keccak256_child_data.i.i81 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i80, align 1
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i81, i256 %2)
  %memory_load_result55 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result55 to ptr addrspace(1)
  store i256 %2, ptr addrspace(1) %memory_store_pointer.i, align 1
  %gas_left = tail call i256 @llvm.syncvm.gasleft()
  %7 = tail call i256 @llvm.umin.i256(i256 %memory_load_result55, i256 4294967295)
  %8 = tail call i256 @llvm.umin.i256(i256 %gas_left, i256 4294967295)
  %abi_data_input_offset_shifted = shl nuw nsw i256 %7, 64
  %abi_data_gas_shifted = shl nuw nsw i256 %8, 192
  %abi_data_offset_and_length = or i256 %abi_data_gas_shifted, %abi_data_input_offset_shifted
  %abi_data_add_system_call_marker = or i256 %abi_data_offset_and_length, 904625697166532776746648320380374280103671757735618107014721178055227736064
  %event_writer_call_external = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker, i256 32781, i256 3, i256 -52305948261162578668367882225327028569797882979485679342215860919519743330011, i256 %and_result, i256 %and_result24, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %event_writer_external_result_status_code_boolean = extractvalue { ptr addrspace(3), i1 } %event_writer_call_external, 1
  br i1 %event_writer_external_result_status_code_boolean, label %event_join_block, label %event_failure_block

event_failure_block:                              ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

event_join_block:                                 ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20.exit
  ret void
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc i256 @fun_fee() unnamed_addr #6 personality ptr @__personality {
entry:
  %storage_load = tail call i256 @llvm.syncvm.sload(i256 7)
  %and_result = and i256 %storage_load, 1461501637330902918203684832716283019655932542975
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 -15473609976992815453879044879197146078698344415282747790657695637952777945088, ptr addrspace(1) %memory_store_pointer, align 1
  %gas_left = tail call i256 @llvm.syncvm.gasleft()
  %cond = icmp eq i256 %and_result, 4
  br i1 %cond, label %if_join, label %contract_call_ordinary_block

contract_call_ordinary_block:                     ; preds = %entry
  %0 = tail call i256 @llvm.umin.i256(i256 %memory_load_result, i256 4294967295)
  %1 = tail call i256 @llvm.umin.i256(i256 %gas_left, i256 4294967295)
  %abi_data_input_offset_shifted.i = shl nuw nsw i256 %0, 64
  %abi_data_gas_shifted.i = shl nuw nsw i256 %1, 192
  %abi_data_offset_and_length.i = or i256 %abi_data_gas_shifted.i, %abi_data_input_offset_shifted.i
  %abi_data_add_gas.i = or i256 %abi_data_offset_and_length.i, 316912650057057350374175801344
  %contract_call_external.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_gas.i, i256 %and_result, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i, 0
  %contract_call_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i, 1
  %contract_call_memcpy_from_child_pointer_casted.i = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i, 4294967295
  %2 = tail call i256 @llvm.umin.i256(i256 %contract_call_memcpy_from_child_return_data_size_truncated.i, i256 32)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %memory_store_pointer, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i, i256 %2, i1 false)
  store ptr addrspace(3) %contract_call_external_result_abi_data.i, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i, ptr @returndatasize, align 32
  br i1 %contract_call_external_result_status_code_boolean.i, label %if_join, label %if_main

if_main:                                          ; preds = %contract_call_ordinary_block
  %returndatasize.i = load i256, ptr @returndatasize, align 32
  %memory_load_result.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i = inttoptr i256 %memory_load_result.i to ptr addrspace(1)
  %return_data_pointer.i = load ptr addrspace(3), ptr @ptr_return_data, align 32
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i, ptr addrspace(3) align 1 %return_data_pointer.i, i256 %returndatasize.i, i1 false)
  %returndatasize3.i = load i256, ptr @returndatasize, align 32
  %3 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i, i256 4294967295)
  %4 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i, i256 4294967295)
  %exit_offset_shifted.i.i = shl nuw nsw i256 %3, 64
  %exit_length_shifted.i.i = shl nuw nsw i256 %4, 96
  %exit_abi_data.i.i = or i256 %exit_length_shifted.i.i, %exit_offset_shifted.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i)
  unreachable

if_join:                                          ; preds = %entry, %contract_call_ordinary_block
  %returndatasize = load i256, ptr @returndatasize, align 32
  %5 = tail call i256 @llvm.umin.i256(i256 %returndatasize, i256 32)
  %addition_result.i = add nuw nsw i256 %5, 31
  %and_result.i = and i256 %addition_result.i, 96
  %addition_result3.i = add i256 %and_result.i, %memory_load_result
  %comparison_result.i = icmp ult i256 %addition_result3.i, %memory_load_result
  %comparison_result7.i = icmp ugt i256 %addition_result3.i, 18446744073709551615
  %or_result13.i = or i1 %comparison_result7.i, %comparison_result.i
  br i1 %or_result13.i, label %if_main.i, label %finalize_allocation.exit

if_main.i:                                        ; preds = %if_join
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit:                         ; preds = %if_join
  store i256 %addition_result3.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %comparison_result.i34 = icmp ult i256 %returndatasize, 32
  br i1 %comparison_result.i34, label %if_main.i35, label %abi_decode_uint256_fromMemory.exit

if_main.i35:                                      ; preds = %finalize_allocation.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_uint256_fromMemory.exit:               ; preds = %finalize_allocation.exit
  %memory_load_result.i36 = load i256, ptr addrspace(1) %memory_store_pointer, align 1
  ret i256 %memory_load_result.i36
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc i256 @read_from_storage_reference_type_struct_Data(i256 %0) unnamed_addr #6 personality ptr @__personality {
entry:
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %1 = icmp ugt i256 %memory_load_result, 18446744073709551551
  br i1 %1, label %if_main.i, label %finalize_allocation_14877.exit

if_main.i:                                        ; preds = %entry
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation_14877.exit:                   ; preds = %entry
  %addition_result.i = add i256 %memory_load_result, 64
  store i256 %addition_result.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %storage_load = tail call i256 @llvm.syncvm.sload(i256 %0)
  %and_result = and i256 %storage_load, 105312291668557186697918027683670432318895095400549111254310977535
  %memory_store_pointer = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 %and_result, ptr addrspace(1) %memory_store_pointer, align 1
  %shift_right_non_overflow_result = lshr i256 %storage_load, 216
  %addition_result = add i256 %memory_load_result, 32
  %memory_store_pointer8 = inttoptr i256 %addition_result to ptr addrspace(1)
  store i256 %shift_right_non_overflow_result, ptr addrspace(1) %memory_store_pointer8, align 1
  ret i256 %memory_load_result
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc i256 @fun_getBalanceForAddition(i256 %0) unnamed_addr #6 personality ptr @__personality {
entry:
  %address = tail call i256 @llvm.syncvm.this()
  %and_result.i = and i256 %0, 1461501637330902918203684832716283019655932542975
  %comparison_result.not.i = icmp eq i256 %and_result.i, 0
  br i1 %comparison_result.not.i, label %switch_default_block.i, label %switch_case_branch_1_block.i

switch_case_branch_1_block.i:                     ; preds = %entry
  %memory_load_result.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result.i to ptr addrspace(1)
  store i256 50942633119752846454219349998365661925608737367104304655302372697894809501696, ptr addrspace(1) %memory_store_pointer.i, align 1
  %and_result12.i = and i256 %address, 1461501637330902918203684832716283019655932542975
  %addition_result.i = add i256 %memory_load_result.i, 4
  %memory_store_pointer14.i = inttoptr i256 %addition_result.i to ptr addrspace(1)
  store i256 %and_result12.i, ptr addrspace(1) %memory_store_pointer14.i, align 1
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %cond40.i = icmp eq i256 %and_result.i, 4
  br i1 %cond40.i, label %if_join.i, label %contract_call_ordinary_block.i

contract_call_ordinary_block.i:                   ; preds = %switch_case_branch_1_block.i
  %1 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i, i256 4294967295)
  %2 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_input_offset_shifted.i.i = shl nuw nsw i256 %1, 64
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %2, 192
  %abi_data_offset_and_length.i.i = or i256 %abi_data_gas_shifted.i.i, %abi_data_input_offset_shifted.i.i
  %abi_data_add_gas.i.i = or i256 %abi_data_offset_and_length.i.i, 2852213850513516153367582212096
  %contract_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_gas.i.i, i256 %and_result.i, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 0
  %contract_call_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 1
  %contract_call_memcpy_from_child_pointer_casted.i.i = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i.i to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i.i = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i.i, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i.i = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i.i, 4294967295
  %3 = tail call i256 @llvm.umin.i256(i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i256 32)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %memory_store_pointer.i, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i, i256 %3, i1 false)
  store ptr addrspace(3) %contract_call_external_result_abi_data.i.i, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, ptr @returndatasize, align 32
  br i1 %contract_call_external_result_status_code_boolean.i.i, label %if_join.i, label %if_main.i

if_main.i:                                        ; preds = %contract_call_ordinary_block.i
  %memory_load_result.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i.i = inttoptr i256 %memory_load_result.i.i to ptr addrspace(1)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i, i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i1 false)
  %returndatasize3.i.i = load i256, ptr @returndatasize, align 32
  %4 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i, i256 4294967295)
  %5 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i = shl nuw nsw i256 %4, 64
  %exit_length_shifted.i.i.i = shl nuw nsw i256 %5, 96
  %exit_abi_data.i.i.i = or i256 %exit_length_shifted.i.i.i, %exit_offset_shifted.i.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i)
  unreachable

if_join.i:                                        ; preds = %contract_call_ordinary_block.i, %switch_case_branch_1_block.i
  %returndatasize.i = load i256, ptr @returndatasize, align 32
  %6 = tail call i256 @llvm.umin.i256(i256 %returndatasize.i, i256 32)
  %addition_result.i.i = add nuw nsw i256 %6, 31
  %and_result.i.i = and i256 %addition_result.i.i, 96
  %addition_result3.i.i = add i256 %and_result.i.i, %memory_load_result.i
  %comparison_result.i.i = icmp ult i256 %addition_result3.i.i, %memory_load_result.i
  %comparison_result7.i.i = icmp ugt i256 %addition_result3.i.i, 18446744073709551615
  %or_result13.i.i = or i1 %comparison_result7.i.i, %comparison_result.i.i
  br i1 %or_result13.i.i, label %if_main.i.i, label %finalize_allocation.exit.i

if_main.i.i:                                      ; preds = %if_join.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit.i:                       ; preds = %if_join.i
  store i256 %addition_result3.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %comparison_result.i44.i = icmp ult i256 %returndatasize.i, 32
  br i1 %comparison_result.i44.i, label %if_main.i45.i, label %abi_decode_uint256_fromMemory.exit.i

if_main.i45.i:                                    ; preds = %finalize_allocation.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_uint256_fromMemory.exit.i:             ; preds = %finalize_allocation.exit.i
  %memory_load_result.i46.i = load i256, ptr addrspace(1) %memory_store_pointer.i, align 1
  br label %fun_uniBalanceOf.exit

switch_default_block.i:                           ; preds = %entry
  store i256 -44877977326897262784168444354156441158329539312518651612887364914072161059015, ptr addrspace(2) null, align 4294967296
  store i256 %address, ptr addrspace(2) inttoptr (i256 4 to ptr addrspace(2)), align 4
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %7 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_gas_shifted.i47.i = shl nuw nsw i256 %7, 192
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_gas_shifted.i47.i, 904625751086426111047927909714404454142933105326819602152923490636624035840
  %system_request.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i, i256 32778, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 1
  br i1 %system_request_result_status_code_boolean.i.i, label %__system_request.exit.i, label %system_request_error_block.i.i

system_request_error_block.i.i:                   ; preds = %switch_default_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i:                          ; preds = %switch_default_block.i
  %system_request_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 0
  %system_request_child_address.i.i = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i, align 1
  br label %fun_uniBalanceOf.exit

fun_uniBalanceOf.exit:                            ; preds = %abi_decode_uint256_fromMemory.exit.i, %__system_request.exit.i
  %return_pointer.0.i = phi i256 [ %memory_load_result.i46.i, %abi_decode_uint256_fromMemory.exit.i ], [ %system_request_child_address.i.i, %__system_request.exit.i ]
  store i256 %and_result.i, ptr addrspace(1) null, align 4294967296
  store i256 11, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i7 = tail call i256 @llvm.syncvm.gasleft()
  %8 = tail call i256 @llvm.umin.i256(i256 %gas_left.i7, i256 4294967295)
  %abi_data_gas_shifted.i = shl nuw nsw i256 %8, 192
  %abi_data_add_system_call_marker.i = or i256 %abi_data_gas_shifted.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i, label %__keccak256.exit, label %keccak256_failure_block.i

keccak256_failure_block.i:                        ; preds = %fun_uniBalanceOf.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit:                                 ; preds = %fun_uniBalanceOf.exit
  %memory_load_result.i8 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %9 = icmp ugt i256 %memory_load_result.i8, 18446744073709551551
  br i1 %9, label %if_main.i.i9, label %read_from_storage_reference_type_struct_Data.exit

if_main.i.i9:                                     ; preds = %__keccak256.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

read_from_storage_reference_type_struct_Data.exit: ; preds = %__keccak256.exit
  %keccak256_call_external_result_abi_data_pointer.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 0
  %keccak256_child_data.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i, align 1
  %addition_result.i.i10 = add i256 %memory_load_result.i8, 64
  store i256 %addition_result.i.i10, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %storage_load.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i)
  %and_result.i11 = and i256 %storage_load.i, 105312291668557186697918027683670432318895095400549111254310977535
  %memory_store_pointer.i12 = inttoptr i256 %memory_load_result.i8 to ptr addrspace(1)
  store i256 %and_result.i11, ptr addrspace(1) %memory_store_pointer.i12, align 1
  %shift_right_non_overflow_result.i = lshr i256 %storage_load.i, 216
  %addition_result.i13 = add i256 %memory_load_result.i8, 32
  %memory_store_pointer8.i = inttoptr i256 %addition_result.i13 to ptr addrspace(1)
  store i256 %shift_right_non_overflow_result.i, ptr addrspace(1) %memory_store_pointer8.i, align 1
  store i256 54919857843691310904240101001871775513466943666296306094405906504622902841650, ptr addrspace(2) null, align 4294967296
  %gas_left.i.i17 = tail call i256 @llvm.syncvm.gasleft()
  %10 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i17, i256 4294967295)
  %abi_data_gas_shifted.i.i18 = shl nuw nsw i256 %10, 192
  %abi_data_add_system_call_marker.i.i19 = or i256 %abi_data_gas_shifted.i.i18, 904625751086426111047927909714404454142933102791518401696464687643217625088
  %system_request.i.i20 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i19, i256 32779, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i21 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i20, 1
  br i1 %system_request_result_status_code_boolean.i.i21, label %__system_request.exit.i26, label %system_request_error_block.i.i22

system_request_error_block.i.i22:                 ; preds = %read_from_storage_reference_type_struct_Data.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i26:                        ; preds = %read_from_storage_reference_type_struct_Data.exit
  %system_request_result_abi_data.i.i23 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i20, 0
  %system_request_child_address.i.i24 = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i23, align 1
  %comparison_result.i.i25 = icmp ult i256 %system_request_child_address.i.i24, %shift_right_non_overflow_result.i
  br i1 %comparison_result.i.i25, label %if_main.i.i31, label %fun_sub.exit.i

if_main.i.i31:                                    ; preds = %__system_request.exit.i26
  %memory_load_result.i.i27 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i = inttoptr i256 %memory_load_result.i.i27 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i.i, align 1
  %addition_result.i.i28 = add i256 %memory_load_result.i.i27, 4
  %memory_store_pointer5.i.i = inttoptr i256 %addition_result.i.i28 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5.i.i, align 1
  %addition_result7.i.i = add i256 %memory_load_result.i.i27, 36
  %memory_store_pointer8.i.i = inttoptr i256 %addition_result7.i.i to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8.i.i, align 1
  %addition_result10.i.i = add i256 %memory_load_result.i.i27, 68
  %memory_store_pointer11.i.i = inttoptr i256 %addition_result10.i.i to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11.i.i, align 1
  %11 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i27, i256 4294967295)
  %exit_offset_shifted.i.i.i29 = shl nuw nsw i256 %11, 64
  %exit_abi_data.i.i.i30 = or i256 %exit_offset_shifted.i.i.i29, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i30)
  unreachable

fun_sub.exit.i:                                   ; preds = %__system_request.exit.i26
  %subtraction_result.i.i = sub i256 %system_request_child_address.i.i24, %shift_right_non_overflow_result.i
  %12 = tail call i256 @llvm.umin.i256(i256 %subtraction_result.i.i, i256 300)
  %memory_load_result39.i = load i256, ptr addrspace(1) %memory_store_pointer.i12, align 1
  %and_result40.i = and i256 %memory_load_result39.i, 105312291668557186697918027683670432318895095400549111254310977535
  %comparison_result.i54.i = icmp eq i256 %and_result40.i, 0
  br i1 %comparison_result.i54.i, label %fun_mul.exit.i, label %if_join8.i.i

if_join8.i.i:                                     ; preds = %fun_sub.exit.i
  %subtraction_result.i = sub nuw nsw i256 300, %12
  %multiplication_result.i.i = mul nsw i256 %and_result40.i, %subtraction_result.i
  %division_result_non_zero.i.i.i = udiv i256 %multiplication_result.i.i, %and_result40.i
  %comparison_result14.not.i.i = icmp eq i256 %division_result_non_zero.i.i.i, %subtraction_result.i
  br i1 %comparison_result14.not.i.i, label %fun_mul.exit.i, label %if_main19.i.i

if_main19.i.i:                                    ; preds = %if_join8.i.i
  %memory_load_result.i55.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i56.i = inttoptr i256 %memory_load_result.i55.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i56.i, align 1
  %addition_result.i57.i = add i256 %memory_load_result.i55.i, 4
  %memory_store_pointer23.i.i = inttoptr i256 %addition_result.i57.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i.i, align 1
  %addition_result25.i.i = add i256 %memory_load_result.i55.i, 36
  %memory_store_pointer26.i.i = inttoptr i256 %addition_result25.i.i to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i.i, align 1
  %addition_result28.i.i = add i256 %memory_load_result.i55.i, 68
  %memory_store_pointer29.i.i = inttoptr i256 %addition_result28.i.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i.i, align 1
  %addition_result31.i.i = add i256 %memory_load_result.i55.i, 100
  %memory_store_pointer32.i.i = inttoptr i256 %addition_result31.i.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i.i, align 1
  %13 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i55.i, i256 4294967295)
  %exit_offset_shifted.i.i58.i = shl nuw nsw i256 %13, 64
  %exit_abi_data.i.i59.i = or i256 %exit_offset_shifted.i.i58.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i59.i)
  unreachable

fun_mul.exit.i:                                   ; preds = %if_join8.i.i, %fun_sub.exit.i
  %return_pointer.0.i.i = phi i256 [ 0, %fun_sub.exit.i ], [ %multiplication_result.i.i, %if_join8.i.i ]
  %comparison_result.i60.i = icmp eq i256 %return_pointer.0.i, 0
  br i1 %comparison_result.i60.i, label %fun_mul.exit83.i, label %if_join.i64.i

if_join.i64.i:                                    ; preds = %fun_mul.exit.i
  %division_result_non_zero.i62.i = udiv i256 -1, %return_pointer.0.i
  %comparison_result4.i63.i = icmp ult i256 %division_result_non_zero.i62.i, %12
  br i1 %comparison_result4.i63.i, label %if_main7.i65.i, label %if_join8.i69.i

if_main7.i65.i:                                   ; preds = %if_join.i64.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i69.i:                                   ; preds = %if_join.i64.i
  %multiplication_result.i66.i = mul i256 %12, %return_pointer.0.i
  %division_result_non_zero.i.i67.i = udiv i256 %multiplication_result.i66.i, %return_pointer.0.i
  %comparison_result14.not.i68.i = icmp eq i256 %division_result_non_zero.i.i67.i, %12
  br i1 %comparison_result14.not.i68.i, label %fun_mul.exit83.i, label %if_main19.i82.i

if_main19.i82.i:                                  ; preds = %if_join8.i69.i
  %memory_load_result.i70.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i71.i = inttoptr i256 %memory_load_result.i70.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i71.i, align 1
  %addition_result.i72.i = add i256 %memory_load_result.i70.i, 4
  %memory_store_pointer23.i73.i = inttoptr i256 %addition_result.i72.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i73.i, align 1
  %addition_result25.i74.i = add i256 %memory_load_result.i70.i, 36
  %memory_store_pointer26.i75.i = inttoptr i256 %addition_result25.i74.i to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i75.i, align 1
  %addition_result28.i76.i = add i256 %memory_load_result.i70.i, 68
  %memory_store_pointer29.i77.i = inttoptr i256 %addition_result28.i76.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i77.i, align 1
  %addition_result31.i78.i = add i256 %memory_load_result.i70.i, 100
  %memory_store_pointer32.i79.i = inttoptr i256 %addition_result31.i78.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i79.i, align 1
  %14 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i70.i, i256 4294967295)
  %exit_offset_shifted.i.i80.i = shl nuw nsw i256 %14, 64
  %exit_abi_data.i.i81.i = or i256 %exit_offset_shifted.i.i80.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i81.i)
  unreachable

fun_mul.exit83.i:                                 ; preds = %if_join8.i69.i, %fun_mul.exit.i
  %return_pointer.0.i61.i = phi i256 [ 0, %fun_mul.exit.i ], [ %multiplication_result.i66.i, %if_join8.i69.i ]
  %xor_result.i.i.i = xor i256 %return_pointer.0.i61.i, -1
  %comparison_result.i.i.i = icmp ugt i256 %return_pointer.0.i.i, %xor_result.i.i.i
  br i1 %comparison_result.i.i.i, label %if_main.i.i.i, label %checked_add_uint256.exit.i.i

if_main.i.i.i:                                    ; preds = %fun_mul.exit83.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i.i:                     ; preds = %fun_mul.exit83.i
  %addition_result.i.i.i = add i256 %return_pointer.0.i61.i, %return_pointer.0.i.i
  %comparison_result.i84.i = icmp ult i256 %addition_result.i.i.i, %return_pointer.0.i.i
  br i1 %comparison_result.i84.i, label %if_main.i90.i, label %fun_current.exit

if_main.i90.i:                                    ; preds = %checked_add_uint256.exit.i.i
  %memory_load_result.i85.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i86.i = inttoptr i256 %memory_load_result.i85.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i86.i, align 1
  %addition_result.i87.i = add i256 %memory_load_result.i85.i, 4
  %memory_store_pointer7.i.i = inttoptr i256 %addition_result.i87.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i.i, align 1
  %addition_result9.i.i = add i256 %memory_load_result.i85.i, 36
  %memory_store_pointer10.i.i = inttoptr i256 %addition_result9.i.i to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i.i, align 1
  %addition_result12.i.i = add i256 %memory_load_result.i85.i, 68
  %memory_store_pointer13.i.i = inttoptr i256 %addition_result12.i.i to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i.i, align 1
  %15 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i85.i, i256 4294967295)
  %exit_offset_shifted.i.i88.i = shl nuw nsw i256 %15, 64
  %exit_abi_data.i.i89.i = or i256 %exit_offset_shifted.i.i88.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i89.i)
  unreachable

fun_current.exit:                                 ; preds = %checked_add_uint256.exit.i.i
  %division_result_non_zero.i92.i = udiv i256 %addition_result.i.i.i, 300
  %16 = tail call i256 @llvm.umax.i256(i256 %division_result_non_zero.i92.i, i256 %return_pointer.0.i)
  ret i256 %16
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc i256 @fun_current(i256 %0, i256 %1) unnamed_addr #6 personality ptr @__personality {
entry:
  %addition_result = add i256 %0, 32
  %memory_load_pointer = inttoptr i256 %addition_result to ptr addrspace(1)
  %memory_load_result = load i256, ptr addrspace(1) %memory_load_pointer, align 1
  %and_result = and i256 %memory_load_result, 1099511627775
  store i256 54919857843691310904240101001871775513466943666296306094405906504622902841650, ptr addrspace(2) null, align 4294967296
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %2 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_gas_shifted.i = shl nuw nsw i256 %2, 192
  %abi_data_add_system_call_marker.i = or i256 %abi_data_gas_shifted.i, 904625751086426111047927909714404454142933102791518401696464687643217625088
  %system_request.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i, i256 32779, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %system_request.i, 1
  br i1 %system_request_result_status_code_boolean.i, label %__system_request.exit, label %system_request_error_block.i

system_request_error_block.i:                     ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit:                            ; preds = %entry
  %system_request_result_abi_data.i = extractvalue { ptr addrspace(3), i1 } %system_request.i, 0
  %system_request_child_address.i = load i256, ptr addrspace(3) %system_request_result_abi_data.i, align 1
  %comparison_result.i = icmp ult i256 %system_request_child_address.i, %and_result
  br i1 %comparison_result.i, label %if_main.i, label %fun_sub.exit

if_main.i:                                        ; preds = %__system_request.exit
  %memory_load_result.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i, align 1
  %addition_result.i = add i256 %memory_load_result.i, 4
  %memory_store_pointer5.i = inttoptr i256 %addition_result.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5.i, align 1
  %addition_result7.i = add i256 %memory_load_result.i, 36
  %memory_store_pointer8.i = inttoptr i256 %addition_result7.i to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8.i, align 1
  %addition_result10.i = add i256 %memory_load_result.i, 68
  %memory_store_pointer11.i = inttoptr i256 %addition_result10.i to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11.i, align 1
  %3 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i, i256 4294967295)
  %exit_offset_shifted.i.i = shl nuw nsw i256 %3, 64
  %exit_abi_data.i.i = or i256 %exit_offset_shifted.i.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i)
  unreachable

fun_sub.exit:                                     ; preds = %__system_request.exit
  %subtraction_result.i = sub i256 %system_request_child_address.i, %and_result
  %4 = tail call i256 @llvm.umin.i256(i256 %subtraction_result.i, i256 300)
  %memory_load_pointer38 = inttoptr i256 %0 to ptr addrspace(1)
  %memory_load_result39 = load i256, ptr addrspace(1) %memory_load_pointer38, align 1
  %and_result40 = and i256 %memory_load_result39, 105312291668557186697918027683670432318895095400549111254310977535
  %comparison_result.i54 = icmp eq i256 %and_result40, 0
  br i1 %comparison_result.i54, label %fun_mul.exit, label %if_join8.i

if_join8.i:                                       ; preds = %fun_sub.exit
  %subtraction_result = sub nuw nsw i256 300, %4
  %multiplication_result.i = mul nsw i256 %and_result40, %subtraction_result
  %division_result_non_zero.i.i = udiv i256 %multiplication_result.i, %and_result40
  %comparison_result14.not.i = icmp eq i256 %division_result_non_zero.i.i, %subtraction_result
  br i1 %comparison_result14.not.i, label %fun_mul.exit, label %if_main19.i

if_main19.i:                                      ; preds = %if_join8.i
  %memory_load_result.i55 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i56 = inttoptr i256 %memory_load_result.i55 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i56, align 1
  %addition_result.i57 = add i256 %memory_load_result.i55, 4
  %memory_store_pointer23.i = inttoptr i256 %addition_result.i57 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i, align 1
  %addition_result25.i = add i256 %memory_load_result.i55, 36
  %memory_store_pointer26.i = inttoptr i256 %addition_result25.i to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i, align 1
  %addition_result28.i = add i256 %memory_load_result.i55, 68
  %memory_store_pointer29.i = inttoptr i256 %addition_result28.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i, align 1
  %addition_result31.i = add i256 %memory_load_result.i55, 100
  %memory_store_pointer32.i = inttoptr i256 %addition_result31.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i, align 1
  %5 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i55, i256 4294967295)
  %exit_offset_shifted.i.i58 = shl nuw nsw i256 %5, 64
  %exit_abi_data.i.i59 = or i256 %exit_offset_shifted.i.i58, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i59)
  unreachable

fun_mul.exit:                                     ; preds = %fun_sub.exit, %if_join8.i
  %return_pointer.0.i = phi i256 [ 0, %fun_sub.exit ], [ %multiplication_result.i, %if_join8.i ]
  %comparison_result.i60 = icmp eq i256 %1, 0
  br i1 %comparison_result.i60, label %fun_mul.exit83, label %if_join.i64

if_join.i64:                                      ; preds = %fun_mul.exit
  %division_result_non_zero.i62 = udiv i256 -1, %1
  %comparison_result4.i63 = icmp ult i256 %division_result_non_zero.i62, %4
  br i1 %comparison_result4.i63, label %if_main7.i65, label %if_join8.i69

if_main7.i65:                                     ; preds = %if_join.i64
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i69:                                     ; preds = %if_join.i64
  %multiplication_result.i66 = mul i256 %4, %1
  %division_result_non_zero.i.i67 = udiv i256 %multiplication_result.i66, %1
  %comparison_result14.not.i68 = icmp eq i256 %division_result_non_zero.i.i67, %4
  br i1 %comparison_result14.not.i68, label %fun_mul.exit83, label %if_main19.i82

if_main19.i82:                                    ; preds = %if_join8.i69
  %memory_load_result.i70 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i71 = inttoptr i256 %memory_load_result.i70 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i71, align 1
  %addition_result.i72 = add i256 %memory_load_result.i70, 4
  %memory_store_pointer23.i73 = inttoptr i256 %addition_result.i72 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i73, align 1
  %addition_result25.i74 = add i256 %memory_load_result.i70, 36
  %memory_store_pointer26.i75 = inttoptr i256 %addition_result25.i74 to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i75, align 1
  %addition_result28.i76 = add i256 %memory_load_result.i70, 68
  %memory_store_pointer29.i77 = inttoptr i256 %addition_result28.i76 to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i77, align 1
  %addition_result31.i78 = add i256 %memory_load_result.i70, 100
  %memory_store_pointer32.i79 = inttoptr i256 %addition_result31.i78 to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i79, align 1
  %6 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i70, i256 4294967295)
  %exit_offset_shifted.i.i80 = shl nuw nsw i256 %6, 64
  %exit_abi_data.i.i81 = or i256 %exit_offset_shifted.i.i80, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i81)
  unreachable

fun_mul.exit83:                                   ; preds = %fun_mul.exit, %if_join8.i69
  %return_pointer.0.i61 = phi i256 [ 0, %fun_mul.exit ], [ %multiplication_result.i66, %if_join8.i69 ]
  %xor_result.i.i = xor i256 %return_pointer.0.i61, -1
  %comparison_result.i.i = icmp ugt i256 %return_pointer.0.i, %xor_result.i.i
  br i1 %comparison_result.i.i, label %if_main.i.i, label %checked_add_uint256.exit.i

if_main.i.i:                                      ; preds = %fun_mul.exit83
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i:                       ; preds = %fun_mul.exit83
  %addition_result.i.i = add i256 %return_pointer.0.i61, %return_pointer.0.i
  %comparison_result.i84 = icmp ult i256 %addition_result.i.i, %return_pointer.0.i
  br i1 %comparison_result.i84, label %if_main.i90, label %fun_add.exit

if_main.i90:                                      ; preds = %checked_add_uint256.exit.i
  %memory_load_result.i85 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i86 = inttoptr i256 %memory_load_result.i85 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i86, align 1
  %addition_result.i87 = add i256 %memory_load_result.i85, 4
  %memory_store_pointer7.i = inttoptr i256 %addition_result.i87 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i, align 1
  %addition_result9.i = add i256 %memory_load_result.i85, 36
  %memory_store_pointer10.i = inttoptr i256 %addition_result9.i to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i, align 1
  %addition_result12.i = add i256 %memory_load_result.i85, 68
  %memory_store_pointer13.i = inttoptr i256 %addition_result12.i to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i, align 1
  %7 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i85, i256 4294967295)
  %exit_offset_shifted.i.i88 = shl nuw nsw i256 %7, 64
  %exit_abi_data.i.i89 = or i256 %exit_offset_shifted.i.i88, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i89)
  unreachable

fun_add.exit:                                     ; preds = %checked_add_uint256.exit.i
  %division_result_non_zero.i92 = udiv i256 %addition_result.i.i, 300
  ret i256 %division_result_non_zero.i92
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc i256 @fun_getBalanceForRemoval(i256 %0) unnamed_addr #6 personality ptr @__personality {
entry:
  %address = tail call i256 @llvm.syncvm.this()
  %and_result.i = and i256 %0, 1461501637330902918203684832716283019655932542975
  %comparison_result.not.i = icmp eq i256 %and_result.i, 0
  br i1 %comparison_result.not.i, label %switch_default_block.i, label %switch_case_branch_1_block.i

switch_case_branch_1_block.i:                     ; preds = %entry
  %memory_load_result.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result.i to ptr addrspace(1)
  store i256 50942633119752846454219349998365661925608737367104304655302372697894809501696, ptr addrspace(1) %memory_store_pointer.i, align 1
  %and_result12.i = and i256 %address, 1461501637330902918203684832716283019655932542975
  %addition_result.i = add i256 %memory_load_result.i, 4
  %memory_store_pointer14.i = inttoptr i256 %addition_result.i to ptr addrspace(1)
  store i256 %and_result12.i, ptr addrspace(1) %memory_store_pointer14.i, align 1
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %cond40.i = icmp eq i256 %and_result.i, 4
  br i1 %cond40.i, label %if_join.i, label %contract_call_ordinary_block.i

contract_call_ordinary_block.i:                   ; preds = %switch_case_branch_1_block.i
  %1 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i, i256 4294967295)
  %2 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_input_offset_shifted.i.i = shl nuw nsw i256 %1, 64
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %2, 192
  %abi_data_offset_and_length.i.i = or i256 %abi_data_gas_shifted.i.i, %abi_data_input_offset_shifted.i.i
  %abi_data_add_gas.i.i = or i256 %abi_data_offset_and_length.i.i, 2852213850513516153367582212096
  %contract_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_gas.i.i, i256 %and_result.i, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 0
  %contract_call_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 1
  %contract_call_memcpy_from_child_pointer_casted.i.i = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i.i to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i.i = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i.i, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i.i = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i.i, 4294967295
  %3 = tail call i256 @llvm.umin.i256(i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i256 32)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %memory_store_pointer.i, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i, i256 %3, i1 false)
  store ptr addrspace(3) %contract_call_external_result_abi_data.i.i, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, ptr @returndatasize, align 32
  br i1 %contract_call_external_result_status_code_boolean.i.i, label %if_join.i, label %if_main.i

if_main.i:                                        ; preds = %contract_call_ordinary_block.i
  %memory_load_result.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i.i = inttoptr i256 %memory_load_result.i.i to ptr addrspace(1)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i, i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i1 false)
  %returndatasize3.i.i = load i256, ptr @returndatasize, align 32
  %4 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i, i256 4294967295)
  %5 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i = shl nuw nsw i256 %4, 64
  %exit_length_shifted.i.i.i = shl nuw nsw i256 %5, 96
  %exit_abi_data.i.i.i = or i256 %exit_length_shifted.i.i.i, %exit_offset_shifted.i.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i)
  unreachable

if_join.i:                                        ; preds = %contract_call_ordinary_block.i, %switch_case_branch_1_block.i
  %returndatasize.i = load i256, ptr @returndatasize, align 32
  %6 = tail call i256 @llvm.umin.i256(i256 %returndatasize.i, i256 32)
  %addition_result.i.i = add nuw nsw i256 %6, 31
  %and_result.i.i = and i256 %addition_result.i.i, 96
  %addition_result3.i.i = add i256 %and_result.i.i, %memory_load_result.i
  %comparison_result.i.i = icmp ult i256 %addition_result3.i.i, %memory_load_result.i
  %comparison_result7.i.i = icmp ugt i256 %addition_result3.i.i, 18446744073709551615
  %or_result13.i.i = or i1 %comparison_result7.i.i, %comparison_result.i.i
  br i1 %or_result13.i.i, label %if_main.i.i, label %finalize_allocation.exit.i

if_main.i.i:                                      ; preds = %if_join.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit.i:                       ; preds = %if_join.i
  store i256 %addition_result3.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %comparison_result.i44.i = icmp ult i256 %returndatasize.i, 32
  br i1 %comparison_result.i44.i, label %if_main.i45.i, label %abi_decode_uint256_fromMemory.exit.i

if_main.i45.i:                                    ; preds = %finalize_allocation.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_uint256_fromMemory.exit.i:             ; preds = %finalize_allocation.exit.i
  %memory_load_result.i46.i = load i256, ptr addrspace(1) %memory_store_pointer.i, align 1
  br label %fun_uniBalanceOf.exit

switch_default_block.i:                           ; preds = %entry
  store i256 -44877977326897262784168444354156441158329539312518651612887364914072161059015, ptr addrspace(2) null, align 4294967296
  store i256 %address, ptr addrspace(2) inttoptr (i256 4 to ptr addrspace(2)), align 4
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %7 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_gas_shifted.i47.i = shl nuw nsw i256 %7, 192
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_gas_shifted.i47.i, 904625751086426111047927909714404454142933105326819602152923490636624035840
  %system_request.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i, i256 32778, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 1
  br i1 %system_request_result_status_code_boolean.i.i, label %__system_request.exit.i, label %system_request_error_block.i.i

system_request_error_block.i.i:                   ; preds = %switch_default_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i:                          ; preds = %switch_default_block.i
  %system_request_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 0
  %system_request_child_address.i.i = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i, align 1
  br label %fun_uniBalanceOf.exit

fun_uniBalanceOf.exit:                            ; preds = %abi_decode_uint256_fromMemory.exit.i, %__system_request.exit.i
  %return_pointer.0.i = phi i256 [ %memory_load_result.i46.i, %abi_decode_uint256_fromMemory.exit.i ], [ %system_request_child_address.i.i, %__system_request.exit.i ]
  store i256 %and_result.i, ptr addrspace(1) null, align 4294967296
  store i256 12, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i7 = tail call i256 @llvm.syncvm.gasleft()
  %8 = tail call i256 @llvm.umin.i256(i256 %gas_left.i7, i256 4294967295)
  %abi_data_gas_shifted.i = shl nuw nsw i256 %8, 192
  %abi_data_add_system_call_marker.i = or i256 %abi_data_gas_shifted.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i, label %__keccak256.exit, label %keccak256_failure_block.i

keccak256_failure_block.i:                        ; preds = %fun_uniBalanceOf.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit:                                 ; preds = %fun_uniBalanceOf.exit
  %memory_load_result.i8 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %9 = icmp ugt i256 %memory_load_result.i8, 18446744073709551551
  br i1 %9, label %if_main.i.i9, label %read_from_storage_reference_type_struct_Data.exit

if_main.i.i9:                                     ; preds = %__keccak256.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

read_from_storage_reference_type_struct_Data.exit: ; preds = %__keccak256.exit
  %keccak256_call_external_result_abi_data_pointer.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 0
  %keccak256_child_data.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i, align 1
  %addition_result.i.i10 = add i256 %memory_load_result.i8, 64
  store i256 %addition_result.i.i10, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %storage_load.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i)
  %and_result.i11 = and i256 %storage_load.i, 105312291668557186697918027683670432318895095400549111254310977535
  %memory_store_pointer.i12 = inttoptr i256 %memory_load_result.i8 to ptr addrspace(1)
  store i256 %and_result.i11, ptr addrspace(1) %memory_store_pointer.i12, align 1
  %shift_right_non_overflow_result.i = lshr i256 %storage_load.i, 216
  %addition_result.i13 = add i256 %memory_load_result.i8, 32
  %memory_store_pointer8.i = inttoptr i256 %addition_result.i13 to ptr addrspace(1)
  store i256 %shift_right_non_overflow_result.i, ptr addrspace(1) %memory_store_pointer8.i, align 1
  store i256 54919857843691310904240101001871775513466943666296306094405906504622902841650, ptr addrspace(2) null, align 4294967296
  %gas_left.i.i17 = tail call i256 @llvm.syncvm.gasleft()
  %10 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i17, i256 4294967295)
  %abi_data_gas_shifted.i.i18 = shl nuw nsw i256 %10, 192
  %abi_data_add_system_call_marker.i.i19 = or i256 %abi_data_gas_shifted.i.i18, 904625751086426111047927909714404454142933102791518401696464687643217625088
  %system_request.i.i20 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i19, i256 32779, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i21 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i20, 1
  br i1 %system_request_result_status_code_boolean.i.i21, label %__system_request.exit.i26, label %system_request_error_block.i.i22

system_request_error_block.i.i22:                 ; preds = %read_from_storage_reference_type_struct_Data.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i26:                        ; preds = %read_from_storage_reference_type_struct_Data.exit
  %system_request_result_abi_data.i.i23 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i20, 0
  %system_request_child_address.i.i24 = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i23, align 1
  %comparison_result.i.i25 = icmp ult i256 %system_request_child_address.i.i24, %shift_right_non_overflow_result.i
  br i1 %comparison_result.i.i25, label %if_main.i.i31, label %fun_sub.exit.i

if_main.i.i31:                                    ; preds = %__system_request.exit.i26
  %memory_load_result.i.i27 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i = inttoptr i256 %memory_load_result.i.i27 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i.i, align 1
  %addition_result.i.i28 = add i256 %memory_load_result.i.i27, 4
  %memory_store_pointer5.i.i = inttoptr i256 %addition_result.i.i28 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5.i.i, align 1
  %addition_result7.i.i = add i256 %memory_load_result.i.i27, 36
  %memory_store_pointer8.i.i = inttoptr i256 %addition_result7.i.i to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8.i.i, align 1
  %addition_result10.i.i = add i256 %memory_load_result.i.i27, 68
  %memory_store_pointer11.i.i = inttoptr i256 %addition_result10.i.i to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11.i.i, align 1
  %11 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i27, i256 4294967295)
  %exit_offset_shifted.i.i.i29 = shl nuw nsw i256 %11, 64
  %exit_abi_data.i.i.i30 = or i256 %exit_offset_shifted.i.i.i29, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i30)
  unreachable

fun_sub.exit.i:                                   ; preds = %__system_request.exit.i26
  %subtraction_result.i.i = sub i256 %system_request_child_address.i.i24, %shift_right_non_overflow_result.i
  %12 = tail call i256 @llvm.umin.i256(i256 %subtraction_result.i.i, i256 300)
  %memory_load_result39.i = load i256, ptr addrspace(1) %memory_store_pointer.i12, align 1
  %and_result40.i = and i256 %memory_load_result39.i, 105312291668557186697918027683670432318895095400549111254310977535
  %comparison_result.i54.i = icmp eq i256 %and_result40.i, 0
  br i1 %comparison_result.i54.i, label %fun_mul.exit.i, label %if_join8.i.i

if_join8.i.i:                                     ; preds = %fun_sub.exit.i
  %subtraction_result.i = sub nuw nsw i256 300, %12
  %multiplication_result.i.i = mul nsw i256 %and_result40.i, %subtraction_result.i
  %division_result_non_zero.i.i.i = udiv i256 %multiplication_result.i.i, %and_result40.i
  %comparison_result14.not.i.i = icmp eq i256 %division_result_non_zero.i.i.i, %subtraction_result.i
  br i1 %comparison_result14.not.i.i, label %fun_mul.exit.i, label %if_main19.i.i

if_main19.i.i:                                    ; preds = %if_join8.i.i
  %memory_load_result.i55.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i56.i = inttoptr i256 %memory_load_result.i55.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i56.i, align 1
  %addition_result.i57.i = add i256 %memory_load_result.i55.i, 4
  %memory_store_pointer23.i.i = inttoptr i256 %addition_result.i57.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i.i, align 1
  %addition_result25.i.i = add i256 %memory_load_result.i55.i, 36
  %memory_store_pointer26.i.i = inttoptr i256 %addition_result25.i.i to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i.i, align 1
  %addition_result28.i.i = add i256 %memory_load_result.i55.i, 68
  %memory_store_pointer29.i.i = inttoptr i256 %addition_result28.i.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i.i, align 1
  %addition_result31.i.i = add i256 %memory_load_result.i55.i, 100
  %memory_store_pointer32.i.i = inttoptr i256 %addition_result31.i.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i.i, align 1
  %13 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i55.i, i256 4294967295)
  %exit_offset_shifted.i.i58.i = shl nuw nsw i256 %13, 64
  %exit_abi_data.i.i59.i = or i256 %exit_offset_shifted.i.i58.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i59.i)
  unreachable

fun_mul.exit.i:                                   ; preds = %if_join8.i.i, %fun_sub.exit.i
  %return_pointer.0.i.i = phi i256 [ 0, %fun_sub.exit.i ], [ %multiplication_result.i.i, %if_join8.i.i ]
  %comparison_result.i60.i = icmp eq i256 %return_pointer.0.i, 0
  br i1 %comparison_result.i60.i, label %fun_mul.exit83.i, label %if_join.i64.i

if_join.i64.i:                                    ; preds = %fun_mul.exit.i
  %division_result_non_zero.i62.i = udiv i256 -1, %return_pointer.0.i
  %comparison_result4.i63.i = icmp ult i256 %division_result_non_zero.i62.i, %12
  br i1 %comparison_result4.i63.i, label %if_main7.i65.i, label %if_join8.i69.i

if_main7.i65.i:                                   ; preds = %if_join.i64.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i69.i:                                   ; preds = %if_join.i64.i
  %multiplication_result.i66.i = mul i256 %12, %return_pointer.0.i
  %division_result_non_zero.i.i67.i = udiv i256 %multiplication_result.i66.i, %return_pointer.0.i
  %comparison_result14.not.i68.i = icmp eq i256 %division_result_non_zero.i.i67.i, %12
  br i1 %comparison_result14.not.i68.i, label %fun_mul.exit83.i, label %if_main19.i82.i

if_main19.i82.i:                                  ; preds = %if_join8.i69.i
  %memory_load_result.i70.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i71.i = inttoptr i256 %memory_load_result.i70.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i71.i, align 1
  %addition_result.i72.i = add i256 %memory_load_result.i70.i, 4
  %memory_store_pointer23.i73.i = inttoptr i256 %addition_result.i72.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i73.i, align 1
  %addition_result25.i74.i = add i256 %memory_load_result.i70.i, 36
  %memory_store_pointer26.i75.i = inttoptr i256 %addition_result25.i74.i to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i75.i, align 1
  %addition_result28.i76.i = add i256 %memory_load_result.i70.i, 68
  %memory_store_pointer29.i77.i = inttoptr i256 %addition_result28.i76.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i77.i, align 1
  %addition_result31.i78.i = add i256 %memory_load_result.i70.i, 100
  %memory_store_pointer32.i79.i = inttoptr i256 %addition_result31.i78.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i79.i, align 1
  %14 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i70.i, i256 4294967295)
  %exit_offset_shifted.i.i80.i = shl nuw nsw i256 %14, 64
  %exit_abi_data.i.i81.i = or i256 %exit_offset_shifted.i.i80.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i81.i)
  unreachable

fun_mul.exit83.i:                                 ; preds = %if_join8.i69.i, %fun_mul.exit.i
  %return_pointer.0.i61.i = phi i256 [ 0, %fun_mul.exit.i ], [ %multiplication_result.i66.i, %if_join8.i69.i ]
  %xor_result.i.i.i = xor i256 %return_pointer.0.i61.i, -1
  %comparison_result.i.i.i = icmp ugt i256 %return_pointer.0.i.i, %xor_result.i.i.i
  br i1 %comparison_result.i.i.i, label %if_main.i.i.i, label %checked_add_uint256.exit.i.i

if_main.i.i.i:                                    ; preds = %fun_mul.exit83.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i.i:                     ; preds = %fun_mul.exit83.i
  %addition_result.i.i.i = add i256 %return_pointer.0.i61.i, %return_pointer.0.i.i
  %comparison_result.i84.i = icmp ult i256 %addition_result.i.i.i, %return_pointer.0.i.i
  br i1 %comparison_result.i84.i, label %if_main.i90.i, label %fun_current.exit

if_main.i90.i:                                    ; preds = %checked_add_uint256.exit.i.i
  %memory_load_result.i85.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i86.i = inttoptr i256 %memory_load_result.i85.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i86.i, align 1
  %addition_result.i87.i = add i256 %memory_load_result.i85.i, 4
  %memory_store_pointer7.i.i = inttoptr i256 %addition_result.i87.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i.i, align 1
  %addition_result9.i.i = add i256 %memory_load_result.i85.i, 36
  %memory_store_pointer10.i.i = inttoptr i256 %addition_result9.i.i to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i.i, align 1
  %addition_result12.i.i = add i256 %memory_load_result.i85.i, 68
  %memory_store_pointer13.i.i = inttoptr i256 %addition_result12.i.i to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i.i, align 1
  %15 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i85.i, i256 4294967295)
  %exit_offset_shifted.i.i88.i = shl nuw nsw i256 %15, 64
  %exit_abi_data.i.i89.i = or i256 %exit_offset_shifted.i.i88.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i89.i)
  unreachable

fun_current.exit:                                 ; preds = %checked_add_uint256.exit.i.i
  %division_result_non_zero.i92.i = udiv i256 %addition_result.i.i.i, 300
  %16 = tail call i256 @llvm.umin.i256(i256 %division_result_non_zero.i92.i, i256 %return_pointer.0.i)
  ret i256 %16
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc void @modifier_nonReentrant(i256 %0, i256 %1) unnamed_addr #6 personality ptr @__personality {
entry:
  %storage_load = tail call i256 @llvm.syncvm.sload(i256 5)
  %comparison_result.not = icmp eq i256 %storage_load, 2
  br i1 %comparison_result.not, label %if_main.i, label %require_helper_stringliteral_ebf7.exit

if_main.i:                                        ; preds = %entry
  %memory_load_result.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i, align 1
  %addition_result.i = add i256 %memory_load_result.i, 4
  %memory_store_pointer4.i = inttoptr i256 %addition_result.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i, align 1
  %addition_result6.i = add i256 %memory_load_result.i, 36
  %memory_store_pointer7.i = inttoptr i256 %addition_result6.i to ptr addrspace(1)
  store i256 31, ptr addrspace(1) %memory_store_pointer7.i, align 1
  %addition_result9.i = add i256 %memory_load_result.i, 68
  %memory_store_pointer10.i = inttoptr i256 %addition_result9.i to ptr addrspace(1)
  store i256 37268805191608899176760263720700790282416321829889089033725955971341467020288, ptr addrspace(1) %memory_store_pointer10.i, align 1
  %2 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i, i256 4294967295)
  %exit_offset_shifted.i.i = shl nuw nsw i256 %2, 64
  %exit_abi_data.i.i = or i256 %exit_offset_shifted.i.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i)
  unreachable

require_helper_stringliteral_ebf7.exit:           ; preds = %entry
  tail call void @llvm.syncvm.sstore(i256 5, i256 2)
  %storage_load3 = tail call i256 @llvm.syncvm.sload(i256 2)
  %caller = tail call i256 @llvm.syncvm.caller()
  %and_result.i = and i256 %caller, 1461501637330902918203684832716283019655932542975
  %comparison_result.i78 = icmp eq i256 %and_result.i, 0
  br i1 %comparison_result.i78, label %if_main.i85, label %if_join.i

if_main.i85:                                      ; preds = %require_helper_stringliteral_ebf7.exit
  %memory_load_result.i79 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i80 = inttoptr i256 %memory_load_result.i79 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i80, align 1
  %addition_result.i81 = add i256 %memory_load_result.i79, 4
  %memory_store_pointer10.i82 = inttoptr i256 %addition_result.i81 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer10.i82, align 1
  %addition_result12.i = add i256 %memory_load_result.i79, 36
  %memory_store_pointer13.i = inttoptr i256 %addition_result12.i to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer13.i, align 1
  %addition_result15.i = add i256 %memory_load_result.i79, 68
  %memory_store_pointer16.i = inttoptr i256 %addition_result15.i to ptr addrspace(1)
  store i256 31354931781638678494316026001340845558170976982936511063842609339963588896115, ptr addrspace(1) %memory_store_pointer16.i, align 1
  %addition_result18.i = add i256 %memory_load_result.i79, 100
  %memory_store_pointer19.i = inttoptr i256 %addition_result18.i to ptr addrspace(1)
  store i256 52015977587075634662932278421871521105961125924018222127100086566054726205440, ptr addrspace(1) %memory_store_pointer19.i, align 1
  %3 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i79, i256 4294967295)
  %exit_offset_shifted.i.i83 = shl nuw nsw i256 %3, 64
  %exit_abi_data.i.i84 = or i256 %exit_offset_shifted.i.i83, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i84)
  unreachable

if_join.i:                                        ; preds = %require_helper_stringliteral_ebf7.exit
  store i256 %and_result.i, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i.i = tail call i256 @llvm.syncvm.gasleft()
  %4 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i.i, i256 4294967295)
  %abi_data_gas_shifted.i.i.i = shl nuw nsw i256 %4, 192
  %abi_data_add_system_call_marker.i.i.i = or i256 %abi_data_gas_shifted.i.i.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i, label %keccak256_failure_block.i.i.i

keccak256_failure_block.i.i.i:                    ; preds = %if_join.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i: ; preds = %if_join.i
  %keccak256_call_external_result_abi_data_pointer.i.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i.i, 0
  %keccak256_child_data.i.i.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i.i, align 1
  %storage_load.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i.i)
  %comparison_result24.i = icmp ult i256 %storage_load.i, %0
  br i1 %comparison_result24.i, label %if_main27.i, label %if_join28.i

if_main27.i:                                      ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i
  %memory_load_result29.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer36.i = inttoptr i256 %memory_load_result29.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer36.i, align 1
  %addition_result38.i = add i256 %memory_load_result29.i, 4
  %memory_store_pointer39.i = inttoptr i256 %addition_result38.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer39.i, align 1
  %addition_result41.i = add i256 %memory_load_result29.i, 36
  %memory_store_pointer42.i = inttoptr i256 %addition_result41.i to ptr addrspace(1)
  store i256 34, ptr addrspace(1) %memory_store_pointer42.i, align 1
  %addition_result44.i = add i256 %memory_load_result29.i, 68
  %memory_store_pointer45.i = inttoptr i256 %addition_result44.i to ptr addrspace(1)
  store i256 31354931781638678494316026001312189103416802390932084224065329695412615668078, ptr addrspace(1) %memory_store_pointer45.i, align 1
  %addition_result47.i = add i256 %memory_load_result29.i, 100
  %memory_store_pointer48.i = inttoptr i256 %addition_result47.i to ptr addrspace(1)
  store i256 44957423563285989266247004906403561635230327756000124389404269791890710200320, ptr addrspace(1) %memory_store_pointer48.i, align 1
  %5 = tail call i256 @llvm.umin.i256(i256 %memory_load_result29.i, i256 4294967295)
  %exit_offset_shifted.i72.i = shl nuw nsw i256 %5, 64
  %exit_abi_data.i73.i = or i256 %exit_offset_shifted.i72.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i73.i)
  unreachable

if_join28.i:                                      ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit.i
  store i256 %and_result.i, ptr addrspace(1) null, align 4294967296
  store i256 0, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i76.i = tail call i256 @llvm.syncvm.gasleft()
  %6 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i76.i, i256 4294967295)
  %abi_data_gas_shifted.i.i77.i = shl nuw nsw i256 %6, 192
  %abi_data_add_system_call_marker.i.i78.i = or i256 %abi_data_gas_shifted.i.i77.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i79.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i78.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i80.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i79.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i80.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit84.i, label %keccak256_failure_block.i.i81.i

keccak256_failure_block.i.i81.i:                  ; preds = %if_join28.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit84.i: ; preds = %if_join28.i
  %subtraction_result52.i = sub i256 %storage_load.i, %0
  %keccak256_call_external_result_abi_data_pointer.i.i82.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i79.i, 0
  %keccak256_child_data.i.i83.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i82.i, align 1
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i83.i, i256 %subtraction_result52.i)
  %storage_load56.i = tail call i256 @llvm.syncvm.sload(i256 2)
  %comparison_result.i.i = icmp ult i256 %storage_load56.i, %0
  br i1 %comparison_result.i.i, label %if_main.i.i, label %checked_sub_uint256.exit.i

if_main.i.i:                                      ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit84.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_sub_uint256.exit.i:                       ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14866.exit84.i
  %subtraction_result.i.i = sub i256 %storage_load56.i, %0
  tail call void @llvm.syncvm.sstore(i256 2, i256 %subtraction_result.i.i)
  %memory_load_result57.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i = inttoptr i256 %memory_load_result57.i to ptr addrspace(1)
  store i256 %0, ptr addrspace(1) %memory_store_pointer.i.i, align 1
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %7 = tail call i256 @llvm.umin.i256(i256 %memory_load_result57.i, i256 4294967295)
  %8 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_input_offset_shifted.i = shl nuw nsw i256 %7, 64
  %abi_data_gas_shifted.i = shl nuw nsw i256 %8, 192
  %abi_data_offset_and_length.i = or i256 %abi_data_gas_shifted.i, %abi_data_input_offset_shifted.i
  %abi_data_add_system_call_marker.i = or i256 %abi_data_offset_and_length.i, 904625697166532776746648320380374280103671757735618107014721178055227736064
  %event_writer_call_external.i = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker.i, i256 32781, i256 3, i256 -15402802100530019096323380498944738953123845089667699673314898783681816316945, i256 %and_result.i, i256 0, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %event_writer_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %event_writer_call_external.i, 1
  br i1 %event_writer_external_result_status_code_boolean.i, label %for_condition.preheader, label %event_failure_block.i

for_condition.preheader:                          ; preds = %checked_sub_uint256.exit.i
  %storage_load5453 = tail call i256 @llvm.syncvm.sload(i256 8)
  %comparison_result7.not454.not = icmp eq i256 %storage_load5453, 0
  br i1 %comparison_result7.not454.not, label %if_main, label %storage_array_index_access_contract_IERC20_dyn.exit.lr.ph

storage_array_index_access_contract_IERC20_dyn.exit.lr.ph: ; preds = %for_condition.preheader
  %address = tail call i256 @llvm.syncvm.this()
  %and_result12.i = and i256 %address, 1461501637330902918203684832716283019655932542975
  %comparison_result.i109 = icmp eq i256 %storage_load3, 0
  %cond56.i = icmp eq i256 %and_result.i, 4
  %memory_load_pointer = inttoptr i256 %1 to ptr addrspace(1)
  %addition_result.i153 = add i256 %1, 32
  %comparison_result.i172 = icmp ult i256 %storage_load3, %0
  %subtraction_result.i = sub i256 %storage_load3, %0
  %xor_result.i.i.i = sub i256 0, %storage_load3
  %addition_result28.i229 = add i256 %storage_load3, -1
  br label %storage_array_index_access_contract_IERC20_dyn.exit

event_failure_block.i:                            ; preds = %checked_sub_uint256.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_main:                                          ; preds = %fun_scale.exit437, %for_condition.preheader
  %memory_load_result55 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i87 = inttoptr i256 %memory_load_result55 to ptr addrspace(1)
  store i256 %0, ptr addrspace(1) %memory_store_pointer.i87, align 1
  %gas_left = tail call i256 @llvm.syncvm.gasleft()
  %9 = tail call i256 @llvm.umin.i256(i256 %memory_load_result55, i256 4294967295)
  %10 = tail call i256 @llvm.umin.i256(i256 %gas_left, i256 4294967295)
  %abi_data_input_offset_shifted = shl nuw nsw i256 %9, 64
  %abi_data_gas_shifted = shl nuw nsw i256 %10, 192
  %abi_data_offset_and_length = or i256 %abi_data_gas_shifted, %abi_data_input_offset_shifted
  %abi_data_add_system_call_marker = or i256 %abi_data_offset_and_length, 904625697166532776746648320380374280103671757735618107014721178055227736064
  %event_writer_call_external = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker, i256 32781, i256 2, i256 50893955706639834605299804440155310915055312867673792774376955235295819007445, i256 %caller, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %event_writer_external_result_status_code_boolean = extractvalue { ptr addrspace(3), i1 } %event_writer_call_external, 1
  br i1 %event_writer_external_result_status_code_boolean, label %event_join_block, label %event_failure_block

storage_array_index_access_contract_IERC20_dyn.exit: ; preds = %storage_array_index_access_contract_IERC20_dyn.exit.lr.ph, %fun_scale.exit437
  %var_i.0455 = phi i256 [ 0, %storage_array_index_access_contract_IERC20_dyn.exit.lr.ph ], [ %addition_result.i440, %fun_scale.exit437 ]
  store i256 8, ptr addrspace(1) null, align 4294967296
  %addition_result.i90 = add i256 %var_i.0455, -5442482557903504250613150719145357533886713417884903185095341029921719619869
  %storage_load12 = tail call i256 @llvm.syncvm.sload(i256 %addition_result.i90)
  %phi.bo.i = and i256 %storage_load12, 1461501637330902918203684832716283019655932542975
  %comparison_result.not.i92 = icmp eq i256 %phi.bo.i, 0
  br i1 %comparison_result.not.i92, label %switch_default_block.i, label %switch_case_branch_1_block.i

switch_case_branch_1_block.i:                     ; preds = %storage_array_index_access_contract_IERC20_dyn.exit
  %memory_load_result.i93 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i94 = inttoptr i256 %memory_load_result.i93 to ptr addrspace(1)
  store i256 50942633119752846454219349998365661925608737367104304655302372697894809501696, ptr addrspace(1) %memory_store_pointer.i94, align 1
  %addition_result.i95 = add i256 %memory_load_result.i93, 4
  %memory_store_pointer14.i = inttoptr i256 %addition_result.i95 to ptr addrspace(1)
  store i256 %and_result12.i, ptr addrspace(1) %memory_store_pointer14.i, align 1
  %gas_left.i96 = tail call i256 @llvm.syncvm.gasleft()
  %cond40.i = icmp eq i256 %phi.bo.i, 4
  br i1 %cond40.i, label %if_join.i99, label %contract_call_ordinary_block.i

contract_call_ordinary_block.i:                   ; preds = %switch_case_branch_1_block.i
  %11 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i93, i256 4294967295)
  %12 = tail call i256 @llvm.umin.i256(i256 %gas_left.i96, i256 4294967295)
  %abi_data_input_offset_shifted.i.i = shl nuw nsw i256 %11, 64
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %12, 192
  %abi_data_offset_and_length.i.i = or i256 %abi_data_gas_shifted.i.i, %abi_data_input_offset_shifted.i.i
  %abi_data_add_gas.i.i = or i256 %abi_data_offset_and_length.i.i, 2852213850513516153367582212096
  %contract_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_gas.i.i, i256 %phi.bo.i, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 0
  %contract_call_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 1
  %contract_call_memcpy_from_child_pointer_casted.i.i = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i.i to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i.i = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i.i, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i.i = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i.i, 4294967295
  %13 = tail call i256 @llvm.umin.i256(i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i256 32)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %memory_store_pointer.i94, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i, i256 %13, i1 false)
  store ptr addrspace(3) %contract_call_external_result_abi_data.i.i, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, ptr @returndatasize, align 32
  br i1 %contract_call_external_result_status_code_boolean.i.i, label %if_join.i99, label %if_main.i97

if_main.i97:                                      ; preds = %contract_call_ordinary_block.i
  %contract_call_external_result_abi_data.i.i.le = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 0
  %memory_load_result.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i.i = inttoptr i256 %memory_load_result.i.i to ptr addrspace(1)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i.le, i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i1 false)
  %returndatasize3.i.i = load i256, ptr @returndatasize, align 32
  %14 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i, i256 4294967295)
  %15 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i = shl nuw nsw i256 %14, 64
  %exit_length_shifted.i.i.i = shl nuw nsw i256 %15, 96
  %exit_abi_data.i.i.i = or i256 %exit_length_shifted.i.i.i, %exit_offset_shifted.i.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i)
  unreachable

if_join.i99:                                      ; preds = %contract_call_ordinary_block.i, %switch_case_branch_1_block.i
  %returndatasize.i = load i256, ptr @returndatasize, align 32
  %16 = tail call i256 @llvm.umin.i256(i256 %returndatasize.i, i256 32)
  %addition_result.i.i = add nuw nsw i256 %16, 31
  %and_result.i.i = and i256 %addition_result.i.i, 96
  %addition_result3.i.i = add i256 %and_result.i.i, %memory_load_result.i93
  %comparison_result.i.i98 = icmp ult i256 %addition_result3.i.i, %memory_load_result.i93
  %comparison_result7.i.i = icmp ugt i256 %addition_result3.i.i, 18446744073709551615
  %or_result13.i.i = or i1 %comparison_result7.i.i, %comparison_result.i.i98
  br i1 %or_result13.i.i, label %if_main.i.i100, label %finalize_allocation.exit.i

if_main.i.i100:                                   ; preds = %if_join.i99
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit.i:                       ; preds = %if_join.i99
  store i256 %addition_result3.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %comparison_result.i44.i = icmp ult i256 %returndatasize.i, 32
  br i1 %comparison_result.i44.i, label %if_main.i45.i, label %abi_decode_uint256_fromMemory.exit.i

if_main.i45.i:                                    ; preds = %finalize_allocation.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_uint256_fromMemory.exit.i:             ; preds = %finalize_allocation.exit.i
  %memory_load_result.i46.i = load i256, ptr addrspace(1) %memory_store_pointer.i94, align 1
  br label %fun_uniBalanceOf.exit

switch_default_block.i:                           ; preds = %storage_array_index_access_contract_IERC20_dyn.exit
  store i256 -44877977326897262784168444354156441158329539312518651612887364914072161059015, ptr addrspace(2) null, align 4294967296
  store i256 %address, ptr addrspace(2) inttoptr (i256 4 to ptr addrspace(2)), align 4
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %17 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_gas_shifted.i47.i = shl nuw nsw i256 %17, 192
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_gas_shifted.i47.i, 904625751086426111047927909714404454142933105326819602152923490636624035840
  %system_request.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i, i256 32778, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 1
  br i1 %system_request_result_status_code_boolean.i.i, label %__system_request.exit.i, label %system_request_error_block.i.i

system_request_error_block.i.i:                   ; preds = %switch_default_block.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i:                          ; preds = %switch_default_block.i
  %system_request_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 0
  %system_request_child_address.i.i = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i, align 1
  br label %fun_uniBalanceOf.exit

fun_uniBalanceOf.exit:                            ; preds = %abi_decode_uint256_fromMemory.exit.i, %__system_request.exit.i
  %return_pointer.0.i = phi i256 [ %memory_load_result.i46.i, %abi_decode_uint256_fromMemory.exit.i ], [ %system_request_child_address.i.i, %__system_request.exit.i ]
  %comparison_result.i101 = icmp eq i256 %return_pointer.0.i, 0
  br i1 %comparison_result.i101, label %fun_mul.exit, label %if_join.i103

if_join.i103:                                     ; preds = %fun_uniBalanceOf.exit
  %division_result_non_zero.i = udiv i256 -1, %return_pointer.0.i
  %comparison_result4.i = icmp ult i256 %division_result_non_zero.i, %0
  br i1 %comparison_result4.i, label %if_main7.i, label %if_join8.i

if_main7.i:                                       ; preds = %if_join.i103
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i:                                       ; preds = %if_join.i103
  %multiplication_result.i = mul i256 %return_pointer.0.i, %0
  %division_result_non_zero.i.i = udiv i256 %multiplication_result.i, %return_pointer.0.i
  %comparison_result14.not.i = icmp eq i256 %division_result_non_zero.i.i, %0
  br i1 %comparison_result14.not.i, label %fun_mul.exit, label %if_main19.i

if_main19.i:                                      ; preds = %if_join8.i
  %memory_load_result.i104 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i105 = inttoptr i256 %memory_load_result.i104 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i105, align 1
  %addition_result.i106 = add i256 %memory_load_result.i104, 4
  %memory_store_pointer23.i = inttoptr i256 %addition_result.i106 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i, align 1
  %addition_result25.i = add i256 %memory_load_result.i104, 36
  %memory_store_pointer26.i = inttoptr i256 %addition_result25.i to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i, align 1
  %addition_result28.i = add i256 %memory_load_result.i104, 68
  %memory_store_pointer29.i = inttoptr i256 %addition_result28.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i, align 1
  %addition_result31.i = add i256 %memory_load_result.i104, 100
  %memory_store_pointer32.i = inttoptr i256 %addition_result31.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i, align 1
  %18 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i104, i256 4294967295)
  %exit_offset_shifted.i.i107 = shl nuw nsw i256 %18, 64
  %exit_abi_data.i.i108 = or i256 %exit_offset_shifted.i.i107, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i108)
  unreachable

fun_mul.exit:                                     ; preds = %fun_uniBalanceOf.exit, %if_join8.i
  %return_pointer.0.i102 = phi i256 [ 0, %fun_uniBalanceOf.exit ], [ %multiplication_result.i, %if_join8.i ]
  br i1 %comparison_result.i109, label %if_main.i120, label %fun_div.exit

if_main.i120:                                     ; preds = %fun_mul.exit
  %memory_load_result.i110 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i111 = inttoptr i256 %memory_load_result.i110 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i111, align 1
  %addition_result.i112 = add i256 %memory_load_result.i110, 4
  %memory_store_pointer4.i113 = inttoptr i256 %addition_result.i112 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i113, align 1
  %addition_result6.i114 = add i256 %memory_load_result.i110, 36
  %memory_store_pointer7.i115 = inttoptr i256 %addition_result6.i114 to ptr addrspace(1)
  store i256 26, ptr addrspace(1) %memory_store_pointer7.i115, align 1
  %addition_result9.i116 = add i256 %memory_load_result.i110, 68
  %memory_store_pointer10.i117 = inttoptr i256 %addition_result9.i116 to ptr addrspace(1)
  store i256 37714057306925736537727338326753656978887423192446994710127794316522513498112, ptr addrspace(1) %memory_store_pointer10.i117, align 1
  %19 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i110, i256 4294967295)
  %exit_offset_shifted.i.i118 = shl nuw nsw i256 %19, 64
  %exit_abi_data.i.i119 = or i256 %exit_offset_shifted.i.i118, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i119)
  unreachable

fun_div.exit:                                     ; preds = %fun_mul.exit
  %division_result_non_zero.i.i121 = udiv i256 %return_pointer.0.i102, %storage_load3
  %comparison_result.i123 = icmp ugt i256 %storage_load3, %return_pointer.0.i102
  br i1 %comparison_result.i123, label %fun_uniTransfer.exit, label %if_main.i125

if_main.i125:                                     ; preds = %fun_div.exit
  br i1 %comparison_result.not.i92, label %switch_default_block.i143, label %switch_case_branch_1_block.i132

switch_case_branch_1_block.i132:                  ; preds = %if_main.i125
  %memory_load_result.i127 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %addition_result.i128 = add i256 %memory_load_result.i127, 32
  %memory_store_pointer.i129 = inttoptr i256 %addition_result.i128 to ptr addrspace(1)
  store i256 -39341301877480157781710804024396230103289065588583741745104145964028735258624, ptr addrspace(1) %memory_store_pointer.i129, align 1
  %addition_result19.i = add i256 %memory_load_result.i127, 36
  %memory_store_pointer20.i = inttoptr i256 %addition_result19.i to ptr addrspace(1)
  store i256 %and_result.i, ptr addrspace(1) %memory_store_pointer20.i, align 1
  %addition_result23.i = add i256 %memory_load_result.i127, 68
  %memory_store_pointer24.i = inttoptr i256 %addition_result23.i to ptr addrspace(1)
  store i256 %division_result_non_zero.i.i121, ptr addrspace(1) %memory_store_pointer24.i, align 1
  %memory_store_pointer26.i130 = inttoptr i256 %memory_load_result.i127 to ptr addrspace(1)
  store i256 68, ptr addrspace(1) %memory_store_pointer26.i130, align 1
  %addition_result28.i131 = add i256 %memory_load_result.i127, 128
  %20 = icmp ugt i256 %memory_load_result.i127, 18446744073709551487
  br i1 %20, label %if_main37.i, label %if_join38.i

if_main37.i:                                      ; preds = %switch_case_branch_1_block.i132
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join38.i:                                      ; preds = %switch_case_branch_1_block.i132
  store i256 %addition_result28.i131, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %21 = icmp ugt i256 %addition_result28.i131, 18446744073709551551
  br i1 %21, label %if_main.i.i.i, label %finalize_allocation_14877.exit.i.i

if_main.i.i.i:                                    ; preds = %if_join38.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation_14877.exit.i.i:               ; preds = %if_join38.i
  %addition_result.i.i.i = add i256 %memory_load_result.i127, 192
  store i256 %addition_result.i.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i133 = inttoptr i256 %addition_result28.i131 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer.i.i133, align 1
  %addition_result.i.i134 = add i256 %memory_load_result.i127, 160
  %memory_store_pointer7.i.i = inttoptr i256 %addition_result.i.i134 to ptr addrspace(1)
  store i256 37714057306076988483118529490347679105585116642029194716945419020321082336612, ptr addrspace(1) %memory_store_pointer7.i.i, align 1
  store i256 10867283408178898638301172343726954674910073630256871736220740970449699113859, ptr addrspace(2) null, align 4294967296
  store i256 %phi.bo.i, ptr addrspace(2) inttoptr (i256 4 to ptr addrspace(2)), align 4
  %gas_left.i.i.i135 = tail call i256 @llvm.syncvm.gasleft()
  %22 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i.i135, i256 4294967295)
  %abi_data_gas_shifted.i.i.i136 = shl nuw nsw i256 %22, 192
  %abi_data_add_system_call_marker.i.i.i137 = or i256 %abi_data_gas_shifted.i.i.i136, 904625751086426111047927909714404454142933105326819602152923490636624035840
  %system_request.i.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i.i137, i256 32770, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i, 1
  br i1 %system_request_result_status_code_boolean.i.i.i, label %__system_request.exit.i.i, label %system_request_error_block.i.i.i

system_request_error_block.i.i.i:                 ; preds = %finalize_allocation_14877.exit.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i.i:                        ; preds = %finalize_allocation_14877.exit.i.i
  %system_request_result_abi_data.i.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i, 0
  %system_request_child_address.i.i.i = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i.i, align 1
  %comparison_result.i.i138 = icmp eq i256 %system_request_child_address.i.i.i, 0
  br i1 %comparison_result.i.i138, label %if_main.i.i141, label %if_join.i.i

if_main.i.i141:                                   ; preds = %__system_request.exit.i.i
  %memory_load_result9.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer16.i.i = inttoptr i256 %memory_load_result9.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer16.i.i, align 1
  %addition_result19.i.i = add i256 %memory_load_result9.i.i, 4
  %memory_store_pointer20.i.i = inttoptr i256 %addition_result19.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer20.i.i, align 1
  %addition_result22.i.i = add i256 %memory_load_result9.i.i, 36
  %memory_store_pointer23.i.i = inttoptr i256 %addition_result22.i.i to ptr addrspace(1)
  store i256 29, ptr addrspace(1) %memory_store_pointer23.i.i, align 1
  %addition_result25.i.i = add i256 %memory_load_result9.i.i, 68
  %memory_store_pointer26.i.i = inttoptr i256 %addition_result25.i.i to ptr addrspace(1)
  store i256 29577713123142787666064487680123823951345158729797978021083438401868913442816, ptr addrspace(1) %memory_store_pointer26.i.i, align 1
  %23 = tail call i256 @llvm.umin.i256(i256 %memory_load_result9.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i139 = shl nuw nsw i256 %23, 64
  %exit_abi_data.i.i.i140 = or i256 %exit_offset_shifted.i.i.i139, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i140)
  unreachable

if_join.i.i:                                      ; preds = %__system_request.exit.i.i
  %memory_load_result29.i.i = load i256, ptr addrspace(1) %memory_store_pointer26.i130, align 1
  %gas_left.i.i142 = tail call i256 @llvm.syncvm.gasleft()
  %cond.i.i = icmp eq i256 %phi.bo.i, 4
  br i1 %cond.i.i, label %contract_call_join_block.i.i, label %contract_call_ordinary_block.i.i

contract_call_ordinary_block.i.i:                 ; preds = %if_join.i.i
  %24 = tail call i256 @llvm.umin.i256(i256 %addition_result.i128, i256 4294967295)
  %25 = tail call i256 @llvm.umin.i256(i256 %memory_load_result29.i.i, i256 4294967295)
  %26 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i142, i256 4294967295)
  %abi_data_input_offset_shifted.i.i.i = shl nuw nsw i256 %24, 64
  %abi_data_input_length_shifted.i.i.i = shl nuw nsw i256 %25, 96
  %abi_data_gas_shifted.i65.i.i = shl nuw nsw i256 %26, 192
  %abi_data_offset_and_length.i.i.i = or i256 %abi_data_input_length_shifted.i.i.i, %abi_data_input_offset_shifted.i.i.i
  %abi_data_add_gas.i.i.i = or i256 %abi_data_offset_and_length.i.i.i, %abi_data_gas_shifted.i65.i.i
  %contract_call_external.i.i.i = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_gas.i.i.i, i256 %phi.bo.i, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i.i, 0
  %contract_call_external_result_status_code_boolean.i.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i.i, 1
  %contract_call_external_result_status_code.i.i.i = zext i1 %contract_call_external_result_status_code_boolean.i.i.i to i256
  %contract_call_memcpy_from_child_pointer_casted.i.i.i = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i.i.i to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i.i.i = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i.i.i, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i.i.i = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i.i.i, 4294967295
  store ptr addrspace(3) %contract_call_external_result_abi_data.i.i.i, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i.i, ptr @returndatasize, align 32
  br label %contract_call_join_block.i.i

contract_call_join_block.i.i:                     ; preds = %contract_call_ordinary_block.i.i, %if_join.i.i
  %storemerge.i.i = phi i256 [ %contract_call_external_result_status_code.i.i.i, %contract_call_ordinary_block.i.i ], [ 1, %if_join.i.i ]
  %returndatasize.i.i.i = load i256, ptr @returndatasize, align 32
  %cond.i.i.i = icmp eq i256 %returndatasize.i.i.i, 0
  br i1 %cond.i.i.i, label %extract_returndata.exit.i.i, label %switch_default_block.i.i.i

switch_default_block.i.i.i:                       ; preds = %contract_call_join_block.i.i
  %memory_load_result.i.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %27 = add i256 %returndatasize.i.i.i, 63
  %and_result.i.i.i.i = and i256 %27, -32
  %addition_result3.i.i.i.i = add i256 %memory_load_result.i.i.i, %and_result.i.i.i.i
  %comparison_result.i.i.i.i = icmp ult i256 %addition_result3.i.i.i.i, %memory_load_result.i.i.i
  %comparison_result7.i.i.i.i = icmp ugt i256 %addition_result3.i.i.i.i, 18446744073709551615
  %or_result13.i.i.i.i = or i1 %comparison_result7.i.i.i.i, %comparison_result.i.i.i.i
  br i1 %or_result13.i.i.i.i, label %if_main.i.i.i.i, label %finalize_allocation.exit.i.i.i

if_main.i.i.i.i:                                  ; preds = %switch_default_block.i.i.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit.i.i.i:                   ; preds = %switch_default_block.i.i.i
  store i256 %addition_result3.i.i.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i.i = inttoptr i256 %memory_load_result.i.i.i to ptr addrspace(1)
  store i256 %returndatasize.i.i.i, ptr addrspace(1) %memory_store_pointer.i.i.i, align 1
  %addition_result11.i.i.i = add i256 %memory_load_result.i.i.i, 32
  %returndatasize9.i.i.i = load i256, ptr @returndatasize, align 32
  %return_data_copy_destination_pointer.i.i.i = inttoptr i256 %addition_result11.i.i.i to ptr addrspace(1)
  %return_data_pointer.i.i.i = load ptr addrspace(3), ptr @ptr_return_data, align 32
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i.i, ptr addrspace(3) align 1 %return_data_pointer.i.i.i, i256 %returndatasize9.i.i.i, i1 false)
  br label %extract_returndata.exit.i.i

extract_returndata.exit.i.i:                      ; preds = %finalize_allocation.exit.i.i.i, %contract_call_join_block.i.i
  %return_pointer.0.i.i.i = phi i256 [ %memory_load_result.i.i.i, %finalize_allocation.exit.i.i.i ], [ 96, %contract_call_join_block.i.i ]
  %cond.i66.i.i = icmp eq i256 %storemerge.i.i, 0
  %memory_load_pointer.i.i.i = inttoptr i256 %return_pointer.0.i.i.i to ptr addrspace(1)
  %memory_load_result.i67.i.i = load i256, ptr addrspace(1) %memory_load_pointer.i.i.i, align 1
  %comparison_result.not.i.i.i = icmp eq i256 %memory_load_result.i67.i.i, 0
  br i1 %cond.i66.i.i, label %switch_case_branch_1_block.i.i.i, label %fun_verifyCallResult.exit.i.i

switch_case_branch_1_block.i.i.i:                 ; preds = %extract_returndata.exit.i.i
  br i1 %comparison_result.not.i.i.i, label %switch_case_branch_1_block6.i.i.i, label %switch_default_block.i70.i.i

switch_case_branch_1_block6.i.i.i:                ; preds = %switch_case_branch_1_block.i.i.i
  %memory_load_result7.i.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i68.i.i = inttoptr i256 %memory_load_result7.i.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i68.i.i, align 1
  %addition_result.i69.i.i = add i256 %memory_load_result7.i.i.i, 4
  %abi_encode_string_call.i.i.i = tail call fastcc i256 @abi_encode_string(i256 %addition_result.i69.i.i, i256 %addition_result28.i131)
  %subtraction_result.i.i.i = sub i256 %abi_encode_string_call.i.i.i, %memory_load_result7.i.i.i
  %28 = tail call i256 @llvm.umin.i256(i256 %memory_load_result7.i.i.i, i256 4294967295)
  %29 = tail call i256 @llvm.umin.i256(i256 %subtraction_result.i.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i.i = shl nuw nsw i256 %28, 64
  %exit_length_shifted.i.i.i.i = shl nuw nsw i256 %29, 96
  %exit_abi_data.i.i.i.i = or i256 %exit_length_shifted.i.i.i.i, %exit_offset_shifted.i.i.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i.i)
  unreachable

switch_default_block.i70.i.i:                     ; preds = %switch_case_branch_1_block.i.i.i
  %addition_result17.i.i.i = add i256 %return_pointer.0.i.i.i, 32
  %30 = tail call i256 @llvm.umin.i256(i256 %addition_result17.i.i.i, i256 4294967295)
  %31 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i67.i.i, i256 4294967295)
  %exit_offset_shifted.i24.i.i.i = shl nuw nsw i256 %30, 64
  %exit_length_shifted.i25.i.i.i = shl nuw nsw i256 %31, 96
  %exit_abi_data.i26.i.i.i = or i256 %exit_length_shifted.i25.i.i.i, %exit_offset_shifted.i24.i.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i26.i.i.i)
  unreachable

fun_verifyCallResult.exit.i.i:                    ; preds = %extract_returndata.exit.i.i
  br i1 %comparison_result.not.i.i.i, label %fun_uniTransfer.exit, label %if_main45.i.i

if_main45.i.i:                                    ; preds = %fun_verifyCallResult.exit.i.i
  %comparison_result.i.i.i = icmp slt i256 %memory_load_result.i67.i.i, 32
  br i1 %comparison_result.i.i.i, label %if_main.i71.i.i, label %if_join.i.i.i

if_main.i71.i.i:                                  ; preds = %if_main45.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i.i.i:                                    ; preds = %if_main45.i.i
  %addition_result54.i.i = add i256 %return_pointer.0.i.i.i, 32
  %memory_load_pointer.i72.i.i = inttoptr i256 %addition_result54.i.i to ptr addrspace(1)
  %memory_load_result.i73.i.i = load i256, ptr addrspace(1) %memory_load_pointer.i72.i.i, align 1
  %comparison_result5.i.i.i = icmp ne i256 %memory_load_result.i73.i.i, 0
  %comparison_result_extended8.i.i.i = zext i1 %comparison_result5.i.i.i to i256
  %comparison_result10.not.i.i.i = icmp eq i256 %memory_load_result.i73.i.i, %comparison_result_extended8.i.i.i
  br i1 %comparison_result10.not.i.i.i, label %abi_decode_bool_fromMemory.exit.i.i, label %if_main15.i.i.i

if_main15.i.i.i:                                  ; preds = %if_join.i.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_bool_fromMemory.exit.i.i:              ; preds = %if_join.i.i.i
  %comparison_result.i74.i.i = icmp eq i256 %memory_load_result.i73.i.i, 0
  br i1 %comparison_result.i74.i.i, label %if_main.i80.i.i, label %fun_uniTransfer.exit

if_main.i80.i.i:                                  ; preds = %abi_decode_bool_fromMemory.exit.i.i
  %memory_load_result.i75.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i76.i.i = inttoptr i256 %memory_load_result.i75.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i76.i.i, align 1
  %addition_result.i77.i.i = add i256 %memory_load_result.i75.i.i, 4
  %memory_store_pointer4.i.i.i = inttoptr i256 %addition_result.i77.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i.i.i, align 1
  %addition_result6.i.i.i = add i256 %memory_load_result.i75.i.i, 36
  %memory_store_pointer7.i.i.i = inttoptr i256 %addition_result6.i.i.i to ptr addrspace(1)
  store i256 42, ptr addrspace(1) %memory_store_pointer7.i.i.i, align 1
  %addition_result9.i.i.i = add i256 %memory_load_result.i75.i.i, 68
  %memory_store_pointer10.i.i.i = inttoptr i256 %addition_result9.i.i.i to ptr addrspace(1)
  store i256 37714057306076988483118529433182395293628422681814405642689417129066110394478, ptr addrspace(1) %memory_store_pointer10.i.i.i, align 1
  %addition_result12.i.i.i = add i256 %memory_load_result.i75.i.i, 100
  %memory_store_pointer13.i.i.i = inttoptr i256 %addition_result12.i.i.i to ptr addrspace(1)
  store i256 50411904420896249798390057088552747694053213439589473829759729709664159399936, ptr addrspace(1) %memory_store_pointer13.i.i.i, align 1
  %32 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i75.i.i, i256 4294967295)
  %exit_offset_shifted.i.i78.i.i = shl nuw nsw i256 %32, 64
  %exit_abi_data.i.i79.i.i = or i256 %exit_offset_shifted.i.i78.i.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i79.i.i)
  unreachable

switch_default_block.i143:                        ; preds = %if_main.i125
  br i1 %cond56.i, label %fun_uniTransfer.exit, label %contract_call_value_non_zero_block.i

contract_call_value_non_zero_block.i:             ; preds = %switch_default_block.i143
  %system_far_call_external.i = tail call { ptr addrspace(3), i1 } @__farcall(i256 904625697166532776746648320380374280103671755200316906558262375061821325312, i256 32777, i256 %division_result_non_zero.i.i121, i256 %and_result.i, i256 0, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_far_call_external_result_abi_data.i = extractvalue { ptr addrspace(3), i1 } %system_far_call_external.i, 0
  %system_far_call_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %system_far_call_external.i, 1
  %system_far_call_memcpy_from_child_pointer_casted.i = ptrtoint ptr addrspace(3) %system_far_call_external_result_abi_data.i to i256
  %system_far_call_memcpy_from_child_return_data_size_shifted.i = lshr i256 %system_far_call_memcpy_from_child_pointer_casted.i, 96
  %system_far_call_memcpy_from_child_return_data_size_truncated.i = and i256 %system_far_call_memcpy_from_child_return_data_size_shifted.i, 4294967295
  store ptr addrspace(3) %system_far_call_external_result_abi_data.i, ptr @ptr_return_data, align 32
  store i256 %system_far_call_memcpy_from_child_return_data_size_truncated.i, ptr @returndatasize, align 32
  br i1 %system_far_call_external_result_status_code_boolean.i, label %fun_uniTransfer.exit, label %if_main54.i

if_main54.i:                                      ; preds = %contract_call_value_non_zero_block.i
  %system_far_call_external_result_abi_data.i.le = extractvalue { ptr addrspace(3), i1 } %system_far_call_external.i, 0
  %memory_load_result.i65.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i.i145 = inttoptr i256 %memory_load_result.i65.i to ptr addrspace(1)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i145, ptr addrspace(3) align 1 %system_far_call_external_result_abi_data.i.le, i256 %system_far_call_memcpy_from_child_return_data_size_truncated.i, i1 false)
  %returndatasize3.i.i147 = load i256, ptr @returndatasize, align 32
  %33 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i65.i, i256 4294967295)
  %34 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i.i147, i256 4294967295)
  %exit_offset_shifted.i.i66.i = shl nuw nsw i256 %33, 64
  %exit_length_shifted.i.i.i148 = shl nuw nsw i256 %34, 96
  %exit_abi_data.i.i67.i = or i256 %exit_length_shifted.i.i.i148, %exit_offset_shifted.i.i66.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i67.i)
  unreachable

fun_uniTransfer.exit:                             ; preds = %fun_div.exit, %fun_verifyCallResult.exit.i.i, %abi_decode_bool_fromMemory.exit.i.i, %switch_default_block.i143, %contract_call_value_non_zero_block.i
  %memory_load_result = load i256, ptr addrspace(1) %memory_load_pointer, align 1
  %comparison_result22 = icmp ult i256 %var_i.0455, %memory_load_result
  %expr_2 = alloca i256, align 32
  %comparison_result25 = xor i1 %comparison_result22, true
  %comparison_result_extended26 = zext i1 %comparison_result25 to i256
  store i256 %comparison_result_extended26, ptr %expr_2, align 32
  br i1 %comparison_result22, label %memory_array_index_access_contract_IERC20_dyn.1.exit, label %if_join30

memory_array_index_access_contract_IERC20_dyn.1.exit: ; preds = %fun_uniTransfer.exit
  %shift_left_non_overflow_result.i152 = shl i256 %var_i.0455, 5
  %addition_result7.i = add i256 %addition_result.i153, %shift_left_non_overflow_result.i152
  %memory_load_pointer33 = inttoptr i256 %addition_result7.i to ptr addrspace(1)
  %memory_load_result34 = load i256, ptr addrspace(1) %memory_load_pointer33, align 1
  %comparison_result36 = icmp uge i256 %division_result_non_zero.i.i121, %memory_load_result34
  %comparison_result_extended39 = zext i1 %comparison_result36 to i256
  store i256 %comparison_result_extended39, ptr %expr_2, align 32
  br label %if_join30

if_join30:                                        ; preds = %memory_array_index_access_contract_IERC20_dyn.1.exit, %fun_uniTransfer.exit
  %expr_240 = load i256, ptr %expr_2, align 32
  %comparison_result.i155 = icmp eq i256 %expr_240, 0
  br i1 %comparison_result.i155, label %if_main.i166, label %require_helper_stringliteral_a6f1.exit

if_main.i166:                                     ; preds = %if_join30
  %memory_load_result.i156 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i157 = inttoptr i256 %memory_load_result.i156 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i157, align 1
  %addition_result.i158 = add i256 %memory_load_result.i156, 4
  %memory_store_pointer4.i159 = inttoptr i256 %addition_result.i158 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i159, align 1
  %addition_result6.i160 = add i256 %memory_load_result.i156, 36
  %memory_store_pointer7.i161 = inttoptr i256 %addition_result6.i160 to ptr addrspace(1)
  store i256 31, ptr addrspace(1) %memory_store_pointer7.i161, align 1
  %addition_result9.i162 = add i256 %memory_load_result.i156, 68
  %memory_store_pointer10.i163 = inttoptr i256 %addition_result9.i162 to ptr addrspace(1)
  store i256 35024978435645830422959912903222512151939984008179610950862390640503314409472, ptr addrspace(1) %memory_store_pointer10.i163, align 1
  %35 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i156, i256 4294967295)
  %exit_offset_shifted.i.i164 = shl nuw nsw i256 %35, 64
  %exit_abi_data.i.i165 = or i256 %exit_offset_shifted.i.i164, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i165)
  unreachable

require_helper_stringliteral_a6f1.exit:           ; preds = %if_join30
  store i256 %phi.bo.i, ptr addrspace(1) null, align 4294967296
  store i256 11, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i169 = tail call i256 @llvm.syncvm.gasleft()
  %36 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i169, i256 4294967295)
  %abi_data_gas_shifted.i.i170 = shl nuw nsw i256 %36, 192
  %abi_data_add_system_call_marker.i.i171 = or i256 %abi_data_gas_shifted.i.i170, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i171, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14878.exit, label %keccak256_failure_block.i.i

keccak256_failure_block.i.i:                      ; preds = %require_helper_stringliteral_a6f1.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14878.exit: ; preds = %require_helper_stringliteral_a6f1.exit
  %keccak256_call_external_result_abi_data_pointer.i.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i, 0
  %keccak256_child_data.i.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i, align 1
  %memory_load_result.i173 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  br i1 %comparison_result.i172, label %if_main.i179, label %fun_sub.exit

if_main.i179:                                     ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14878.exit
  %memory_store_pointer.i174 = inttoptr i256 %memory_load_result.i173 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i174, align 1
  %addition_result.i175 = add i256 %memory_load_result.i173, 4
  %memory_store_pointer5.i = inttoptr i256 %addition_result.i175 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5.i, align 1
  %addition_result7.i176 = add i256 %memory_load_result.i173, 36
  %memory_store_pointer8.i = inttoptr i256 %addition_result7.i176 to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8.i, align 1
  %addition_result10.i = add i256 %memory_load_result.i173, 68
  %memory_store_pointer11.i = inttoptr i256 %addition_result10.i to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11.i, align 1
  %37 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i173, i256 4294967295)
  %exit_offset_shifted.i.i177 = shl nuw nsw i256 %37, 64
  %exit_abi_data.i.i178 = or i256 %exit_offset_shifted.i.i177, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i178)
  unreachable

fun_sub.exit:                                     ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14878.exit
  %38 = icmp ugt i256 %memory_load_result.i173, 18446744073709551551
  br i1 %38, label %if_main.i.i.i181, label %read_from_storage_reference_type_struct_Data.exit.i

if_main.i.i.i181:                                 ; preds = %fun_sub.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

read_from_storage_reference_type_struct_Data.exit.i: ; preds = %fun_sub.exit
  %addition_result.i.i.i182 = add i256 %memory_load_result.i173, 64
  store i256 %addition_result.i.i.i182, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %storage_load.i.i = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i)
  %and_result.i.i183 = and i256 %storage_load.i.i, 105312291668557186697918027683670432318895095400549111254310977535
  %memory_store_pointer.i.i184 = inttoptr i256 %memory_load_result.i173 to ptr addrspace(1)
  store i256 %and_result.i.i183, ptr addrspace(1) %memory_store_pointer.i.i184, align 1
  %shift_right_non_overflow_result.i.i = lshr i256 %storage_load.i.i, 216
  %addition_result.i.i185 = add i256 %memory_load_result.i173, 32
  %memory_store_pointer8.i.i = inttoptr i256 %addition_result.i.i185 to ptr addrspace(1)
  store i256 %shift_right_non_overflow_result.i.i, ptr addrspace(1) %memory_store_pointer8.i.i, align 1
  store i256 54919857843691310904240101001871775513466943666296306094405906504622902841650, ptr addrspace(2) null, align 4294967296
  %gas_left.i.i.i186 = tail call i256 @llvm.syncvm.gasleft()
  %39 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i.i186, i256 4294967295)
  %abi_data_gas_shifted.i.i.i187 = shl nuw nsw i256 %39, 192
  %abi_data_add_system_call_marker.i.i.i188 = or i256 %abi_data_gas_shifted.i.i.i187, 904625751086426111047927909714404454142933102791518401696464687643217625088
  %system_request.i.i.i189 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i.i188, i256 32779, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i.i190 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i189, 1
  br i1 %system_request_result_status_code_boolean.i.i.i190, label %__system_request.exit.i.i195, label %system_request_error_block.i.i.i191

system_request_error_block.i.i.i191:              ; preds = %read_from_storage_reference_type_struct_Data.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i.i195:                     ; preds = %read_from_storage_reference_type_struct_Data.exit.i
  %system_request_result_abi_data.i.i.i192 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i189, 0
  %system_request_child_address.i.i.i193 = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i.i192, align 1
  %comparison_result.i.i.i194 = icmp ult i256 %system_request_child_address.i.i.i193, %shift_right_non_overflow_result.i.i
  br i1 %comparison_result.i.i.i194, label %if_main.i.i60.i, label %fun_sub.exit.i.i

if_main.i.i60.i:                                  ; preds = %__system_request.exit.i.i195
  %memory_load_result.i.i.i196 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i.i197 = inttoptr i256 %memory_load_result.i.i.i196 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i.i.i197, align 1
  %addition_result.i.i59.i = add i256 %memory_load_result.i.i.i196, 4
  %memory_store_pointer5.i.i.i = inttoptr i256 %addition_result.i.i59.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5.i.i.i, align 1
  %addition_result7.i.i.i = add i256 %memory_load_result.i.i.i196, 36
  %memory_store_pointer8.i.i.i = inttoptr i256 %addition_result7.i.i.i to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8.i.i.i, align 1
  %addition_result10.i.i.i = add i256 %memory_load_result.i.i.i196, 68
  %memory_store_pointer11.i.i.i = inttoptr i256 %addition_result10.i.i.i to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11.i.i.i, align 1
  %40 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i.i196, i256 4294967295)
  %exit_offset_shifted.i.i.i.i198 = shl nuw nsw i256 %40, 64
  %exit_abi_data.i.i.i.i199 = or i256 %exit_offset_shifted.i.i.i.i198, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i.i199)
  unreachable

fun_sub.exit.i.i:                                 ; preds = %__system_request.exit.i.i195
  %subtraction_result.i.i.i200 = sub i256 %system_request_child_address.i.i.i193, %shift_right_non_overflow_result.i.i
  %41 = tail call i256 @llvm.umin.i256(i256 %subtraction_result.i.i.i200, i256 300)
  %memory_load_result39.i.i = load i256, ptr addrspace(1) %memory_store_pointer.i.i184, align 1
  %and_result40.i.i = and i256 %memory_load_result39.i.i, 105312291668557186697918027683670432318895095400549111254310977535
  %comparison_result.i54.i.i = icmp eq i256 %and_result40.i.i, 0
  br i1 %comparison_result.i54.i.i, label %fun_mul.exit.i.i, label %if_join8.i.i.i

if_join8.i.i.i:                                   ; preds = %fun_sub.exit.i.i
  %subtraction_result.i.i201 = sub nuw nsw i256 300, %41
  %multiplication_result.i.i.i = mul nsw i256 %and_result40.i.i, %subtraction_result.i.i201
  %division_result_non_zero.i.i.i.i = udiv i256 %multiplication_result.i.i.i, %and_result40.i.i
  %comparison_result14.not.i.i.i = icmp eq i256 %division_result_non_zero.i.i.i.i, %subtraction_result.i.i201
  br i1 %comparison_result14.not.i.i.i, label %fun_mul.exit.i.i, label %if_main19.i.i.i

if_main19.i.i.i:                                  ; preds = %if_join8.i.i.i
  %memory_load_result.i55.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i56.i.i = inttoptr i256 %memory_load_result.i55.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i56.i.i, align 1
  %addition_result.i57.i.i = add i256 %memory_load_result.i55.i.i, 4
  %memory_store_pointer23.i.i.i = inttoptr i256 %addition_result.i57.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i.i.i, align 1
  %addition_result25.i.i.i = add i256 %memory_load_result.i55.i.i, 36
  %memory_store_pointer26.i.i.i = inttoptr i256 %addition_result25.i.i.i to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i.i.i, align 1
  %addition_result28.i.i.i = add i256 %memory_load_result.i55.i.i, 68
  %memory_store_pointer29.i.i.i = inttoptr i256 %addition_result28.i.i.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i.i.i, align 1
  %addition_result31.i.i.i = add i256 %memory_load_result.i55.i.i, 100
  %memory_store_pointer32.i.i.i = inttoptr i256 %addition_result31.i.i.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i.i.i, align 1
  %42 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i55.i.i, i256 4294967295)
  %exit_offset_shifted.i.i58.i.i = shl nuw nsw i256 %42, 64
  %exit_abi_data.i.i59.i.i = or i256 %exit_offset_shifted.i.i58.i.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i59.i.i)
  unreachable

fun_mul.exit.i.i:                                 ; preds = %if_join8.i.i.i, %fun_sub.exit.i.i
  %return_pointer.0.i.i.i202 = phi i256 [ 0, %fun_sub.exit.i.i ], [ %multiplication_result.i.i.i, %if_join8.i.i.i ]
  br i1 %comparison_result.i101, label %fun_mul.exit83.i.i, label %if_join.i64.i.i

if_join.i64.i.i:                                  ; preds = %fun_mul.exit.i.i
  %division_result_non_zero.i62.i.i = udiv i256 -1, %return_pointer.0.i
  %comparison_result4.i63.i.i = icmp ult i256 %division_result_non_zero.i62.i.i, %41
  br i1 %comparison_result4.i63.i.i, label %if_main7.i65.i.i, label %if_join8.i69.i.i

if_main7.i65.i.i:                                 ; preds = %if_join.i64.i.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i69.i.i:                                 ; preds = %if_join.i64.i.i
  %multiplication_result.i66.i.i = mul i256 %41, %return_pointer.0.i
  %division_result_non_zero.i.i67.i.i = udiv i256 %multiplication_result.i66.i.i, %return_pointer.0.i
  %comparison_result14.not.i68.i.i = icmp eq i256 %division_result_non_zero.i.i67.i.i, %41
  br i1 %comparison_result14.not.i68.i.i, label %fun_mul.exit83.i.i, label %if_main19.i82.i.i

if_main19.i82.i.i:                                ; preds = %if_join8.i69.i.i
  %memory_load_result.i70.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i71.i.i = inttoptr i256 %memory_load_result.i70.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i71.i.i, align 1
  %addition_result.i72.i.i = add i256 %memory_load_result.i70.i.i, 4
  %memory_store_pointer23.i73.i.i = inttoptr i256 %addition_result.i72.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i73.i.i, align 1
  %addition_result25.i74.i.i = add i256 %memory_load_result.i70.i.i, 36
  %memory_store_pointer26.i75.i.i = inttoptr i256 %addition_result25.i74.i.i to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i75.i.i, align 1
  %addition_result28.i76.i.i = add i256 %memory_load_result.i70.i.i, 68
  %memory_store_pointer29.i77.i.i = inttoptr i256 %addition_result28.i76.i.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i77.i.i, align 1
  %addition_result31.i78.i.i = add i256 %memory_load_result.i70.i.i, 100
  %memory_store_pointer32.i79.i.i = inttoptr i256 %addition_result31.i78.i.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i79.i.i, align 1
  %43 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i70.i.i, i256 4294967295)
  %exit_offset_shifted.i.i80.i.i = shl nuw nsw i256 %43, 64
  %exit_abi_data.i.i81.i.i = or i256 %exit_offset_shifted.i.i80.i.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i81.i.i)
  unreachable

fun_mul.exit83.i.i:                               ; preds = %if_join8.i69.i.i, %fun_mul.exit.i.i
  %return_pointer.0.i61.i.i = phi i256 [ 0, %fun_mul.exit.i.i ], [ %multiplication_result.i66.i.i, %if_join8.i69.i.i ]
  %xor_result.i.i.i.i = xor i256 %return_pointer.0.i61.i.i, -1
  %comparison_result.i.i.i.i203 = icmp ugt i256 %return_pointer.0.i.i.i202, %xor_result.i.i.i.i
  br i1 %comparison_result.i.i.i.i203, label %if_main.i.i.i.i204, label %checked_add_uint256.exit.i.i.i

if_main.i.i.i.i204:                               ; preds = %fun_mul.exit83.i.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i.i.i:                   ; preds = %fun_mul.exit83.i.i
  %addition_result.i.i.i.i = add i256 %return_pointer.0.i61.i.i, %return_pointer.0.i.i.i202
  %comparison_result.i84.i.i = icmp ult i256 %addition_result.i.i.i.i, %return_pointer.0.i.i.i202
  br i1 %comparison_result.i84.i.i, label %if_main.i90.i.i, label %fun_current.exit.i

if_main.i90.i.i:                                  ; preds = %checked_add_uint256.exit.i.i.i
  %memory_load_result.i85.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i86.i.i = inttoptr i256 %memory_load_result.i85.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i86.i.i, align 1
  %addition_result.i87.i.i = add i256 %memory_load_result.i85.i.i, 4
  %memory_store_pointer7.i.i.i205 = inttoptr i256 %addition_result.i87.i.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i.i.i205, align 1
  %addition_result9.i.i.i206 = add i256 %memory_load_result.i85.i.i, 36
  %memory_store_pointer10.i.i.i207 = inttoptr i256 %addition_result9.i.i.i206 to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i.i.i207, align 1
  %addition_result12.i.i.i208 = add i256 %memory_load_result.i85.i.i, 68
  %memory_store_pointer13.i.i.i209 = inttoptr i256 %addition_result12.i.i.i208 to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i.i.i209, align 1
  %44 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i85.i.i, i256 4294967295)
  %exit_offset_shifted.i.i88.i.i = shl nuw nsw i256 %44, 64
  %exit_abi_data.i.i89.i.i = or i256 %exit_offset_shifted.i.i88.i.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i89.i.i)
  unreachable

fun_current.exit.i:                               ; preds = %checked_add_uint256.exit.i.i.i
  %division_result_non_zero.i92.i.i = udiv i256 %addition_result.i.i.i.i, 300
  %45 = icmp ult i256 %addition_result.i.i.i.i, 300
  br i1 %45, label %if_join20.i, label %if_join.i.i211

if_join.i.i211:                                   ; preds = %fun_current.exit.i
  %division_result_non_zero.i.i210 = udiv i256 -1, %division_result_non_zero.i92.i.i
  %comparison_result4.i.i = icmp ult i256 %division_result_non_zero.i.i210, %subtraction_result.i
  br i1 %comparison_result4.i.i, label %if_main7.i.i, label %if_join8.i.i

if_main7.i.i:                                     ; preds = %if_join.i.i211
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i.i:                                     ; preds = %if_join.i.i211
  %multiplication_result.i.i = mul i256 %division_result_non_zero.i92.i.i, %subtraction_result.i
  %division_result_non_zero.i.i.i = udiv i256 %multiplication_result.i.i, %division_result_non_zero.i92.i.i
  %comparison_result14.not.i.i = icmp eq i256 %division_result_non_zero.i.i.i, %subtraction_result.i
  br i1 %comparison_result14.not.i.i, label %if_join20.i, label %if_main19.i.i

if_main19.i.i:                                    ; preds = %if_join8.i.i
  %memory_load_result.i61.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i62.i = inttoptr i256 %memory_load_result.i61.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i62.i, align 1
  %addition_result.i63.i = add i256 %memory_load_result.i61.i, 4
  %memory_store_pointer23.i.i212 = inttoptr i256 %addition_result.i63.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i.i212, align 1
  %addition_result25.i.i213 = add i256 %memory_load_result.i61.i, 36
  %memory_store_pointer26.i.i214 = inttoptr i256 %addition_result25.i.i213 to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i.i214, align 1
  %addition_result28.i.i = add i256 %memory_load_result.i61.i, 68
  %memory_store_pointer29.i.i = inttoptr i256 %addition_result28.i.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i.i, align 1
  %addition_result31.i.i = add i256 %memory_load_result.i61.i, 100
  %memory_store_pointer32.i.i = inttoptr i256 %addition_result31.i.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i.i, align 1
  %46 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i61.i, i256 4294967295)
  %exit_offset_shifted.i.i.i215 = shl nuw nsw i256 %46, 64
  %exit_abi_data.i.i.i216 = or i256 %exit_offset_shifted.i.i.i215, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i216)
  unreachable

if_join20.i:                                      ; preds = %fun_current.exit.i, %if_join8.i.i
  %return_pointer.0.i.i = phi i256 [ 0, %fun_current.exit.i ], [ %multiplication_result.i.i, %if_join8.i.i ]
  %comparison_result.i.i64.i = icmp ugt i256 %return_pointer.0.i.i, %xor_result.i.i.i
  br i1 %comparison_result.i.i64.i, label %if_main.i.i65.i, label %checked_add_uint256.exit.i.i

if_main.i.i65.i:                                  ; preds = %if_join20.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i.i:                     ; preds = %if_join20.i
  %addition_result.i.i66.i = add i256 %return_pointer.0.i.i, %addition_result28.i229
  %comparison_result.i67.i = icmp ult i256 %addition_result.i.i66.i, %return_pointer.0.i.i
  br i1 %comparison_result.i67.i, label %if_main.i.i231, label %fun_div.exit.i

if_main.i.i231:                                   ; preds = %checked_add_uint256.exit.i.i
  %memory_load_result.i68.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i69.i = inttoptr i256 %memory_load_result.i68.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i69.i, align 1
  %addition_result.i70.i = add i256 %memory_load_result.i68.i, 4
  %memory_store_pointer7.i.i230 = inttoptr i256 %addition_result.i70.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i.i230, align 1
  %addition_result9.i.i = add i256 %memory_load_result.i68.i, 36
  %memory_store_pointer10.i.i = inttoptr i256 %addition_result9.i.i to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i.i, align 1
  %addition_result12.i.i = add i256 %memory_load_result.i68.i, 68
  %memory_store_pointer13.i.i = inttoptr i256 %addition_result12.i.i to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i.i, align 1
  %47 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i68.i, i256 4294967295)
  %exit_offset_shifted.i.i71.i = shl nuw nsw i256 %47, 64
  %exit_abi_data.i.i72.i = or i256 %exit_offset_shifted.i.i71.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i72.i)
  unreachable

fun_div.exit.i:                                   ; preds = %checked_add_uint256.exit.i.i
  %division_result_non_zero.i.i84.i = udiv i256 %addition_result.i.i66.i, %storage_load3
  %and_result.i232 = and i256 %division_result_non_zero.i.i84.i, 105312291668557186697918027683670432318895095400549111254310977535
  %storage_load.i233 = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i)
  %and_result38.i = and i256 %storage_load.i233, -105312291668557186697918027683670432318895095400549111254310977536
  %or_result.i = or i256 %and_result38.i, %and_result.i232
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i, i256 %or_result.i)
  store i256 54919857843691310904240101001871775513466943666296306094405906504622902841650, ptr addrspace(2) null, align 4294967296
  %gas_left.i.i234 = tail call i256 @llvm.syncvm.gasleft()
  %48 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i234, i256 4294967295)
  %abi_data_gas_shifted.i.i235 = shl nuw nsw i256 %48, 192
  %abi_data_add_system_call_marker.i.i236 = or i256 %abi_data_gas_shifted.i.i235, 904625751086426111047927909714404454142933102791518401696464687643217625088
  %system_request.i.i237 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i236, i256 32779, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i238 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i237, 1
  br i1 %system_request_result_status_code_boolean.i.i238, label %fun_scale.exit, label %system_request_error_block.i.i239

system_request_error_block.i.i239:                ; preds = %fun_div.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

fun_scale.exit:                                   ; preds = %fun_div.exit.i
  %system_request_result_abi_data.i.i240 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i237, 0
  %system_request_child_address.i.i241 = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i240, align 1
  %shift_left_non_overflow_result.i242 = shl i256 %system_request_child_address.i.i241, 216
  %or_result48.i = or i256 %shift_left_non_overflow_result.i242, %and_result.i232
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i, i256 %or_result48.i)
  store i256 %phi.bo.i, ptr addrspace(1) null, align 4294967296
  store i256 12, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i.i245 = tail call i256 @llvm.syncvm.gasleft()
  %49 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i245, i256 4294967295)
  %abi_data_gas_shifted.i.i246 = shl nuw nsw i256 %49, 192
  %abi_data_add_system_call_marker.i.i247 = or i256 %abi_data_gas_shifted.i.i246, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i.i248 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i247, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i.i249 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i248, 1
  br i1 %keccak256_external_result_status_code_boolean.i.i249, label %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14879.exit, label %keccak256_failure_block.i.i250

keccak256_failure_block.i.i250:                   ; preds = %fun_scale.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14879.exit: ; preds = %fun_scale.exit
  %keccak256_call_external_result_abi_data_pointer.i.i251 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i.i248, 0
  %keccak256_child_data.i.i252 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i.i251, align 1
  %memory_load_result.i.i267 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %50 = icmp ugt i256 %memory_load_result.i.i267, 18446744073709551551
  br i1 %50, label %if_main.i.i.i268, label %read_from_storage_reference_type_struct_Data.exit.i281

if_main.i.i.i268:                                 ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14879.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

read_from_storage_reference_type_struct_Data.exit.i281: ; preds = %mapping_index_access_mapping_contract_IERC20_bool_of_contract_IERC20_14879.exit
  %addition_result.i.i.i269 = add i256 %memory_load_result.i.i267, 64
  store i256 %addition_result.i.i.i269, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %storage_load.i.i270 = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i252)
  %and_result.i.i271 = and i256 %storage_load.i.i270, 105312291668557186697918027683670432318895095400549111254310977535
  %memory_store_pointer.i.i272 = inttoptr i256 %memory_load_result.i.i267 to ptr addrspace(1)
  store i256 %and_result.i.i271, ptr addrspace(1) %memory_store_pointer.i.i272, align 1
  %shift_right_non_overflow_result.i.i273 = lshr i256 %storage_load.i.i270, 216
  %addition_result.i.i274 = add i256 %memory_load_result.i.i267, 32
  %memory_store_pointer8.i.i275 = inttoptr i256 %addition_result.i.i274 to ptr addrspace(1)
  store i256 %shift_right_non_overflow_result.i.i273, ptr addrspace(1) %memory_store_pointer8.i.i275, align 1
  store i256 54919857843691310904240101001871775513466943666296306094405906504622902841650, ptr addrspace(2) null, align 4294967296
  %gas_left.i.i.i276 = tail call i256 @llvm.syncvm.gasleft()
  %51 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i.i276, i256 4294967295)
  %abi_data_gas_shifted.i.i.i277 = shl nuw nsw i256 %51, 192
  %abi_data_add_system_call_marker.i.i.i278 = or i256 %abi_data_gas_shifted.i.i.i277, 904625751086426111047927909714404454142933102791518401696464687643217625088
  %system_request.i.i.i279 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i.i278, i256 32779, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i.i280 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i279, 1
  br i1 %system_request_result_status_code_boolean.i.i.i280, label %__system_request.exit.i.i286, label %system_request_error_block.i.i.i282

system_request_error_block.i.i.i282:              ; preds = %read_from_storage_reference_type_struct_Data.exit.i281
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i.i286:                     ; preds = %read_from_storage_reference_type_struct_Data.exit.i281
  %system_request_result_abi_data.i.i.i283 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i.i279, 0
  %system_request_child_address.i.i.i284 = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i.i283, align 1
  %comparison_result.i.i.i285 = icmp ult i256 %system_request_child_address.i.i.i284, %shift_right_non_overflow_result.i.i273
  br i1 %comparison_result.i.i.i285, label %if_main.i.i60.i297, label %fun_sub.exit.i.i302

if_main.i.i60.i297:                               ; preds = %__system_request.exit.i.i286
  %memory_load_result.i.i.i287 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i.i288 = inttoptr i256 %memory_load_result.i.i.i287 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i.i.i288, align 1
  %addition_result.i.i59.i289 = add i256 %memory_load_result.i.i.i287, 4
  %memory_store_pointer5.i.i.i290 = inttoptr i256 %addition_result.i.i59.i289 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5.i.i.i290, align 1
  %addition_result7.i.i.i291 = add i256 %memory_load_result.i.i.i287, 36
  %memory_store_pointer8.i.i.i292 = inttoptr i256 %addition_result7.i.i.i291 to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8.i.i.i292, align 1
  %addition_result10.i.i.i293 = add i256 %memory_load_result.i.i.i287, 68
  %memory_store_pointer11.i.i.i294 = inttoptr i256 %addition_result10.i.i.i293 to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11.i.i.i294, align 1
  %52 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i.i287, i256 4294967295)
  %exit_offset_shifted.i.i.i.i295 = shl nuw nsw i256 %52, 64
  %exit_abi_data.i.i.i.i296 = or i256 %exit_offset_shifted.i.i.i.i295, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i.i296)
  unreachable

fun_sub.exit.i.i302:                              ; preds = %__system_request.exit.i.i286
  %subtraction_result.i.i.i298 = sub i256 %system_request_child_address.i.i.i284, %shift_right_non_overflow_result.i.i273
  %53 = tail call i256 @llvm.umin.i256(i256 %subtraction_result.i.i.i298, i256 300)
  %memory_load_result39.i.i299 = load i256, ptr addrspace(1) %memory_store_pointer.i.i272, align 1
  %and_result40.i.i300 = and i256 %memory_load_result39.i.i299, 105312291668557186697918027683670432318895095400549111254310977535
  %comparison_result.i54.i.i301 = icmp eq i256 %and_result40.i.i300, 0
  br i1 %comparison_result.i54.i.i301, label %fun_mul.exit.i.i323, label %if_join8.i.i.i307

if_join8.i.i.i307:                                ; preds = %fun_sub.exit.i.i302
  %subtraction_result.i.i303 = sub nuw nsw i256 300, %53
  %multiplication_result.i.i.i304 = mul nsw i256 %and_result40.i.i300, %subtraction_result.i.i303
  %division_result_non_zero.i.i.i.i305 = udiv i256 %multiplication_result.i.i.i304, %and_result40.i.i300
  %comparison_result14.not.i.i.i306 = icmp eq i256 %division_result_non_zero.i.i.i.i305, %subtraction_result.i.i303
  br i1 %comparison_result14.not.i.i.i306, label %fun_mul.exit.i.i323, label %if_main19.i.i.i320

if_main19.i.i.i320:                               ; preds = %if_join8.i.i.i307
  %memory_load_result.i55.i.i308 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i56.i.i309 = inttoptr i256 %memory_load_result.i55.i.i308 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i56.i.i309, align 1
  %addition_result.i57.i.i310 = add i256 %memory_load_result.i55.i.i308, 4
  %memory_store_pointer23.i.i.i311 = inttoptr i256 %addition_result.i57.i.i310 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i.i.i311, align 1
  %addition_result25.i.i.i312 = add i256 %memory_load_result.i55.i.i308, 36
  %memory_store_pointer26.i.i.i313 = inttoptr i256 %addition_result25.i.i.i312 to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i.i.i313, align 1
  %addition_result28.i.i.i314 = add i256 %memory_load_result.i55.i.i308, 68
  %memory_store_pointer29.i.i.i315 = inttoptr i256 %addition_result28.i.i.i314 to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i.i.i315, align 1
  %addition_result31.i.i.i316 = add i256 %memory_load_result.i55.i.i308, 100
  %memory_store_pointer32.i.i.i317 = inttoptr i256 %addition_result31.i.i.i316 to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i.i.i317, align 1
  %54 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i55.i.i308, i256 4294967295)
  %exit_offset_shifted.i.i58.i.i318 = shl nuw nsw i256 %54, 64
  %exit_abi_data.i.i59.i.i319 = or i256 %exit_offset_shifted.i.i58.i.i318, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i59.i.i319)
  unreachable

fun_mul.exit.i.i323:                              ; preds = %if_join8.i.i.i307, %fun_sub.exit.i.i302
  %return_pointer.0.i.i.i321 = phi i256 [ 0, %fun_sub.exit.i.i302 ], [ %multiplication_result.i.i.i304, %if_join8.i.i.i307 ]
  br i1 %comparison_result.i101, label %fun_mul.exit83.i.i348, label %if_join.i64.i.i326

if_join.i64.i.i326:                               ; preds = %fun_mul.exit.i.i323
  %division_result_non_zero.i62.i.i324 = udiv i256 -1, %return_pointer.0.i
  %comparison_result4.i63.i.i325 = icmp ult i256 %division_result_non_zero.i62.i.i324, %53
  br i1 %comparison_result4.i63.i.i325, label %if_main7.i65.i.i327, label %if_join8.i69.i.i331

if_main7.i65.i.i327:                              ; preds = %if_join.i64.i.i326
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i69.i.i331:                              ; preds = %if_join.i64.i.i326
  %multiplication_result.i66.i.i328 = mul i256 %53, %return_pointer.0.i
  %division_result_non_zero.i.i67.i.i329 = udiv i256 %multiplication_result.i66.i.i328, %return_pointer.0.i
  %comparison_result14.not.i68.i.i330 = icmp eq i256 %division_result_non_zero.i.i67.i.i329, %53
  br i1 %comparison_result14.not.i68.i.i330, label %fun_mul.exit83.i.i348, label %if_main19.i82.i.i344

if_main19.i82.i.i344:                             ; preds = %if_join8.i69.i.i331
  %memory_load_result.i70.i.i332 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i71.i.i333 = inttoptr i256 %memory_load_result.i70.i.i332 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i71.i.i333, align 1
  %addition_result.i72.i.i334 = add i256 %memory_load_result.i70.i.i332, 4
  %memory_store_pointer23.i73.i.i335 = inttoptr i256 %addition_result.i72.i.i334 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i73.i.i335, align 1
  %addition_result25.i74.i.i336 = add i256 %memory_load_result.i70.i.i332, 36
  %memory_store_pointer26.i75.i.i337 = inttoptr i256 %addition_result25.i74.i.i336 to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i75.i.i337, align 1
  %addition_result28.i76.i.i338 = add i256 %memory_load_result.i70.i.i332, 68
  %memory_store_pointer29.i77.i.i339 = inttoptr i256 %addition_result28.i76.i.i338 to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i77.i.i339, align 1
  %addition_result31.i78.i.i340 = add i256 %memory_load_result.i70.i.i332, 100
  %memory_store_pointer32.i79.i.i341 = inttoptr i256 %addition_result31.i78.i.i340 to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i79.i.i341, align 1
  %55 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i70.i.i332, i256 4294967295)
  %exit_offset_shifted.i.i80.i.i342 = shl nuw nsw i256 %55, 64
  %exit_abi_data.i.i81.i.i343 = or i256 %exit_offset_shifted.i.i80.i.i342, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i81.i.i343)
  unreachable

fun_mul.exit83.i.i348:                            ; preds = %if_join8.i69.i.i331, %fun_mul.exit.i.i323
  %return_pointer.0.i61.i.i345 = phi i256 [ 0, %fun_mul.exit.i.i323 ], [ %multiplication_result.i66.i.i328, %if_join8.i69.i.i331 ]
  %xor_result.i.i.i.i346 = xor i256 %return_pointer.0.i61.i.i345, -1
  %comparison_result.i.i.i.i347 = icmp ugt i256 %return_pointer.0.i.i.i321, %xor_result.i.i.i.i346
  br i1 %comparison_result.i.i.i.i347, label %if_main.i.i.i.i349, label %checked_add_uint256.exit.i.i.i352

if_main.i.i.i.i349:                               ; preds = %fun_mul.exit83.i.i348
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i.i.i352:                ; preds = %fun_mul.exit83.i.i348
  %addition_result.i.i.i.i350 = add i256 %return_pointer.0.i61.i.i345, %return_pointer.0.i.i.i321
  %comparison_result.i84.i.i351 = icmp ult i256 %addition_result.i.i.i.i350, %return_pointer.0.i.i.i321
  br i1 %comparison_result.i84.i.i351, label %if_main.i90.i.i363, label %fun_current.exit.i365

if_main.i90.i.i363:                               ; preds = %checked_add_uint256.exit.i.i.i352
  %memory_load_result.i85.i.i353 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i86.i.i354 = inttoptr i256 %memory_load_result.i85.i.i353 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i86.i.i354, align 1
  %addition_result.i87.i.i355 = add i256 %memory_load_result.i85.i.i353, 4
  %memory_store_pointer7.i.i.i356 = inttoptr i256 %addition_result.i87.i.i355 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i.i.i356, align 1
  %addition_result9.i.i.i357 = add i256 %memory_load_result.i85.i.i353, 36
  %memory_store_pointer10.i.i.i358 = inttoptr i256 %addition_result9.i.i.i357 to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i.i.i358, align 1
  %addition_result12.i.i.i359 = add i256 %memory_load_result.i85.i.i353, 68
  %memory_store_pointer13.i.i.i360 = inttoptr i256 %addition_result12.i.i.i359 to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i.i.i360, align 1
  %56 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i85.i.i353, i256 4294967295)
  %exit_offset_shifted.i.i88.i.i361 = shl nuw nsw i256 %56, 64
  %exit_abi_data.i.i89.i.i362 = or i256 %exit_offset_shifted.i.i88.i.i361, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i89.i.i362)
  unreachable

fun_current.exit.i365:                            ; preds = %checked_add_uint256.exit.i.i.i352
  %division_result_non_zero.i92.i.i364 = udiv i256 %addition_result.i.i.i.i350, 300
  %57 = icmp ult i256 %addition_result.i.i.i.i350, 300
  br i1 %57, label %if_join20.i403, label %if_join.i.i368

if_join.i.i368:                                   ; preds = %fun_current.exit.i365
  %division_result_non_zero.i.i366 = udiv i256 -1, %division_result_non_zero.i92.i.i364
  %comparison_result4.i.i367 = icmp ult i256 %division_result_non_zero.i.i366, %subtraction_result.i
  br i1 %comparison_result4.i.i367, label %if_main7.i.i369, label %if_join8.i.i373

if_main7.i.i369:                                  ; preds = %if_join.i.i368
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i.i373:                                  ; preds = %if_join.i.i368
  %multiplication_result.i.i370 = mul i256 %division_result_non_zero.i92.i.i364, %subtraction_result.i
  %division_result_non_zero.i.i.i371 = udiv i256 %multiplication_result.i.i370, %division_result_non_zero.i92.i.i364
  %comparison_result14.not.i.i372 = icmp eq i256 %division_result_non_zero.i.i.i371, %subtraction_result.i
  br i1 %comparison_result14.not.i.i372, label %if_join20.i403, label %if_main19.i.i386

if_main19.i.i386:                                 ; preds = %if_join8.i.i373
  %memory_load_result.i61.i374 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i62.i375 = inttoptr i256 %memory_load_result.i61.i374 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i62.i375, align 1
  %addition_result.i63.i376 = add i256 %memory_load_result.i61.i374, 4
  %memory_store_pointer23.i.i377 = inttoptr i256 %addition_result.i63.i376 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i.i377, align 1
  %addition_result25.i.i378 = add i256 %memory_load_result.i61.i374, 36
  %memory_store_pointer26.i.i379 = inttoptr i256 %addition_result25.i.i378 to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i.i379, align 1
  %addition_result28.i.i380 = add i256 %memory_load_result.i61.i374, 68
  %memory_store_pointer29.i.i381 = inttoptr i256 %addition_result28.i.i380 to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i.i381, align 1
  %addition_result31.i.i382 = add i256 %memory_load_result.i61.i374, 100
  %memory_store_pointer32.i.i383 = inttoptr i256 %addition_result31.i.i382 to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i.i383, align 1
  %58 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i61.i374, i256 4294967295)
  %exit_offset_shifted.i.i.i384 = shl nuw nsw i256 %58, 64
  %exit_abi_data.i.i.i385 = or i256 %exit_offset_shifted.i.i.i384, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i385)
  unreachable

if_join20.i403:                                   ; preds = %fun_current.exit.i365, %if_join8.i.i373
  %return_pointer.0.i.i387 = phi i256 [ 0, %fun_current.exit.i365 ], [ %multiplication_result.i.i370, %if_join8.i.i373 ]
  %comparison_result.i.i64.i402 = icmp ugt i256 %return_pointer.0.i.i387, %xor_result.i.i.i
  br i1 %comparison_result.i.i64.i402, label %if_main.i.i65.i404, label %checked_add_uint256.exit.i.i408

if_main.i.i65.i404:                               ; preds = %if_join20.i403
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i.i408:                  ; preds = %if_join20.i403
  %addition_result.i.i66.i406 = add i256 %return_pointer.0.i.i387, %addition_result28.i229
  %comparison_result.i67.i407 = icmp ult i256 %addition_result.i.i66.i406, %return_pointer.0.i.i387
  br i1 %comparison_result.i67.i407, label %if_main.i.i419, label %fun_div.exit.i430

if_main.i.i419:                                   ; preds = %checked_add_uint256.exit.i.i408
  %memory_load_result.i68.i409 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i69.i410 = inttoptr i256 %memory_load_result.i68.i409 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i69.i410, align 1
  %addition_result.i70.i411 = add i256 %memory_load_result.i68.i409, 4
  %memory_store_pointer7.i.i412 = inttoptr i256 %addition_result.i70.i411 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i.i412, align 1
  %addition_result9.i.i413 = add i256 %memory_load_result.i68.i409, 36
  %memory_store_pointer10.i.i414 = inttoptr i256 %addition_result9.i.i413 to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i.i414, align 1
  %addition_result12.i.i415 = add i256 %memory_load_result.i68.i409, 68
  %memory_store_pointer13.i.i416 = inttoptr i256 %addition_result12.i.i415 to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i.i416, align 1
  %59 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i68.i409, i256 4294967295)
  %exit_offset_shifted.i.i71.i417 = shl nuw nsw i256 %59, 64
  %exit_abi_data.i.i72.i418 = or i256 %exit_offset_shifted.i.i71.i417, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i72.i418)
  unreachable

fun_div.exit.i430:                                ; preds = %checked_add_uint256.exit.i.i408
  %division_result_non_zero.i.i84.i420 = udiv i256 %addition_result.i.i66.i406, %storage_load3
  %and_result.i421 = and i256 %division_result_non_zero.i.i84.i420, 105312291668557186697918027683670432318895095400549111254310977535
  %storage_load.i422 = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i.i252)
  %and_result38.i423 = and i256 %storage_load.i422, -105312291668557186697918027683670432318895095400549111254310977536
  %or_result.i424 = or i256 %and_result38.i423, %and_result.i421
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i252, i256 %or_result.i424)
  store i256 54919857843691310904240101001871775513466943666296306094405906504622902841650, ptr addrspace(2) null, align 4294967296
  %gas_left.i.i425 = tail call i256 @llvm.syncvm.gasleft()
  %60 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i425, i256 4294967295)
  %abi_data_gas_shifted.i.i426 = shl nuw nsw i256 %60, 192
  %abi_data_add_system_call_marker.i.i427 = or i256 %abi_data_gas_shifted.i.i426, 904625751086426111047927909714404454142933102791518401696464687643217625088
  %system_request.i.i428 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i427, i256 32779, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i429 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i428, 1
  br i1 %system_request_result_status_code_boolean.i.i429, label %fun_scale.exit437, label %system_request_error_block.i.i431

system_request_error_block.i.i431:                ; preds = %fun_div.exit.i430
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

fun_scale.exit437:                                ; preds = %fun_div.exit.i430
  %system_request_result_abi_data.i.i432 = extractvalue { ptr addrspace(3), i1 } %system_request.i.i428, 0
  %system_request_child_address.i.i433 = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i432, align 1
  %shift_left_non_overflow_result.i434 = shl i256 %system_request_child_address.i.i433, 216
  %or_result48.i435 = or i256 %shift_left_non_overflow_result.i434, %and_result.i421
  tail call void @llvm.syncvm.sstore(i256 %keccak256_child_data.i.i252, i256 %or_result48.i435)
  %addition_result.i440 = add nuw i256 %var_i.0455, 1
  %storage_load5 = tail call i256 @llvm.syncvm.sload(i256 8)
  %comparison_result7.not = icmp ult i256 %addition_result.i440, %storage_load5
  br i1 %comparison_result7.not, label %storage_array_index_access_contract_IERC20_dyn.exit, label %if_main

event_failure_block:                              ; preds = %if_main
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

event_join_block:                                 ; preds = %if_main
  tail call void @llvm.syncvm.sstore(i256 5, i256 1)
  ret void
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc void @require_helper_stringliteral_0005(i256 %0) unnamed_addr #6 personality ptr @__personality {
entry:
  %comparison_result = icmp eq i256 %0, 0
  br i1 %comparison_result, label %if_main, label %if_join

if_main:                                          ; preds = %entry
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer, align 1
  %addition_result = add i256 %memory_load_result, 4
  %memory_store_pointer4 = inttoptr i256 %addition_result to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4, align 1
  %addition_result6 = add i256 %memory_load_result, 36
  %memory_store_pointer7 = inttoptr i256 %addition_result6 to ptr addrspace(1)
  store i256 24, ptr addrspace(1) %memory_store_pointer7, align 1
  %addition_result9 = add i256 %memory_load_result, 68
  %memory_store_pointer10 = inttoptr i256 %addition_result9 to ptr addrspace(1)
  store i256 35024978435645830422959912878365208132433882559487967362983714244802937618432, ptr addrspace(1) %memory_store_pointer10, align 1
  %1 = tail call i256 @llvm.umin.i256(i256 %memory_load_result, i256 4294967295)
  %exit_offset_shifted.i = shl nuw nsw i256 %1, 64
  %exit_abi_data.i = or i256 %exit_offset_shifted.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i)
  unreachable

if_join:                                          ; preds = %entry
  ret void
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc i256 @fun_getReturn(i256 %0, i256 %1, i256 %2, i256 %3, i256 %4) unnamed_addr #6 personality ptr @__personality {
entry:
  %and_result = and i256 %0, 1461501637330902918203684832716283019655932542975
  store i256 %and_result, ptr addrspace(1) null, align 4294967296
  store i256 9, ptr addrspace(1) inttoptr (i256 32 to ptr addrspace(1)), align 32
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %5 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_gas_shifted.i = shl nuw nsw i256 %5, 192
  %abi_data_add_system_call_marker.i = or i256 %abi_data_gas_shifted.i, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 1
  br i1 %keccak256_external_result_status_code_boolean.i, label %__keccak256.exit, label %keccak256_failure_block.i

keccak256_failure_block.i:                        ; preds = %entry
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit:                                 ; preds = %entry
  %keccak256_call_external_result_abi_data_pointer.i = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i, 0
  %keccak256_child_data.i = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i, align 1
  %storage_load = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i)
  %and_result4 = and i256 %storage_load, 255
  %if_condition_compared.not = icmp eq i256 %and_result4, 0
  br i1 %if_condition_compared.not, label %if_join, label %if_main

return:                                           ; preds = %if_join, %fun_div.exit
  %return_pointer.0 = phi i256 [ %division_result_non_zero.i.i120, %fun_div.exit ], [ 0, %if_join ]
  ret i256 %return_pointer.0

if_main:                                          ; preds = %__keccak256.exit
  %and_result8 = and i256 %1, 1461501637330902918203684832716283019655932542975
  store i256 %and_result8, ptr addrspace(1) null, align 4294967296
  %gas_left.i54 = tail call i256 @llvm.syncvm.gasleft()
  %6 = tail call i256 @llvm.umin.i256(i256 %gas_left.i54, i256 4294967295)
  %abi_data_gas_shifted.i55 = shl nuw nsw i256 %6, 192
  %abi_data_add_system_call_marker.i57 = or i256 %abi_data_gas_shifted.i55, 904625697166532776746648320380374280103671760270919307471179981048634146816
  %keccak256_call_external.i58 = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i57, i256 32784, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %keccak256_external_result_status_code_boolean.i59 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i58, 1
  br i1 %keccak256_external_result_status_code_boolean.i59, label %__keccak256.exit63, label %keccak256_failure_block.i62

keccak256_failure_block.i62:                      ; preds = %if_main
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__keccak256.exit63:                               ; preds = %if_main
  %keccak256_call_external_result_abi_data_pointer.i60 = extractvalue { ptr addrspace(3), i1 } %keccak256_call_external.i58, 0
  %keccak256_child_data.i61 = load i256, ptr addrspace(3) %keccak256_call_external_result_abi_data_pointer.i60, align 1
  %storage_load10 = tail call i256 @llvm.syncvm.sload(i256 %keccak256_child_data.i61)
  %and_result11 = and i256 %storage_load10, 255
  %phi.cmp = icmp eq i256 %and_result11, 0
  br label %if_join

if_join:                                          ; preds = %__keccak256.exit63, %__keccak256.exit
  %expr.0 = phi i1 [ %phi.cmp, %__keccak256.exit63 ], [ true, %__keccak256.exit ]
  %and_result19 = and i256 %1, 1461501637330902918203684832716283019655932542975
  %comparison_result = icmp eq i256 %and_result, %and_result19
  %narrow = select i1 %expr.0, i1 true, i1 %comparison_result
  %comparison_result29 = icmp eq i256 %2, 0
  %storemerge.v = select i1 %narrow, i1 true, i1 %comparison_result29
  br i1 %storemerge.v, label %return, label %if_main35

if_main35:                                        ; preds = %if_join
  %storage_load.i = tail call i256 @llvm.syncvm.sload(i256 7)
  %and_result.i = and i256 %storage_load.i, 1461501637330902918203684832716283019655932542975
  %memory_load_result.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %memory_load_result.i to ptr addrspace(1)
  store i256 -15473609976992815453879044879197146078698344415282747790657695637952777945088, ptr addrspace(1) %memory_store_pointer.i, align 1
  %gas_left.i64 = tail call i256 @llvm.syncvm.gasleft()
  %cond.i = icmp eq i256 %and_result.i, 4
  br i1 %cond.i, label %if_join.i, label %contract_call_ordinary_block.i

contract_call_ordinary_block.i:                   ; preds = %if_main35
  %7 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i, i256 4294967295)
  %8 = tail call i256 @llvm.umin.i256(i256 %gas_left.i64, i256 4294967295)
  %abi_data_input_offset_shifted.i.i = shl nuw nsw i256 %7, 64
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %8, 192
  %abi_data_offset_and_length.i.i = or i256 %abi_data_gas_shifted.i.i, %abi_data_input_offset_shifted.i.i
  %abi_data_add_gas.i.i = or i256 %abi_data_offset_and_length.i.i, 316912650057057350374175801344
  %contract_call_external.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_gas.i.i, i256 %and_result.i, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 0
  %contract_call_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 1
  %contract_call_memcpy_from_child_pointer_casted.i.i = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i.i to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i.i = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i.i, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i.i = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i.i, 4294967295
  %9 = tail call i256 @llvm.umin.i256(i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i256 32)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %memory_store_pointer.i, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i, i256 %9, i1 false)
  store ptr addrspace(3) %contract_call_external_result_abi_data.i.i, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, ptr @returndatasize, align 32
  br i1 %contract_call_external_result_status_code_boolean.i.i, label %if_join.i, label %if_main.i

if_main.i:                                        ; preds = %contract_call_ordinary_block.i
  %memory_load_result.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i.i = inttoptr i256 %memory_load_result.i.i to ptr addrspace(1)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i.i, i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, i1 false)
  %returndatasize3.i.i = load i256, ptr @returndatasize, align 32
  %10 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i.i, i256 4294967295)
  %11 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i = shl nuw nsw i256 %10, 64
  %exit_length_shifted.i.i.i = shl nuw nsw i256 %11, 96
  %exit_abi_data.i.i.i = or i256 %exit_length_shifted.i.i.i, %exit_offset_shifted.i.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i)
  unreachable

if_join.i:                                        ; preds = %contract_call_ordinary_block.i, %if_main35
  %returndatasize.i = load i256, ptr @returndatasize, align 32
  %12 = tail call i256 @llvm.umin.i256(i256 %returndatasize.i, i256 32)
  %addition_result.i.i = add nuw nsw i256 %12, 31
  %and_result.i.i = and i256 %addition_result.i.i, 96
  %addition_result3.i.i = add i256 %and_result.i.i, %memory_load_result.i
  %comparison_result.i.i = icmp ult i256 %addition_result3.i.i, %memory_load_result.i
  %comparison_result7.i.i = icmp ugt i256 %addition_result3.i.i, 18446744073709551615
  %or_result13.i.i = or i1 %comparison_result7.i.i, %comparison_result.i.i
  br i1 %or_result13.i.i, label %if_main.i.i, label %finalize_allocation.exit.i

if_main.i.i:                                      ; preds = %if_join.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit.i:                       ; preds = %if_join.i
  store i256 %addition_result3.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %comparison_result.i34.i = icmp ult i256 %returndatasize.i, 32
  br i1 %comparison_result.i34.i, label %if_main.i35.i, label %fun_fee.exit

if_main.i35.i:                                    ; preds = %finalize_allocation.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

fun_fee.exit:                                     ; preds = %finalize_allocation.exit.i
  %memory_load_result.i36.i = load i256, ptr addrspace(1) %memory_store_pointer.i, align 1
  %comparison_result.i = icmp eq i256 %2, 0
  br i1 %comparison_result.i, label %fun_mul.exit, label %if_join.i65

if_join.i65:                                      ; preds = %fun_fee.exit
  %division_result_non_zero.i = udiv i256 -1, %2
  %comparison_result4.i = icmp ult i256 %division_result_non_zero.i, %memory_load_result.i36.i
  br i1 %comparison_result4.i, label %if_main7.i, label %if_join8.i

if_main7.i:                                       ; preds = %if_join.i65
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i:                                       ; preds = %if_join.i65
  %multiplication_result.i = mul i256 %memory_load_result.i36.i, %2
  %division_result_non_zero.i.i = udiv i256 %multiplication_result.i, %2
  %comparison_result14.not.i = icmp eq i256 %division_result_non_zero.i.i, %memory_load_result.i36.i
  br i1 %comparison_result14.not.i, label %fun_mul.exit, label %if_main19.i

if_main19.i:                                      ; preds = %if_join8.i
  %memory_store_pointer.i67 = inttoptr i256 %addition_result3.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i67, align 1
  %addition_result.i = add i256 %addition_result3.i.i, 4
  %memory_store_pointer23.i = inttoptr i256 %addition_result.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i, align 1
  %addition_result25.i = add i256 %addition_result3.i.i, 36
  %memory_store_pointer26.i = inttoptr i256 %addition_result25.i to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i, align 1
  %addition_result28.i = add i256 %addition_result3.i.i, 68
  %memory_store_pointer29.i = inttoptr i256 %addition_result28.i to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i, align 1
  %addition_result31.i = add i256 %addition_result3.i.i, 100
  %memory_store_pointer32.i = inttoptr i256 %addition_result31.i to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i, align 1
  %13 = tail call i256 @llvm.umin.i256(i256 %addition_result3.i.i, i256 4294967295)
  %exit_offset_shifted.i.i = shl nuw nsw i256 %13, 64
  %exit_abi_data.i.i = or i256 %exit_offset_shifted.i.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i)
  unreachable

fun_mul.exit:                                     ; preds = %fun_fee.exit, %if_join8.i
  %return_pointer.0.i = phi i256 [ 0, %fun_fee.exit ], [ %multiplication_result.i, %if_join8.i ]
  %division_result_non_zero = udiv i256 %return_pointer.0.i, 1000000000000000000
  %comparison_result.i68 = icmp ugt i256 %division_result_non_zero, %2
  br i1 %comparison_result.i68, label %if_main.i74, label %fun_sub.exit

if_main.i74:                                      ; preds = %fun_mul.exit
  %memory_store_pointer.i70 = inttoptr i256 %addition_result3.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i70, align 1
  %addition_result.i71 = add i256 %addition_result3.i.i, 4
  %memory_store_pointer5.i = inttoptr i256 %addition_result.i71 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5.i, align 1
  %addition_result7.i = add i256 %addition_result3.i.i, 36
  %memory_store_pointer8.i = inttoptr i256 %addition_result7.i to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8.i, align 1
  %addition_result10.i = add i256 %addition_result3.i.i, 68
  %memory_store_pointer11.i = inttoptr i256 %addition_result10.i to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11.i, align 1
  %14 = tail call i256 @llvm.umin.i256(i256 %addition_result3.i.i, i256 4294967295)
  %exit_offset_shifted.i.i72 = shl nuw nsw i256 %14, 64
  %exit_abi_data.i.i73 = or i256 %exit_offset_shifted.i.i72, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i73)
  unreachable

fun_sub.exit:                                     ; preds = %fun_mul.exit
  %subtraction_result.i = sub i256 %2, %division_result_non_zero
  %comparison_result.i75 = icmp eq i256 %division_result_non_zero, %2
  br i1 %comparison_result.i75, label %fun_mul.exit98, label %if_join.i79

if_join.i79:                                      ; preds = %fun_sub.exit
  %division_result_non_zero.i77 = udiv i256 -1, %subtraction_result.i
  %comparison_result4.i78 = icmp ult i256 %division_result_non_zero.i77, %4
  br i1 %comparison_result4.i78, label %if_main7.i80, label %if_join8.i84

if_main7.i80:                                     ; preds = %if_join.i79
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

if_join8.i84:                                     ; preds = %if_join.i79
  %multiplication_result.i81 = mul i256 %subtraction_result.i, %4
  %division_result_non_zero.i.i82 = udiv i256 %multiplication_result.i81, %subtraction_result.i
  %comparison_result14.not.i83 = icmp eq i256 %division_result_non_zero.i.i82, %4
  br i1 %comparison_result14.not.i83, label %fun_mul.exit98, label %if_main19.i97

if_main19.i97:                                    ; preds = %if_join8.i84
  %memory_store_pointer.i86 = inttoptr i256 %addition_result3.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i86, align 1
  %addition_result.i87 = add i256 %addition_result3.i.i, 4
  %memory_store_pointer23.i88 = inttoptr i256 %addition_result.i87 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer23.i88, align 1
  %addition_result25.i89 = add i256 %addition_result3.i.i, 36
  %memory_store_pointer26.i90 = inttoptr i256 %addition_result25.i89 to ptr addrspace(1)
  store i256 33, ptr addrspace(1) %memory_store_pointer26.i90, align 1
  %addition_result28.i91 = add i256 %addition_result3.i.i, 68
  %memory_store_pointer29.i92 = inttoptr i256 %addition_result28.i91 to ptr addrspace(1)
  store i256 37714057306925736537727341711534603569002632158006504148307520321239491439727, ptr addrspace(1) %memory_store_pointer29.i92, align 1
  %addition_result31.i93 = add i256 %addition_result3.i.i, 100
  %memory_store_pointer32.i94 = inttoptr i256 %addition_result31.i93 to ptr addrspace(1)
  store i256 53825228981408700216425575062632269666168469434418855940216611316178368856064, ptr addrspace(1) %memory_store_pointer32.i94, align 1
  %15 = tail call i256 @llvm.umin.i256(i256 %addition_result3.i.i, i256 4294967295)
  %exit_offset_shifted.i.i95 = shl nuw nsw i256 %15, 64
  %exit_abi_data.i.i96 = or i256 %exit_offset_shifted.i.i95, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i96)
  unreachable

fun_mul.exit98:                                   ; preds = %fun_sub.exit, %if_join8.i84
  %return_pointer.0.i76 = phi i256 [ 0, %fun_sub.exit ], [ %multiplication_result.i81, %if_join8.i84 ]
  %xor_result.i.i = xor i256 %subtraction_result.i, -1
  %comparison_result.i.i99 = icmp ult i256 %xor_result.i.i, %3
  br i1 %comparison_result.i.i99, label %if_main.i.i100, label %checked_add_uint256.exit.i

if_main.i.i100:                                   ; preds = %fun_mul.exit98
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 17, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

checked_add_uint256.exit.i:                       ; preds = %fun_mul.exit98
  %addition_result.i.i101 = add i256 %subtraction_result.i, %3
  %comparison_result.i102 = icmp ult i256 %addition_result.i.i101, %3
  br i1 %comparison_result.i102, label %if_main.i108, label %fun_add.exit

if_main.i108:                                     ; preds = %checked_add_uint256.exit.i
  %memory_store_pointer.i104 = inttoptr i256 %addition_result3.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i104, align 1
  %addition_result.i105 = add i256 %addition_result3.i.i, 4
  %memory_store_pointer7.i = inttoptr i256 %addition_result.i105 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer7.i, align 1
  %addition_result9.i = add i256 %addition_result3.i.i, 36
  %memory_store_pointer10.i = inttoptr i256 %addition_result9.i to ptr addrspace(1)
  store i256 27, ptr addrspace(1) %memory_store_pointer10.i, align 1
  %addition_result12.i = add i256 %addition_result3.i.i, 68
  %memory_store_pointer13.i = inttoptr i256 %addition_result12.i to ptr addrspace(1)
  store i256 37714057306925736537727337196910129575336924242351790113041164404516917870592, ptr addrspace(1) %memory_store_pointer13.i, align 1
  %16 = tail call i256 @llvm.umin.i256(i256 %addition_result3.i.i, i256 4294967295)
  %exit_offset_shifted.i.i106 = shl nuw nsw i256 %16, 64
  %exit_abi_data.i.i107 = or i256 %exit_offset_shifted.i.i106, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i107)
  unreachable

fun_add.exit:                                     ; preds = %checked_add_uint256.exit.i
  %comparison_result.i110 = icmp eq i256 %addition_result.i.i101, 0
  br i1 %comparison_result.i110, label %if_main.i119, label %fun_div.exit

if_main.i119:                                     ; preds = %fun_add.exit
  %memory_store_pointer.i112 = inttoptr i256 %addition_result3.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i112, align 1
  %addition_result.i113 = add i256 %addition_result3.i.i, 4
  %memory_store_pointer4.i = inttoptr i256 %addition_result.i113 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i, align 1
  %addition_result6.i = add i256 %addition_result3.i.i, 36
  %memory_store_pointer7.i114 = inttoptr i256 %addition_result6.i to ptr addrspace(1)
  store i256 26, ptr addrspace(1) %memory_store_pointer7.i114, align 1
  %addition_result9.i115 = add i256 %addition_result3.i.i, 68
  %memory_store_pointer10.i116 = inttoptr i256 %addition_result9.i115 to ptr addrspace(1)
  store i256 37714057306925736537727338326753656978887423192446994710127794316522513498112, ptr addrspace(1) %memory_store_pointer10.i116, align 1
  %17 = tail call i256 @llvm.umin.i256(i256 %addition_result3.i.i, i256 4294967295)
  %exit_offset_shifted.i.i117 = shl nuw nsw i256 %17, 64
  %exit_abi_data.i.i118 = or i256 %exit_offset_shifted.i.i117, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i118)
  unreachable

fun_div.exit:                                     ; preds = %fun_add.exit
  %division_result_non_zero.i.i120 = udiv i256 %return_pointer.0.i76, %addition_result.i.i101
  br label %return
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc i256 @fun_uniBalanceOf(i256 %0, i256 %1) unnamed_addr #6 personality ptr @__personality {
entry:
  %and_result = and i256 %0, 1461501637330902918203684832716283019655932542975
  %comparison_result.not = icmp eq i256 %and_result, 0
  br i1 %comparison_result.not, label %switch_default_block, label %switch_case_branch_1_block

return:                                           ; preds = %__system_request.exit, %abi_decode_uint256_fromMemory.exit
  %return_pointer.0 = phi i256 [ %memory_load_result.i46, %abi_decode_uint256_fromMemory.exit ], [ %system_request_child_address.i, %__system_request.exit ]
  ret i256 %return_pointer.0

switch_case_branch_1_block:                       ; preds = %entry
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 50942633119752846454219349998365661925608737367104304655302372697894809501696, ptr addrspace(1) %memory_store_pointer, align 1
  %and_result12 = and i256 %1, 1461501637330902918203684832716283019655932542975
  %addition_result = add i256 %memory_load_result, 4
  %memory_store_pointer14 = inttoptr i256 %addition_result to ptr addrspace(1)
  store i256 %and_result12, ptr addrspace(1) %memory_store_pointer14, align 1
  %gas_left = tail call i256 @llvm.syncvm.gasleft()
  %cond40 = icmp eq i256 %and_result, 4
  br i1 %cond40, label %if_join, label %contract_call_ordinary_block

contract_call_ordinary_block:                     ; preds = %switch_case_branch_1_block
  %2 = tail call i256 @llvm.umin.i256(i256 %memory_load_result, i256 4294967295)
  %3 = tail call i256 @llvm.umin.i256(i256 %gas_left, i256 4294967295)
  %abi_data_input_offset_shifted.i = shl nuw nsw i256 %2, 64
  %abi_data_gas_shifted.i = shl nuw nsw i256 %3, 192
  %abi_data_offset_and_length.i = or i256 %abi_data_gas_shifted.i, %abi_data_input_offset_shifted.i
  %abi_data_add_gas.i = or i256 %abi_data_offset_and_length.i, 2852213850513516153367582212096
  %contract_call_external.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_gas.i, i256 %and_result, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i, 0
  %contract_call_external_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i, 1
  %contract_call_memcpy_from_child_pointer_casted.i = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i, 4294967295
  %4 = tail call i256 @llvm.umin.i256(i256 %contract_call_memcpy_from_child_return_data_size_truncated.i, i256 32)
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %memory_store_pointer, ptr addrspace(3) align 1 %contract_call_external_result_abi_data.i, i256 %4, i1 false)
  store ptr addrspace(3) %contract_call_external_result_abi_data.i, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i, ptr @returndatasize, align 32
  br i1 %contract_call_external_result_status_code_boolean.i, label %if_join, label %if_main

if_main:                                          ; preds = %contract_call_ordinary_block
  %returndatasize.i = load i256, ptr @returndatasize, align 32
  %memory_load_result.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i = inttoptr i256 %memory_load_result.i to ptr addrspace(1)
  %return_data_pointer.i = load ptr addrspace(3), ptr @ptr_return_data, align 32
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i, ptr addrspace(3) align 1 %return_data_pointer.i, i256 %returndatasize.i, i1 false)
  %returndatasize3.i = load i256, ptr @returndatasize, align 32
  %5 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i, i256 4294967295)
  %6 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i, i256 4294967295)
  %exit_offset_shifted.i.i = shl nuw nsw i256 %5, 64
  %exit_length_shifted.i.i = shl nuw nsw i256 %6, 96
  %exit_abi_data.i.i = or i256 %exit_length_shifted.i.i, %exit_offset_shifted.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i)
  unreachable

if_join:                                          ; preds = %switch_case_branch_1_block, %contract_call_ordinary_block
  %returndatasize = load i256, ptr @returndatasize, align 32
  %7 = tail call i256 @llvm.umin.i256(i256 %returndatasize, i256 32)
  %addition_result.i = add nuw nsw i256 %7, 31
  %and_result.i = and i256 %addition_result.i, 96
  %addition_result3.i = add i256 %and_result.i, %memory_load_result
  %comparison_result.i = icmp ult i256 %addition_result3.i, %memory_load_result
  %comparison_result7.i = icmp ugt i256 %addition_result3.i, 18446744073709551615
  %or_result13.i = or i1 %comparison_result7.i, %comparison_result.i
  br i1 %or_result13.i, label %if_main.i, label %finalize_allocation.exit

if_main.i:                                        ; preds = %if_join
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit:                         ; preds = %if_join
  store i256 %addition_result3.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %comparison_result.i44 = icmp ult i256 %returndatasize, 32
  br i1 %comparison_result.i44, label %if_main.i45, label %abi_decode_uint256_fromMemory.exit

if_main.i45:                                      ; preds = %finalize_allocation.exit
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_uint256_fromMemory.exit:               ; preds = %finalize_allocation.exit
  %memory_load_result.i46 = load i256, ptr addrspace(1) %memory_store_pointer, align 1
  br label %return

switch_default_block:                             ; preds = %entry
  store i256 -44877977326897262784168444354156441158329539312518651612887364914072161059015, ptr addrspace(2) null, align 4294967296
  store i256 %1, ptr addrspace(2) inttoptr (i256 4 to ptr addrspace(2)), align 4
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %8 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_gas_shifted.i47 = shl nuw nsw i256 %8, 192
  %abi_data_add_system_call_marker.i = or i256 %abi_data_gas_shifted.i47, 904625751086426111047927909714404454142933105326819602152923490636624035840
  %system_request.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i, i256 32778, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i = extractvalue { ptr addrspace(3), i1 } %system_request.i, 1
  br i1 %system_request_result_status_code_boolean.i, label %__system_request.exit, label %system_request_error_block.i

system_request_error_block.i:                     ; preds = %switch_default_block
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit:                            ; preds = %switch_default_block
  %system_request_result_abi_data.i = extractvalue { ptr addrspace(3), i1 } %system_request.i, 0
  %system_request_child_address.i = load i256, ptr addrspace(3) %system_request_result_abi_data.i, align 1
  br label %return
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc void @fun_uniTransferFromSenderToThis(i256 %0, i256 %1) unnamed_addr #6 personality ptr @__personality {
entry:
  %comparison_result.not = icmp eq i256 %1, 0
  br i1 %comparison_result.not, label %if_join, label %if_main

if_main:                                          ; preds = %entry
  %and_result = and i256 %0, 1461501637330902918203684832716283019655932542975
  %comparison_result5.not = icmp eq i256 %and_result, 0
  br i1 %comparison_result5.not, label %switch_default_block, label %switch_case_branch_1_block

if_join:                                          ; preds = %fun_sub.exit, %abi_decode_bool_fromMemory.exit.i, %fun_verifyCallResult.exit.i, %contract_call_join_block, %require_helper_stringliteral_f063.exit, %entry
  ret void

switch_case_branch_1_block:                       ; preds = %if_main
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %addition_result = add i256 %memory_load_result, 32
  %memory_store_pointer = inttoptr i256 %addition_result to ptr addrspace(1)
  store i256 16156842317565293874272834530371880720966471053262404558597773956279093428224, ptr addrspace(1) %memory_store_pointer, align 1
  %caller = tail call i256 @llvm.syncvm.caller()
  %addition_result14 = add i256 %memory_load_result, 36
  %memory_store_pointer15 = inttoptr i256 %addition_result14 to ptr addrspace(1)
  store i256 %caller, ptr addrspace(1) %memory_store_pointer15, align 1
  %address = tail call i256 @llvm.syncvm.this()
  %addition_result17 = add i256 %memory_load_result, 68
  %memory_store_pointer18 = inttoptr i256 %addition_result17 to ptr addrspace(1)
  store i256 %address, ptr addrspace(1) %memory_store_pointer18, align 1
  %addition_result21 = add i256 %memory_load_result, 100
  %memory_store_pointer22 = inttoptr i256 %addition_result21 to ptr addrspace(1)
  store i256 %1, ptr addrspace(1) %memory_store_pointer22, align 1
  %memory_store_pointer24 = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 100, ptr addrspace(1) %memory_store_pointer24, align 1
  %2 = icmp ugt i256 %memory_load_result, 18446744073709551455
  br i1 %2, label %if_main.i, label %finalize_allocation_22245.exit

if_main.i:                                        ; preds = %switch_case_branch_1_block
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation_22245.exit:                   ; preds = %switch_case_branch_1_block
  %addition_result.i = add i256 %memory_load_result, 160
  store i256 %addition_result.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %3 = icmp ugt i256 %addition_result.i, 18446744073709551551
  br i1 %3, label %if_main.i.i, label %finalize_allocation_14877.exit.i

if_main.i.i:                                      ; preds = %finalize_allocation_22245.exit
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation_14877.exit.i:                 ; preds = %finalize_allocation_22245.exit
  %addition_result.i.i = add i256 %memory_load_result, 224
  store i256 %addition_result.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i = inttoptr i256 %addition_result.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer.i, align 1
  %addition_result.i64 = add i256 %memory_load_result, 192
  %memory_store_pointer7.i = inttoptr i256 %addition_result.i64 to ptr addrspace(1)
  store i256 37714057306076988483118529490347679105585116642029194716945419020321082336612, ptr addrspace(1) %memory_store_pointer7.i, align 1
  store i256 10867283408178898638301172343726954674910073630256871736220740970449699113859, ptr addrspace(2) null, align 4294967296
  store i256 %and_result, ptr addrspace(2) inttoptr (i256 4 to ptr addrspace(2)), align 4
  %gas_left.i.i = tail call i256 @llvm.syncvm.gasleft()
  %4 = tail call i256 @llvm.umin.i256(i256 %gas_left.i.i, i256 4294967295)
  %abi_data_gas_shifted.i.i = shl nuw nsw i256 %4, 192
  %abi_data_add_system_call_marker.i.i = or i256 %abi_data_gas_shifted.i.i, 904625751086426111047927909714404454142933105326819602152923490636624035840
  %system_request.i.i = tail call { ptr addrspace(3), i1 } @__staticcall(i256 %abi_data_add_system_call_marker.i.i, i256 32770, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %system_request_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 1
  br i1 %system_request_result_status_code_boolean.i.i, label %__system_request.exit.i, label %system_request_error_block.i.i

system_request_error_block.i.i:                   ; preds = %finalize_allocation_14877.exit.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

__system_request.exit.i:                          ; preds = %finalize_allocation_14877.exit.i
  %system_request_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %system_request.i.i, 0
  %system_request_child_address.i.i = load i256, ptr addrspace(3) %system_request_result_abi_data.i.i, align 1
  %comparison_result.i = icmp eq i256 %system_request_child_address.i.i, 0
  br i1 %comparison_result.i, label %if_main.i65, label %if_join.i

if_main.i65:                                      ; preds = %__system_request.exit.i
  %memory_load_result9.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer16.i = inttoptr i256 %memory_load_result9.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer16.i, align 1
  %addition_result19.i = add i256 %memory_load_result9.i, 4
  %memory_store_pointer20.i = inttoptr i256 %addition_result19.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer20.i, align 1
  %addition_result22.i = add i256 %memory_load_result9.i, 36
  %memory_store_pointer23.i = inttoptr i256 %addition_result22.i to ptr addrspace(1)
  store i256 29, ptr addrspace(1) %memory_store_pointer23.i, align 1
  %addition_result25.i = add i256 %memory_load_result9.i, 68
  %memory_store_pointer26.i = inttoptr i256 %addition_result25.i to ptr addrspace(1)
  store i256 29577713123142787666064487680123823951345158729797978021083438401868913442816, ptr addrspace(1) %memory_store_pointer26.i, align 1
  %5 = tail call i256 @llvm.umin.i256(i256 %memory_load_result9.i, i256 4294967295)
  %exit_offset_shifted.i.i = shl nuw nsw i256 %5, 64
  %exit_abi_data.i.i = or i256 %exit_offset_shifted.i.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i)
  unreachable

if_join.i:                                        ; preds = %__system_request.exit.i
  %memory_load_result29.i = load i256, ptr addrspace(1) %memory_store_pointer24, align 1
  %gas_left.i = tail call i256 @llvm.syncvm.gasleft()
  %cond.i = icmp eq i256 %and_result, 4
  br i1 %cond.i, label %contract_call_join_block.i, label %contract_call_ordinary_block.i

contract_call_ordinary_block.i:                   ; preds = %if_join.i
  %6 = tail call i256 @llvm.umin.i256(i256 %addition_result, i256 4294967295)
  %7 = tail call i256 @llvm.umin.i256(i256 %memory_load_result29.i, i256 4294967295)
  %8 = tail call i256 @llvm.umin.i256(i256 %gas_left.i, i256 4294967295)
  %abi_data_input_offset_shifted.i.i = shl nuw nsw i256 %6, 64
  %abi_data_input_length_shifted.i.i = shl nuw nsw i256 %7, 96
  %abi_data_gas_shifted.i65.i = shl nuw nsw i256 %8, 192
  %abi_data_offset_and_length.i.i = or i256 %abi_data_input_length_shifted.i.i, %abi_data_input_offset_shifted.i.i
  %abi_data_add_gas.i.i = or i256 %abi_data_offset_and_length.i.i, %abi_data_gas_shifted.i65.i
  %contract_call_external.i.i = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_gas.i.i, i256 %and_result, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  %contract_call_external_result_abi_data.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 0
  %contract_call_external_result_status_code_boolean.i.i = extractvalue { ptr addrspace(3), i1 } %contract_call_external.i.i, 1
  %contract_call_external_result_status_code.i.i = zext i1 %contract_call_external_result_status_code_boolean.i.i to i256
  %contract_call_memcpy_from_child_pointer_casted.i.i = ptrtoint ptr addrspace(3) %contract_call_external_result_abi_data.i.i to i256
  %contract_call_memcpy_from_child_return_data_size_shifted.i.i = lshr i256 %contract_call_memcpy_from_child_pointer_casted.i.i, 96
  %contract_call_memcpy_from_child_return_data_size_truncated.i.i = and i256 %contract_call_memcpy_from_child_return_data_size_shifted.i.i, 4294967295
  store ptr addrspace(3) %contract_call_external_result_abi_data.i.i, ptr @ptr_return_data, align 32
  store i256 %contract_call_memcpy_from_child_return_data_size_truncated.i.i, ptr @returndatasize, align 32
  br label %contract_call_join_block.i

contract_call_join_block.i:                       ; preds = %contract_call_ordinary_block.i, %if_join.i
  %storemerge.i = phi i256 [ %contract_call_external_result_status_code.i.i, %contract_call_ordinary_block.i ], [ 1, %if_join.i ]
  %returndatasize.i.i = load i256, ptr @returndatasize, align 32
  %cond.i.i = icmp eq i256 %returndatasize.i.i, 0
  br i1 %cond.i.i, label %extract_returndata.exit.i, label %switch_default_block.i.i

switch_default_block.i.i:                         ; preds = %contract_call_join_block.i
  %memory_load_result.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %9 = add i256 %returndatasize.i.i, 63
  %and_result.i.i.i = and i256 %9, -32
  %addition_result3.i.i.i = add i256 %memory_load_result.i.i, %and_result.i.i.i
  %comparison_result.i.i.i = icmp ult i256 %addition_result3.i.i.i, %memory_load_result.i.i
  %comparison_result7.i.i.i = icmp ugt i256 %addition_result3.i.i.i, 18446744073709551615
  %or_result13.i.i.i = or i1 %comparison_result7.i.i.i, %comparison_result.i.i.i
  br i1 %or_result13.i.i.i, label %if_main.i.i.i, label %finalize_allocation.exit.i.i

if_main.i.i.i:                                    ; preds = %switch_default_block.i.i
  store i256 35408467139433450592217433187231851964531694900788300625387963629091585785856, ptr addrspace(1) null, align 4294967296
  store i256 65, ptr addrspace(1) inttoptr (i256 4 to ptr addrspace(1)), align 4
  tail call void @llvm.syncvm.revert(i256 2852213850513516153367582212096)
  unreachable

finalize_allocation.exit.i.i:                     ; preds = %switch_default_block.i.i
  store i256 %addition_result3.i.i.i, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i.i = inttoptr i256 %memory_load_result.i.i to ptr addrspace(1)
  store i256 %returndatasize.i.i, ptr addrspace(1) %memory_store_pointer.i.i, align 1
  %addition_result11.i.i = add i256 %memory_load_result.i.i, 32
  %returndatasize9.i.i = load i256, ptr @returndatasize, align 32
  %return_data_copy_destination_pointer.i.i = inttoptr i256 %addition_result11.i.i to ptr addrspace(1)
  %return_data_pointer.i.i = load ptr addrspace(3), ptr @ptr_return_data, align 32
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i.i, ptr addrspace(3) align 1 %return_data_pointer.i.i, i256 %returndatasize9.i.i, i1 false)
  br label %extract_returndata.exit.i

extract_returndata.exit.i:                        ; preds = %finalize_allocation.exit.i.i, %contract_call_join_block.i
  %return_pointer.0.i.i = phi i256 [ %memory_load_result.i.i, %finalize_allocation.exit.i.i ], [ 96, %contract_call_join_block.i ]
  %cond.i66.i = icmp eq i256 %storemerge.i, 0
  %memory_load_pointer.i.i = inttoptr i256 %return_pointer.0.i.i to ptr addrspace(1)
  %memory_load_result.i67.i = load i256, ptr addrspace(1) %memory_load_pointer.i.i, align 1
  %comparison_result.not.i.i = icmp eq i256 %memory_load_result.i67.i, 0
  br i1 %cond.i66.i, label %switch_case_branch_1_block.i.i, label %fun_verifyCallResult.exit.i

switch_case_branch_1_block.i.i:                   ; preds = %extract_returndata.exit.i
  br i1 %comparison_result.not.i.i, label %switch_case_branch_1_block6.i.i, label %switch_default_block.i70.i

switch_case_branch_1_block6.i.i:                  ; preds = %switch_case_branch_1_block.i.i
  %memory_load_result7.i.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i68.i = inttoptr i256 %memory_load_result7.i.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i68.i, align 1
  %addition_result.i69.i = add i256 %memory_load_result7.i.i, 4
  %abi_encode_string_call.i.i = tail call fastcc i256 @abi_encode_string(i256 %addition_result.i69.i, i256 %addition_result.i)
  %subtraction_result.i.i = sub i256 %abi_encode_string_call.i.i, %memory_load_result7.i.i
  %10 = tail call i256 @llvm.umin.i256(i256 %memory_load_result7.i.i, i256 4294967295)
  %11 = tail call i256 @llvm.umin.i256(i256 %subtraction_result.i.i, i256 4294967295)
  %exit_offset_shifted.i.i.i = shl nuw nsw i256 %10, 64
  %exit_length_shifted.i.i.i = shl nuw nsw i256 %11, 96
  %exit_abi_data.i.i.i = or i256 %exit_length_shifted.i.i.i, %exit_offset_shifted.i.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i.i)
  unreachable

switch_default_block.i70.i:                       ; preds = %switch_case_branch_1_block.i.i
  %addition_result17.i.i = add i256 %return_pointer.0.i.i, 32
  %12 = tail call i256 @llvm.umin.i256(i256 %addition_result17.i.i, i256 4294967295)
  %13 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i67.i, i256 4294967295)
  %exit_offset_shifted.i24.i.i = shl nuw nsw i256 %12, 64
  %exit_length_shifted.i25.i.i = shl nuw nsw i256 %13, 96
  %exit_abi_data.i26.i.i = or i256 %exit_length_shifted.i25.i.i, %exit_offset_shifted.i24.i.i
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i26.i.i)
  unreachable

fun_verifyCallResult.exit.i:                      ; preds = %extract_returndata.exit.i
  br i1 %comparison_result.not.i.i, label %if_join, label %if_main45.i

if_main45.i:                                      ; preds = %fun_verifyCallResult.exit.i
  %comparison_result.i.i = icmp slt i256 %memory_load_result.i67.i, 32
  br i1 %comparison_result.i.i, label %if_main.i71.i, label %if_join.i.i

if_main.i71.i:                                    ; preds = %if_main45.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

if_join.i.i:                                      ; preds = %if_main45.i
  %addition_result54.i = add i256 %return_pointer.0.i.i, 32
  %memory_load_pointer.i72.i = inttoptr i256 %addition_result54.i to ptr addrspace(1)
  %memory_load_result.i73.i = load i256, ptr addrspace(1) %memory_load_pointer.i72.i, align 1
  %comparison_result5.i.i = icmp ne i256 %memory_load_result.i73.i, 0
  %comparison_result_extended8.i.i = zext i1 %comparison_result5.i.i to i256
  %comparison_result10.not.i.i = icmp eq i256 %memory_load_result.i73.i, %comparison_result_extended8.i.i
  br i1 %comparison_result10.not.i.i, label %abi_decode_bool_fromMemory.exit.i, label %if_main15.i.i

if_main15.i.i:                                    ; preds = %if_join.i.i
  tail call void @llvm.syncvm.revert(i256 0)
  unreachable

abi_decode_bool_fromMemory.exit.i:                ; preds = %if_join.i.i
  %comparison_result.i74.i = icmp eq i256 %memory_load_result.i73.i, 0
  br i1 %comparison_result.i74.i, label %if_main.i80.i, label %if_join

if_main.i80.i:                                    ; preds = %abi_decode_bool_fromMemory.exit.i
  %memory_load_result.i75.i = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i76.i = inttoptr i256 %memory_load_result.i75.i to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i76.i, align 1
  %addition_result.i77.i = add i256 %memory_load_result.i75.i, 4
  %memory_store_pointer4.i.i = inttoptr i256 %addition_result.i77.i to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i.i, align 1
  %addition_result6.i.i = add i256 %memory_load_result.i75.i, 36
  %memory_store_pointer7.i.i = inttoptr i256 %addition_result6.i.i to ptr addrspace(1)
  store i256 42, ptr addrspace(1) %memory_store_pointer7.i.i, align 1
  %addition_result9.i.i = add i256 %memory_load_result.i75.i, 68
  %memory_store_pointer10.i.i = inttoptr i256 %addition_result9.i.i to ptr addrspace(1)
  store i256 37714057306076988483118529433182395293628422681814405642689417129066110394478, ptr addrspace(1) %memory_store_pointer10.i.i, align 1
  %addition_result12.i.i = add i256 %memory_load_result.i75.i, 100
  %memory_store_pointer13.i.i = inttoptr i256 %addition_result12.i.i to ptr addrspace(1)
  store i256 50411904420896249798390057088552747694053213439589473829759729709664159399936, ptr addrspace(1) %memory_store_pointer13.i.i, align 1
  %14 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i75.i, i256 4294967295)
  %exit_offset_shifted.i.i78.i = shl nuw nsw i256 %14, 64
  %exit_abi_data.i.i79.i = or i256 %exit_offset_shifted.i.i78.i, 10458117451882892562347801444352
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i79.i)
  unreachable

switch_default_block:                             ; preds = %if_main
  %get_u128_value = tail call i256 @llvm.syncvm.getu128()
  %comparison_result29.not = icmp ult i256 %get_u128_value, %1
  br i1 %comparison_result29.not, label %if_main.i73, label %require_helper_stringliteral_f063.exit

if_main.i73:                                      ; preds = %switch_default_block
  %memory_load_result.i67 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i68 = inttoptr i256 %memory_load_result.i67 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i68, align 1
  %addition_result.i69 = add i256 %memory_load_result.i67, 4
  %memory_store_pointer4.i = inttoptr i256 %addition_result.i69 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer4.i, align 1
  %addition_result6.i = add i256 %memory_load_result.i67, 36
  %memory_store_pointer7.i70 = inttoptr i256 %addition_result6.i to ptr addrspace(1)
  store i256 26, ptr addrspace(1) %memory_store_pointer7.i70, align 1
  %addition_result9.i = add i256 %memory_load_result.i67, 68
  %memory_store_pointer10.i = inttoptr i256 %addition_result9.i to ptr addrspace(1)
  store i256 38641671858969249098363720752928066808677092124346750725223143445875249905664, ptr addrspace(1) %memory_store_pointer10.i, align 1
  %15 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i67, i256 4294967295)
  %exit_offset_shifted.i.i71 = shl nuw nsw i256 %15, 64
  %exit_abi_data.i.i72 = or i256 %exit_offset_shifted.i.i71, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i72)
  unreachable

require_helper_stringliteral_f063.exit:           ; preds = %switch_default_block
  %get_u128_value34 = tail call i256 @llvm.syncvm.getu128()
  %comparison_result35 = icmp ugt i256 %get_u128_value34, %1
  br i1 %comparison_result35, label %if_main38, label %if_join

if_main38:                                        ; preds = %require_helper_stringliteral_f063.exit
  %get_u128_value41 = tail call i256 @llvm.syncvm.getu128()
  %comparison_result.i75 = icmp ult i256 %get_u128_value41, %1
  br i1 %comparison_result.i75, label %if_main.i81, label %fun_sub.exit

if_main.i81:                                      ; preds = %if_main38
  %memory_load_result.i76 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer.i77 = inttoptr i256 %memory_load_result.i76 to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer.i77, align 1
  %addition_result.i78 = add i256 %memory_load_result.i76, 4
  %memory_store_pointer5.i = inttoptr i256 %addition_result.i78 to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5.i, align 1
  %addition_result7.i = add i256 %memory_load_result.i76, 36
  %memory_store_pointer8.i = inttoptr i256 %addition_result7.i to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8.i, align 1
  %addition_result10.i = add i256 %memory_load_result.i76, 68
  %memory_store_pointer11.i = inttoptr i256 %addition_result10.i to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11.i, align 1
  %16 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i76, i256 4294967295)
  %exit_offset_shifted.i.i79 = shl nuw nsw i256 %16, 64
  %exit_abi_data.i.i80 = or i256 %exit_offset_shifted.i.i79, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i80)
  unreachable

fun_sub.exit:                                     ; preds = %if_main38
  %subtraction_result.i = sub i256 %get_u128_value41, %1
  %caller49 = tail call i256 @llvm.syncvm.caller()
  %cond56 = icmp eq i256 %caller49, 4
  br i1 %cond56, label %if_join, label %contract_call_ordinary_block

contract_call_ordinary_block:                     ; preds = %fun_sub.exit
  %comparison_result43 = icmp eq i256 %get_u128_value41, %1
  %spec.store.select = select i1 %comparison_result43, i256 14437333991389365756822315673377632757035417522267279379660800, i256 0
  br i1 %comparison_result43, label %contract_call_value_zero_block, label %contract_call_value_non_zero_block

contract_call_join_block:                         ; preds = %contract_call_value_non_zero_block, %contract_call_value_zero_block
  %system_far_call_external.pn = phi { ptr addrspace(3), i1 } [ %system_far_call_external, %contract_call_value_non_zero_block ], [ %contract_call_external.i, %contract_call_value_zero_block ]
  %storemerge.in.in.in = extractvalue { ptr addrspace(3), i1 } %system_far_call_external.pn, 0
  %storemerge63.shrunk = extractvalue { ptr addrspace(3), i1 } %system_far_call_external.pn, 1
  store ptr addrspace(3) %storemerge.in.in.in, ptr @ptr_return_data, align 32
  %storemerge.in.in = ptrtoint ptr addrspace(3) %storemerge.in.in.in to i256
  %storemerge.in = lshr i256 %storemerge.in.in, 96
  %storemerge = and i256 %storemerge.in, 4294967295
  store i256 %storemerge, ptr @returndatasize, align 32
  br i1 %storemerge63.shrunk, label %if_join, label %if_main54

contract_call_value_zero_block:                   ; preds = %contract_call_ordinary_block
  %contract_call_external.i = tail call { ptr addrspace(3), i1 } @__farcall(i256 %spec.store.select, i256 %caller49, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  br label %contract_call_join_block

contract_call_value_non_zero_block:               ; preds = %contract_call_ordinary_block
  %abi_data_add_system_call_marker = or i256 %spec.store.select, 904625697166532776746648320380374280103671755200316906558262375061821325312
  %system_far_call_external = tail call { ptr addrspace(3), i1 } @__farcall(i256 %abi_data_add_system_call_marker, i256 32777, i256 %subtraction_result.i, i256 %caller49, i256 0, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef, i256 undef)
  br label %contract_call_join_block

if_main54:                                        ; preds = %contract_call_join_block
  %returndatasize.i = load i256, ptr @returndatasize, align 32
  %memory_load_result.i82 = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %return_data_copy_destination_pointer.i = inttoptr i256 %memory_load_result.i82 to ptr addrspace(1)
  %return_data_pointer.i = load ptr addrspace(3), ptr @ptr_return_data, align 32
  tail call void @llvm.memcpy.p1.p3.i256(ptr addrspace(1) align 1 %return_data_copy_destination_pointer.i, ptr addrspace(3) align 1 %return_data_pointer.i, i256 %returndatasize.i, i1 false)
  %returndatasize3.i = load i256, ptr @returndatasize, align 32
  %17 = tail call i256 @llvm.umin.i256(i256 %memory_load_result.i82, i256 4294967295)
  %18 = tail call i256 @llvm.umin.i256(i256 %returndatasize3.i, i256 4294967295)
  %exit_offset_shifted.i.i83 = shl nuw nsw i256 %17, 64
  %exit_length_shifted.i.i = shl nuw nsw i256 %18, 96
  %exit_abi_data.i.i84 = or i256 %exit_length_shifted.i.i, %exit_offset_shifted.i.i83
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i.i84)
  unreachable
}

; Function Attrs: nofree null_pointer_is_valid
define private fastcc i256 @fun_sub(i256 %0, i256 %1) unnamed_addr #6 personality ptr @__personality {
entry:
  %comparison_result = icmp ult i256 %0, %1
  br i1 %comparison_result, label %if_main, label %if_join19

if_main:                                          ; preds = %entry
  %memory_load_result = load i256, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 64
  %memory_store_pointer = inttoptr i256 %memory_load_result to ptr addrspace(1)
  store i256 3963877391197344453575983046348115674221700746820753546331534351508065746944, ptr addrspace(1) %memory_store_pointer, align 1
  %addition_result = add i256 %memory_load_result, 4
  %memory_store_pointer5 = inttoptr i256 %addition_result to ptr addrspace(1)
  store i256 32, ptr addrspace(1) %memory_store_pointer5, align 1
  %addition_result7 = add i256 %memory_load_result, 36
  %memory_store_pointer8 = inttoptr i256 %addition_result7 to ptr addrspace(1)
  store i256 30, ptr addrspace(1) %memory_store_pointer8, align 1
  %addition_result10 = add i256 %memory_load_result, 68
  %memory_store_pointer11 = inttoptr i256 %addition_result10 to ptr addrspace(1)
  store i256 37714057306925736537727343956344029380455708191757305005271024775623175766016, ptr addrspace(1) %memory_store_pointer11, align 1
  %2 = tail call i256 @llvm.umin.i256(i256 %memory_load_result, i256 4294967295)
  %exit_offset_shifted.i = shl nuw nsw i256 %2, 64
  %exit_abi_data.i = or i256 %exit_offset_shifted.i, 7922816251426433759354395033600
  tail call void @llvm.syncvm.revert(i256 %exit_abi_data.i)
  unreachable

if_join19:                                        ; preds = %entry
  %subtraction_result = sub i256 %0, %1
  ret i256 %subtraction_result
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i256 @llvm.umin.i256(i256, i256) #9

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i256 @llvm.umax.i256(i256, i256) #9

attributes #0 = { nofree nosync nounwind readnone }
attributes #1 = { nounwind }
attributes #2 = { nofree nounwind readonly }
attributes #3 = { writeonly }
attributes #4 = { noreturn nounwind }
attributes #5 = { argmemonly mustprogress nocallback nofree nounwind willreturn }
attributes #6 = { nofree null_pointer_is_valid }
attributes #7 = { nofree noreturn null_pointer_is_valid }
attributes #8 = { nofree norecurse nosync null_pointer_is_valid }
attributes #9 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false)
!1 = !DIFile(filename: "tests/solidity/complex/defi/Mooniswap/MooniswapPool/Mooniswap.sol:Mooniswap", directory: "")
