module CorpusCleanerForTWLaws

include("corpustype.jl")
export CorpusJudicalYuan

include("cleancorpus.jl")
export clean!

using JSON
include("convert_output.jl")
export CorpusFormal

end
