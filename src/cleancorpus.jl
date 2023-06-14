function clean!(cp::CorpusJudicalYuan)
    cp.question = replace(cp.question, r"\AQ\d+\s*\W\s*" => "")
    # Shortnotes:
    # r"\W" matches "：" or "？"
    # r"\w+" matches "中文"
end
