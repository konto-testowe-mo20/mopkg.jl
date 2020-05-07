using mopkg
import mopkg: fdc, sfdc
using Test
import InteractiveUtils: subtypes
"""
Single variable global test functions – functions with single global minimum
key is function (lambda), value (y, x) in minimum
"""
svltf = Dict(
    (x -> x^2 - 1) => (-1.0, 0.0))

@testset "Single variable optimizers" begin
    @testset "General test for SVOptMethods" begin
        for (fun, min) in svltf
            stval = (min[2] + 2)
            @testset "Epsilon tests" begin
                for optim in subtypes(SVOptMethod)
                    for tolerance in [1e-2, 1e-4, 1e-6]
                        @test isapprox(line_optimize(fun, stval; eps=tolerance, method=optim())[1], min[1], atol=tolerance)
                    end
                end
            end
        end
    end
    @testset "Finite differences tests" begin
        for xval in [-π, -π/2, 0, π/2, π]
            @test isapprox(2cos(2xval), mopkg.fdc(x -> sin(2x), xval), atol=1e-5)
        end
        @test isapprox(3^3, mopkg.fdc(x -> x^3, 3), atol=1e-5)
        @test isapprox(4*0.05^3, mopkg.fdc(x -> x^4, 0.05), atol=1e-5)
        for xval in [-π, -π/2, 0, π/2, π]
            @test isapprox(-4sin(2xval), mopkg.sfdc(x -> sin(2x), xval), atol=1e-5)
        end
        @test isapprox(12*0.05^2, mopkg.sfdc(x -> x^4, 0.05), atol=1e-5)
    end
end
