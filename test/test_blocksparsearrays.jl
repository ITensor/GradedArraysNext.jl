using BlockArrays: Block
using BlockSparseArrays: blockrange
using GradedArraysNext: SU2, U1, dual, isdual
using KroneckerArrays: ×, cartesianrange
using Test: @test, @testset

@testset "BlockSparseArrays" begin
  @testset "U1" begin
    r = blockrange([U1(0) × Base.OneTo(2), U1(1) × Base.OneTo(3)])
    rd = dual(r)
    @test r[Block(1)] ≡ cartesianrange(U1(0) × Base.OneTo(2), 1:2)
    @test r[Block(2)] ≡ cartesianrange(U1(1) × Base.OneTo(3), 3:5)
    @test rd[Block(1)] ≡ cartesianrange(dual(U1(0)) × Base.OneTo(2), 1:2)
    @test rd[Block(2)] ≡ cartesianrange(dual(U1(1)) × Base.OneTo(3), 3:5)
  end
  @testset "SU2" begin
    r = blockrange([SU2(0) × Base.OneTo(2), SU2(1) × Base.OneTo(3)])
    rd = dual(r)
    @test r[Block(1)] ≡ cartesianrange(SU2(0) × Base.OneTo(2), 1:2)
    @test r[Block(2)] ≡ cartesianrange(SU2(1) × Base.OneTo(3), 3:11)
    @test rd[Block(1)] ≡ cartesianrange(dual(SU2(0)) × Base.OneTo(2), 1:2)
    @test rd[Block(2)] ≡ cartesianrange(dual(SU2(1)) × Base.OneTo(3), 3:11)
  end
end
