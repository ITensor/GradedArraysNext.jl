using GradedArraysNext: GradedArraysNext
using Documenter: Documenter, DocMeta, deploydocs, makedocs

DocMeta.setdocmeta!(
  GradedArraysNext, :DocTestSetup, :(using GradedArraysNext); recursive=true
)

include("make_index.jl")

makedocs(;
  modules=[GradedArraysNext],
  authors="ITensor developers <support@itensor.org> and contributors",
  sitename="GradedArraysNext.jl",
  format=Documenter.HTML(;
    canonical="https://itensor.github.io/GradedArraysNext.jl",
    edit_link="main",
    assets=["assets/favicon.ico", "assets/extras.css"],
  ),
  pages=["Home" => "index.md", "Reference" => "reference.md"],
)

deploydocs(;
  repo="github.com/ITensor/GradedArraysNext.jl", devbranch="main", push_preview=true
)
