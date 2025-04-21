using Dubins
using StaticArrays
using Test
using ForwardDiff

silence!()

@testset "Dubins" begin
    include("test_api.jl")
    include("test_path.jl")
    include("test_allocations.jl")
    include("test_mod2pi.jl")
    include("test_derivative.jl")
end
