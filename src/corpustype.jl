abstract type CorpusType end

mutable struct CorpusJudicalYuan <: CorpusType
    question::String
    answer::String
end

function CorpusJudicalYuan(d::Dict)
    CorpusJudicalYuan(d["question"], d["answer"])
end


function CorpusCleanerForTWLaws.Dict(c::CorpusType)
    ckeys = fieldnames(typeof(c))
    d = Dict()
    for k in ckeys
        d[k] = getproperty(c, k)
    end
    return d
end
