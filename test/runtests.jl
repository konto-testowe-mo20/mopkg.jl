using mopkg
using Test

@testset "Single variable optimizers" begin

    @testset "Epsilon tests" begin
        for tolerance in [1e-1, 1e-3, 1e-5, 1e-7]
            @test isapprox(line_optimize(x -> x^2 -1, 3.0; eps=tolerance)[1], 0.0, atol=tolerance)
            @test isapprox(line_optimize(x -> x^2 -1, 3.0; eps=tolerance)[2], -1.0, atol=tolerance)
        end
    end


end
