abstract type Sector{T} <: AbstractUnitRange{T} end
Base.first(::Sector) = 1
Base.last(s::Sector) = length(s)

abstract type AbelianSector{T} <: Sector{T} end
Base.length(::AbelianSector) = 1
