abstract type Sector{T} <: AbstractUnitRange{T} end
Base.first(::Sector) = 1
Base.last(s::Sector) = length(s)
Base.axes(s::Sector) = (s,)
Base.axes1(s::Sector) = s

function Base.getindex(s::Sector, i::Sector)
  s == i || error("sectors must match")
  return i
end

abstract type AbelianSector{T} <: Sector{T} end
Base.length(::AbelianSector) = 1

# TODO: Are these good definitions?
using FillArrays: Eye
function Base.similar(
  A::Type{<:AbstractArray{T}}, ax::Tuple{AbelianSector,AbelianSector}
) where {T}
  return Eye{T}(ax)
end
using KroneckerArrays: Delta
function Base.similar(
  A::Type{<:AbstractArray{T}}, ax::Tuple{AbelianSector,Vararg{AbelianSector}}
) where {T}
  return Delta{T}(ax)
end

using DiagonalArrays: DiagonalArray
using FillArrays: Eye, OnesVector
using KroneckerArrays: Delta
using TensorAlgebra: TensorAlgebra, BlockedTuple, ReshapeFusion
# TODO: Define and use `Delta`.
# TODO: Generalize beyond `AbelianSector`, for example `ProductSector`.
function TensorAlgebra.unmatricize(
  ::ReshapeFusion,
  a::Eye,
  ax::BlockedTuple{2,<:Any,<:Tuple{AbelianSector,Vararg{AbelianSector}}},
)
  length(a) == prod(length, ax) || throw(DimensionMismatch("reshape sizes don't match"))
  return Delta{eltype(a)}(Tuple(ax))
end

## function Base.reshape(
##   a::DiagonalArray{T,<:Any,<:OnesVector{T}}, ax::Tuple{AbelianSector,AbelianSector}
## ) where {T}
##   length(a) == prod(length, ax) || throw(DimensionMismatch("reshape sizes don't match"))
##   return Eye{T}(ax)
## end
## function Base.reshape(
##   a::Eye{T}, ax::Tuple{AbelianSector,AbelianSector}
## ) where {T}
##   length(a) == prod(length, ax) || throw(DimensionMismatch("reshape sizes don't match"))
##   return Eye{T}(ax)
## end
