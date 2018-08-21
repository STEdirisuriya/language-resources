# sh simpleaddress/run_test.sh


$(cd simpleaddress && thraxmakedep simpleaddress.grm && make clean && rm -f simpleaddress.far && make)

bazel build //simpleaddress:simpleaddress_thrax_compile_grm

CLI="bazel-bin/external/thrax/thraxrewrite-tester --far=bazel-genfiles/simpleaddress/simpleaddress.far --rules=RULE"


echo ""
echo "Runnning bazel Thrax"
echo ""

for data in "num 123" "no. 123" "අංක 123"; do
	echo "Test ${data} "

	echo $data | bazel-bin/external/thrax/thraxrewrite-tester \
	--far="bazel-genfiles/simpleaddress/simpleaddress.far" \
	--rules="ADDRESS_MARKUP"

	echo ""
done



echo ""
echo "Runnning Pure Thrax"
echo ""

cd simpleaddress/

for data in "num 123" "no. 123" "අංක 123"; do
	echo "Test ${data} "

	echo $data | thraxrewrite-tester \
	--far="simpleaddress.far" \
	--rules="ADDRESS_MARKUP"
	echo ""
done
