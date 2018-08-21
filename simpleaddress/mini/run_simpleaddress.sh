# sh simpleaddress/mini/run_simpleaddress.sh


$(cd simpleaddress/mini && thraxmakedep simpleaddress.grm && make clean && rm -f simpleaddress.far && make)

bazel build @thrax//:thraxrandom-generator
bazel build @thrax//:thraxrewrite-tester

bazel build //simpleaddress/mini:simpleaddress_thrax_compile_grm

RUN_RANDOMGEN=False

CLI="bazel-bin/external/thrax/thraxrewrite-tester --far=bazel-genfiles/simpleaddress/mini/simpleaddress.far --rules=RULE"


echo ""
echo "Runnning bazel Thrax"
echo ""

for data in "num 123" "no. 123" "අංක 123"; do
	echo "Test ${data} "

	echo $data | bazel-bin/external/thrax/thraxrewrite-tester \
	--far="bazel-genfiles/simpleaddress/mini/simpleaddress.far" \
	--rules="ADDRESS_MARKUP"

	echo ""
done

# Copy bazel far
cp bazel-genfiles/simpleaddress/mini/simpleaddress.far simpleaddress/mini/bazel_simpleaddress.far

if [[ ${RUN_RANDOMGEN} == True ]]; then
	for data in "num 123" "no. 123" "අංක 123"; do
		echo "Test Random ${data} "

		echo $data | bazel-bin/external/thrax/thraxrandom-generator \
		--far="bazel-genfiles/simpleaddress/mini/simpleaddress.far" \
		--rule="ADDRESS_MARKUP" --noutput=10

		echo ""
	done
fi



echo ""
echo "Runnning Pure Thrax"
echo ""

cd simpleaddress/mini/

for data in "num 123" "no. 123" "අංක 123"; do
	echo "Test ${data} "

	echo $data | thraxrewrite-tester \
	--far="simpleaddress.far" \
	--rules="ADDRESS_MARKUP"
	echo ""
done


if [[ ${RUN_RANDOMGEN} == True ]]; then
	for data in "num 123" "no. 123" "අංක 123"; do
		echo "Test Random ${data} "

		echo $data | thraxrandom-generator \
		--far="simpleaddress.far" \
		--rule="ADDRESS_MARKUP" --noutput=10

		echo ""
	done
fi
