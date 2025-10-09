module GradedArraysNextKroneckerArraysExt

using GradedArraysNext: GradedArraysNext, dual
using KroneckerArrays: CartesianProduct, ×, arg1, arg2
function GradedArraysNext.dual(a::CartesianProduct)
    return dual(arg1(a)) × dual(arg2(a))
end

using KroneckerArrays:
    CartesianProductUnitRange, cartesianproduct, cartesianrange, unproduct
function GradedArraysNext.dual(a::CartesianProductUnitRange)
    return cartesianrange(dual(cartesianproduct(a)), dual(unproduct(a)))
end

end
