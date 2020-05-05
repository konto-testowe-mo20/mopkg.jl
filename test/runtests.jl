using mopkg
using Test

@testset "Function1" begin
    @test example_func(2) == 4
    @test example_func(-2) == 4
end

@testset "Function2" begin
    @test example_func2(2) == 0
    @test example_func2(-3) == -5
    @test example_func2(9) == 7
end
