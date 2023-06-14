@testset "cleancorpus.jl" begin
    # Test question cleaning
    cp = CorpusJudicalYuan("Q38 : 言詞辯論一定要請律師嗎？我沒有錢請律師怎麼辦？", "")
    clean!(cp)
    @test cp.question == "言詞辯論一定要請律師嗎？我沒有錢請律師怎麼辦？"

    cp = CorpusJudicalYuan("Q04 : 新制下人民可以聲請憲法法庭裁判的事項有哪些？", "")
    clean!(cp)
    @test cp.question == "新制下人民可以聲請憲法法庭裁判的事項有哪些？"

    cp = CorpusJudicalYuan("職務法庭是否採行公開審理程序？", "")
    clean!(cp)
    @test cp.question == "職務法庭是否採行公開審理程序？"

end
