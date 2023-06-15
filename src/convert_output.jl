function CorpusCleanerForTWLaws.Dict(c::CorpusType)
    ckeys = fieldnames(typeof(c))
    d = Dict()
    for k in ckeys
        d[k] = getproperty(c, k)
    end
    return d
end

formaldict(cp1::CorpusType) = Dict(CorpusFormal(cp1))

CorpusCleanerForTWLaws.print(io::IO, cps::Vector{<:CorpusType}) = JSON.print(io, formaldict.(cps))

CorpusCleanerForTWLaws.print(io::IO, cp1::CorpusType) = JSON.print(io, formaldict(cp1))
