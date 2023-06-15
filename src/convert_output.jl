function CorpusCleanerForTWLaws.Dict(c::CorpusType)
    ckeys = fieldnames(typeof(c))
    d = Dict()
    for k in ckeys
        d[k] = getproperty(c, k)
    end
    return d
end

formaldict(cp::CorpusType) = Dict(CorpusFormal(cp))

CorpusCleanerForTWLaws.print(io::IO, cps::Vector{<:CorpusType}) = JSON.print(io, formaldict.(cps))

CorpusCleanerForTWLaws.print(io::IO, cp::CorpusType) = JSON.print(io, formaldict(cp))
