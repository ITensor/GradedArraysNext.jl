using GradedArraysNext: GradedArraysNext, SU2, U1, dual, isdual
using KroneckerArrays: ×, cartesianrange
using Test: @test, @testset

@testset "KroneckerArrays" begin
  @testset "U1" begin
    p = U1(1) × (1:2)
    @test dual(p) ≡ dual(U1(1)) × (1:2)
    @test length(p) == 2

    r = cartesianrange(p, 2:3)
    @test dual(r) ≡ cartesianrange(dual(U1(1)) × (1:2), 2:3)
    @test length(r) == 2
    @test first(r) == 2
    @test last(r) == 3
  end
  @testset "SU2" begin
    p = SU2(1) × (1:2)
    @test dual(p) ≡ dual(SU2(1)) × (1:2)
    @test length(p) == 6

    r = cartesianrange(p, 2:7)
    @test dual(r) ≡ cartesianrange(dual(SU2(1)) × (1:2), 2:7)
    @test length(r) == 6
    @test first(r) == 2
    @test last(r) == 7
  end
end
