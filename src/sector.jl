abstract type Sector{T} <: AbstractUnitRange{T} end
Base.first(s::Sector) = one(eltype(s))
Base.last(s::Sector) = length(s)
Base.axes(s::Sector) = (s,)
Base.axes1(s::Sector) = s

function Base.getindex(s::Sector, i::Sector)
    s == i || error("sectors must match")
    return i
end

abstract type AbelianSector{T} <: Sector{T} end
Base.length(::AbelianSector) = 1

using DiagonalArrays: Delta

function Base.similar(
        A::Type{<:AbstractArray{T}}, ax::Tuple{AbelianSector, Vararg{AbelianSector}}
    ) where {T}
    return Delta{T}(ax)
end

# TODO: Add a check that the flux matches. Also, generalize to other types, like
# `ScaledDelta`.
function Base.reshape(a::Delta, ax::Tuple{AbelianSector, Vararg{AbelianSector}})
    length(a) == prod(length, ax) || throw(DimensionMismatch("reshape sizes don't match"))
    return Delta{eltype(a)}(ax)
end
