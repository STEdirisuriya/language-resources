address.far: address.grm universal_rules.far universal_func.far
	thraxcompiler --input_grammar=$< --output_far=$@

universal_rules.far: universal_rules.grm 
	thraxcompiler --input_grammar=$< --output_far=$@

universal_func.far: universal_func.grm universal_rules.far
	thraxcompiler --input_grammar=$< --output_far=$@

clean:
	rm -f universal_rules.far universal_func.far
