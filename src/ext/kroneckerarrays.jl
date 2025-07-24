using KroneckerArrays: CartesianProduct, ×, arg1, arg2
function dual(a::CartesianProduct)
  return dual(arg1(a)) × dual(arg2(a))
end

using KroneckerArrays:
  CartesianProductUnitRange, cartesianproduct, cartesianrange, unproduct
function dual(a::CartesianProductUnitRange)
  return cartesianrange(dual(cartesianproduct(a)), dual(unproduct(a)))
end
