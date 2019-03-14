#=
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
=#

function is_prime(x::Int)::Bool
    # will return true if x is prime, false otherwise
    if x < 2
        return false
    end
    if x == 2
        return true
    end
    for i::Int in 2:(floor(x ^ 0.5) + 1)
        if x % i == 0
            return false
        end
    end
    return true
end


function digit_rotations(x::Int)::Vector{Int}
    # returns a vector of results from rotating the digits in x
    xstr::String = string(x)
    xlen::Int = length(xstr)
    rotations::Vector{Int} = []
    for i::Int in 1:xlen
        left::String = xstr[1:(i-1)]
        right::String =  xstr[i:xlen]
        rotation::Int = parse(Int, right * left)
        push!(rotations, rotation)
    end
    return rotations
end
#println(digit_rotations(197))  # [197, 971, 719]


function all_primes(numvec::Vector{Int})::Bool
    # returns true if all of the numbers in numvec are prime, false otherwise
    for num::Int in numvec
        if !is_prime(num)
            return false
        end
    end
    return true
end


function is_circular_prime(x::Int)::Bool
    # returns true if x is a circular prime, false otherwise
    rotations::Vector{Int} = digit_rotations(x)
    return all_primes(rotations)
end
#println(is_circular_prime(197))  # true


counter = 0
for x in 1:999999
    if is_prime(x)
        if is_circular_prime(x)
            global counter
            counter += 1
        end
    end
end

println(counter)  # 55
