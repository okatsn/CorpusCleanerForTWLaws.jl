abstract type CorpusType end

mutable struct CorpusJudicalYuan <: CorpusType
    question::String
    answer::String
end

function CorpusJudicalYuan(d::Dict)
    CorpusJudicalYuan(d["question"], d["answer"])
end


struct CorpusFormal <: CorpusType
    instruction
    input
    output
end

CorpusFormal(cp1::CorpusJudicalYuan) = CorpusFormal(cp1.question, "", cp1.answer)
