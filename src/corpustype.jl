"""
abstract type `CorpusType`
"""
abstract type CorpusType end


"""
```
mutable struct CorpusJudicalYuan <: CorpusType
    question::String
    answer::String
end
```
"""
mutable struct CorpusJudicalYuan <: CorpusType
    question::String
    answer::String
end

"""
`CorpusJudicalYuan(d::Dict)` construct the object `CorpusJudicalYuan` with a dictionary having keys "question" and "answer".
"""
function CorpusJudicalYuan(d::Dict)
    CorpusJudicalYuan(d["question"], d["answer"])
end

"""
The corpus format for LoRA training.

```
struct CorpusFormal <: CorpusType
    instruction
    input
    output
end
```

"""
struct CorpusFormal <: CorpusType
    instruction
    input
    output
end

"""
`CorpusFormal(cp1::CorpusJudicalYuan)` formats `CorpusJudicalYuan <: CorpusType` to `CorpusFormal`.
"""
CorpusFormal(cp1::CorpusJudicalYuan) = CorpusFormal(cp1.question, "", cp1.answer)
