module GradedArraysNext

export U1, SU2, dual, isdual

include("dual.jl")
include("sector.jl")
include("sector_definitions/u1.jl")
include("sector_definitions/su2.jl")
include("ext/kroneckerarrays.jl")

end
