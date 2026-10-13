using SciMLTesting

# Explicit-args mode: Core is a thunk so the large fixture suite stays in Main
# (folder-mode @safetestset would nest fixtures and break Main.<Fixture> autodocs
# probes). QA uses the prescribed test/qa sub-env + file body.
run_tests(;
    core = () -> include(joinpath(@__DIR__, "core_tests.jl")),
    qa = (;
        env = joinpath(@__DIR__, "qa"),
        body = joinpath(@__DIR__, "qa", "qa.jl"),
    ),
)
