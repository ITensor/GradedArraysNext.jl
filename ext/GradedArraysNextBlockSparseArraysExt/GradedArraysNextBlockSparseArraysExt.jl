module GradedArraysNextBlockSparseArraysExt

using GradedArraysNext: GradedArraysNext, dual
using BlockSparseArrays: BlockUnitRange, blockrange, eachblockaxis
function GradedArraysNext.dual(r::BlockUnitRange)
  return blockrange(map(dual, eachblockaxis(r)))
end

end
