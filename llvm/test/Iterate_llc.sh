# to be called like: source llvm/test/Iterate_llc.sh 2>&1  | tee -a iterate_llc.log

echo
echo =========================
date

pushd ..

cargo run --bin compiler-tester -- --mode='M0B0 0.8.20' --load-system-contracts system-contracts-stable-build -D    --zksolc '../compiler-solidity/target/debug/zksolc'  --zkvyper '../compiler-vyper/target/debug/zkvyper'
date
for file in ./debug/*.unoptimized.ll; do
  valgrind   -q --trace-children=yes --error-exitcode=42 --suppressions=/home/zekebot/Documents/Code/compiler-tester/llvm/llvm/Valgrind_suppressions.supp   ./target-llvm/build-final/bin/llc -O3 "${file}" -o test.zasm
done

popd

echo Done at
date
