using Aqua: Aqua
using GradedArraysNext: GradedArraysNext
using Test: @testset

@testset "Code quality (Aqua.jl)" begin
    Aqua.test_all(GradedArraysNext)
end
