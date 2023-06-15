expr_qncolon = r"\AQ\d+\s*\W\s*"
# Shortnotes:
# - r"\W" matches "：" or "？"
# - r"\w+" matches "中文"
expr_manylnbr = r"(\r|\n)+(?=\n)"
expr_tab = r"\t"
expr_1stlnbr = r"\A(\n|\r)+"
expr_endlnbr = r"(\n|\r)+\Z"

"""
`replacex(content, p...::Pair)` replace `content` with pairs of strings.
Currently, `replace` supports only one string substitution (i.e., `replace(c, "hello" => "world")`)

"""
function replacex(content, prs...; kwargs...)
    for p in prs
        content = replace(content, p; kwargs...)
    end
    return content
end


function clean!(cp1::CorpusJudicalYuan)
    cp1.question = replace(cp1.question, expr_qncolon => "")
    answer = replacex(cp1.answer,
        r"\r" => "", # remove all carridge return
        expr_tab => "",
        "▍" => "",
        Regex(cp1.question) => "",
        expr_manylnbr => "",
        expr_1stlnbr => "",
        expr_endlnbr => ""
    )
    cp1.answer = answer

end
