load("//:thrax.bzl", "thrax_compile_grm")


thrax_compile_grm(
    name = "universal_rules",
    deps = ["universal_depot.far"],
)

thrax_compile_grm(
    name = "universal_func",
    deps = [
        "universal_rules.far",
        "universal_rules.grm",
    ],
)

thrax_compile_grm(
    name = "address",
    deps = [
        "universal_func.far",
        "universal_func.grm",
        "universal_rules.far",
        "universal_rules.grm",
    ],
)



