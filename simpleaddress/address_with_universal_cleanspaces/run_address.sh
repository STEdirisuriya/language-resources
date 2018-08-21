
# sh simpleaddress/address_with_universal_cleanspaces/run_address.sh


$(cd simpleaddress/address_with_universal_cleanspaces && thraxmakedep address.grm && make clean && rm -f address.far && make)

bazel build //simpleaddress/address_with_universal_cleanspaces:address_thrax_compile_grm

bazel build @thrax//:thraxrewrite-tester

CLI="bazel-bin/external/thrax/thraxrewrite-tester --far=bazel-genfiles/simpleaddress/address_with_universal_cleanspaces/address.far --rules=RULE"


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
