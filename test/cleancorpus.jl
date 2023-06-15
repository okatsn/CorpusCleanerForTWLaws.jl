@testset "test regex for clean" begin
    @test match(CorpusCleanerForTWLaws.expr_qncolon, "Q12 ： 哈囉隨便拉").match == "Q12 ： "
    @test isnothing(match(CorpusCleanerForTWLaws.expr_qncolon, "FAQ12：J個不是目標"))
    @test match(CorpusCleanerForTWLaws.expr_manylnbr, "我想提起行政訴訟，但不知道應以哪個機關為被告？\r\n\r\n提起行政訴訟").match == "\r\n\r"
    @test match(CorpusCleanerForTWLaws.expr_manylnbr, "被告也會有所不同。\r\n\r\n\r\n\r\n撤銷訴訟或課予義務訴").match == "\r\n\r\n\r\n\r"
    @test match(CorpusCleanerForTWLaws.expr_manylnbr, "被告也會有所不同。\n\n\n\n撤銷訴訟或課予義務訴").match == "\n\n\n"
end

@testset "cleancorpus.jl" begin
    # Test question cleaning
    cp1 = CorpusJudicalYuan("Q38 : 言詞辯論一定要請律師嗎？我沒有錢請律師怎麼辦？", "")
    clean!(cp1)
    @test cp1.question == "言詞辯論一定要請律師嗎？我沒有錢請律師怎麼辦？"

    cp1 = CorpusJudicalYuan("Q04 : 新制下人民可以聲請憲法法庭裁判的事項有哪些？", "")
    clean!(cp1)
    @test cp1.question == "新制下人民可以聲請憲法法庭裁判的事項有哪些？"

    cp1 = CorpusJudicalYuan("職務法庭是否採行公開審理程序？", "")
    clean!(cp1)
    @test cp1.question == "職務法庭是否採行公開審理程序？"

    cp1 = CorpusJudicalYuan("", "被告也會有所不同。\r\n\r\n\r\n\t\r\n\t撤銷訴訟或課予義務訴")
    clean!(cp1)
    @test cp1.answer == "被告也會有所不同。\n撤銷訴訟或課予義務訴"
end
