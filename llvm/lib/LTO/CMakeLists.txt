add_link_options(-L/home/zekebot/Documents/Code/External_Code/Llvm-15.0.4_for_libcxx/build_libcxx/lib/x86_64-unknown-linux-gnu/)


add_llvm_component_library(LLVMLTO
  LTO.cpp
  LTOBackend.cpp
  LTOModule.cpp
  LTOCodeGenerator.cpp
  SummaryBasedOptimizations.cpp
  UpdateCompilerUsed.cpp
  ThinLTOCodeGenerator.cpp

  ADDITIONAL_HEADER_DIRS
  ${LLVM_MAIN_INCLUDE_DIR}/llvm/LTO
  DEPENDS
  intrinsics_gen
  llvm_vcsrevision_h

  LINK_COMPONENTS
  AggressiveInstCombine
  Analysis
  BinaryFormat
  BitReader
  BitWriter
  CodeGen
  Core
  Extensions
  IPO
  InstCombine
  Instrumentation
  Linker
  MC
  ObjCARC
  Object
  Passes
  Remarks
  Scalar
  Support
  Target
  TransformUtils
)
