using BlockSparseArrays: BlockUnitRange, blockrange, eachblockaxis
function dual(r::BlockUnitRange)
  return blockrange(map(dual, eachblockaxis(r)))
end
