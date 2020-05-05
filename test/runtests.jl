using mopkg
using Test

@testset "mopkg.jl" begin
    @test example_func(2) == 4
    @test example_func(-2) == 4
end
