
# sh simpleaddress/address_with_universal_cleanspaces/run_address.sh


cd simpleaddress/address_with_universal_cleanspaces && thraxmakedep address.grm && make clean && rm -f address.far && make
cd ../../

bazel build //simpleaddress/address_with_universal_cleanspaces:address_thrax_compile_grm

bazel build @thrax//:thraxrewrite-tester


echo ""
echo "Runnning bazel Thrax"
echo ""

for data in "num 123" "නො. 123" "අංක 123"; do
	echo "Test ${data} "

	echo $data | bazel-bin/external/thrax/thraxrewrite-tester \
	--far="bazel-genfiles/simpleaddress/address_with_universal_cleanspaces/address.far" \
	--rules="ADDRESS_MARKUP"

	echo ""
done

# Copy bazel far
cp bazel-genfiles/simpleaddress/address_with_universal_cleanspaces/address.far simpleaddress/address_with_universal_cleanspaces/bazel_address.far


echo ""
echo "Runnning Pure Thrax"
echo ""

cd simpleaddress/address_with_universal_cleanspaces/

for data in "num 123" "නො. 123" "අංක 123"; do
	echo "Test ${data} "

	echo $data | thraxrewrite-tester \
	--far="address.far" \
	--rules="ADDRESS_MARKUP"
	echo ""
done
