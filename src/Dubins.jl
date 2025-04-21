module Dubins

using StaticArrays
import Logging
import LoggingExtras

# Setup Logging
include("logging.jl")
function __init__()
    global _DEFAULT_LOGGER = Logging.current_logger()
    global _LOGGER = Logging.ConsoleLogger(; meta_formatter = Dubins._dubins_metafmt)
    return Logging.global_logger(_LOGGER)
end

""" 
    mod2pi(x)
override the default mod2pi function to use atan2, so that we can take derivatives.
"""
function mod2pi(x)
    y = atan(sin(x), cos(x))
    z = y < 0 ? y + 2π : y
    return z
end


include("typedefs.jl")
include("paths.jl")
include("path_fcns.jl")

end
