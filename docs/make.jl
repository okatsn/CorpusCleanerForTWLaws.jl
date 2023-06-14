using CorpusCleanerForTWLaws
using Documenter

DocMeta.setdocmeta!(CorpusCleanerForTWLaws, :DocTestSetup, :(using CorpusCleanerForTWLaws); recursive=true)

makedocs(;
    modules=[CorpusCleanerForTWLaws],
    authors="okatsn <okatsn@gmail.com> and contributors",
    repo="https://github.com/okatsn/CorpusCleanerForTWLaws.jl/blob/{commit}{path}#{line}",
    sitename="CorpusCleanerForTWLaws.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://okatsn.github.io/CorpusCleanerForTWLaws.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/okatsn/CorpusCleanerForTWLaws.jl",
    devbranch="main",
)
