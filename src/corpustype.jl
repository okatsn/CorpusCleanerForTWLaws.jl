abstract type CorpusType end

mutable struct CorpusJudicalYuan <: CorpusType
    question::String
    answer::String
end

function CorpusJudicalYuan(d::Dict)
    CorpusJudicalYuan(d["question"], d["answer"])
end
