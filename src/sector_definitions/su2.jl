struct SU2 <: Sector{Int}
  j::Int
  isdual::Bool
end
SU2(j::Int) = SU2(j, false)
function Base.show(io::IO, s::SU2)
  str = "SU2($(s.j))"
  if isdual(s)
    str = "dual($str)"
  end
  print(io, str)
  return nothing
end
Base.length(s::SU2) = 2 * s.j + 1
isdual(s::SU2) = s.isdual
dual(s::SU2) = SU2(s.j, !isdual(s))
