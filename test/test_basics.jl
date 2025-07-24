using GradedArraysNext: GradedArraysNext, SU2, U1, dual, isdual
using Test: @test, @testset

@testset "GradedArraysNext" begin
  @testset "dual" begin
    @test dual(1:3) ≡ 1:3
  end
  @testset "isdual" begin
    @test !isdual(1:3)
  end
  @testset "U1" begin
    @test !isdual(U1(1))
    @test isdual(dual(U1(1)))
    @test U1(1) isa AbstractUnitRange{Int}
    @test length(U1(1)) == 1
    @test U1(1) == 1:1
  end
  @testset "SU2" begin
    @test !isdual(SU2(1))
    @test isdual(dual(SU2(1)))
    @test SU2(1) isa AbstractUnitRange{Int}
    @test length(SU2(0)) == 1
    @test length(SU2(1)) == 3
    @test length(SU2(2)) == 5
    @test SU2(0) == 1:1
    @test SU2(1) == 1:3
    @test SU2(2) == 1:5
  end
end
