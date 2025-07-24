struct U1 <: AbelianSector{Int}
  charge::Int
  isdual::Bool
end
U1(charge::Int) = U1(charge, false)
function Base.show(io::IO, s::U1)
  str = "U1($(s.charge))"
  if isdual(s)
    str = "dual($str)"
  end
  print(io, str)
  return nothing
end
isdual(s::U1) = s.isdual
dual(s::U1) = U1(s.charge, !isdual(s))
