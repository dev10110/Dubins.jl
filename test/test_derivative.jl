using ForwardDiff

@testset "test allocations shortest path static" begin
    q0 = @SVector zeros(3)
    q1 = @SVector [1.0, 0.0, 0.0]


    errcode, path = dubins_shortest_path(q0, q1, 1.0)
    @test errcode == EDUBOK

    # sample a point on the path
    errcode, qsamp = dubins_path_sample(path, 0.2)
    @test errcode == EDUBOK

    # check if we can also run the sample through a derivative
    dpath = ForwardDiff.derivative(t -> dubins_path_sample(path, t)[2], 0.2)
    @test any(isnan.(dpath)) == false

end
