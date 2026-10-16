using SciMLTesting
using JET
using Test

run_qa(
    SciMLTesting;
    explicit_imports = true,
    ei_kwargs = (;
        all_qualified_accesses_are_public = (;
            ignore = (
                # Aqua has no public API for the composite entry point
                :test_all,
                # Pkg has no public API for the active-env dependency graph
                :dependencies,
                # Base has no public API for the loaded-module table
                :loaded_modules,
                # Base.Docs has no public Binding / meta API for docstring lookup
                :Binding,
                :meta,
                # JET weakdep extension registration hook; intentionally non-public
                :_register_qa_tool!,
            ),
        ),
    ),
)
