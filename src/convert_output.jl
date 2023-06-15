function CorpusCleanerForTWLaws.Dict(c::CorpusType)
    ckeys = fieldnames(typeof(c))
    d = Dict()
    for k in ckeys
        d[k] = getproperty(c, k)
    end
    return d
end

struct CorpusFormal <: CorpusType
    instruction
    input
    output
end

CorpusFormal(cp::CorpusJudicalYuan) = CorpusFormal(cp.question, "", cp.answer)
