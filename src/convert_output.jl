"""
`CorpusCleanerForTWLaws.Dict(c::CorpusType)` is a constructor of `Dict` for corpus of `CorpusType`.
"""
function CorpusCleanerForTWLaws.Dict(c::CorpusType)
    ckeys = fieldnames(typeof(c))
    d = Dict()
    for k in ckeys
        d[k] = getproperty(c, k)
    end
    return d
end

"""
`formaldict(cp1::CorpusType)` returns a "formal" dictionary according to the format of `CorpusFormal`.
"""
formaldict(cp1::CorpusType) = Dict(CorpusFormal(cp1))


commonprintdocstring = "do `JSON.print` for `corpus::CorpusType`"

"""
`CorpusCleanerForTWLaws.print(io::IO, cps::Vector{<:CorpusType})` $commonprintdocstring.
"""
CorpusCleanerForTWLaws.print(io::IO, cps::Vector{<:CorpusType}) = JSON.print(io, formaldict.(cps))

"""
`CorpusCleanerForTWLaws.print(io::IO, cp1::CorpusType)` $commonprintdocstring.
"""
CorpusCleanerForTWLaws.print(io::IO, cp1::CorpusType) = JSON.print(io, formaldict(cp1))
