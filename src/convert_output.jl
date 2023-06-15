function CorpusCleanerForTWLaws.Dict(c::CorpusType)
    ckeys = fieldnames(typeof(c))
    d = Dict()
    for k in ckeys
        d[k] = getproperty(c, k)
    end
    return d
end
