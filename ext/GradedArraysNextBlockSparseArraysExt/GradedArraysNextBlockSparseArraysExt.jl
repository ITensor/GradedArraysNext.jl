module GradedArraysNextBlockSparseArraysExt

using BlockSparseArrays: BlockUnitRange, blockrange, eachblockaxis
using GradedArraysNext: GradedArraysNext, dual
function GradedArraysNext.dual(r::BlockUnitRange)
    return blockrange(map(dual, eachblockaxis(r)))
end

end
