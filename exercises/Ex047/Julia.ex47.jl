#=
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 * 7
15 = 3 * 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2^2 * 7 * 23
645 = 3 * 5 * 43
646 = 2 * 17 * 19.

Find the first four consecutive integers to have four distinct prime factors each.
What is the first of these numbers?
=#
TARGET_FACTORS = 4
MAXPRIME = Int(1e3)


function isprime(x::Int)::Bool
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


function mult_factors(prime_factors::Array{Int})::Array{Int}
    # return the results we get from multiplying prime factors
    result::Int = 1
    for prime in prime_factors
        result *= prime
    end

    results::Array{Int} = [result]
    for prime in prime_factors
        push!(results, result * prime)
    end
    return results
end


primes = [x for x in 1:MAXPRIME if isprime(x)]

sequence = 0
n = 0
while true
    global n, sequence
    n += 1
    factors = 0
    prime_factors::Array{Int} = []
    for prime in primes
        if n % prime == 0
            factors += 1
            push!(prime_factors, prime)
        end
        if prime > n
            break
        end
    end

    if factors == TARGET_FACTORS
        multiples = mult_factors(prime_factors)
        if n in multiples
            sequence += 1
        else
            sequence = 0
        end
    else
        sequence = 0
    end

    if sequence == TARGET_FACTORS
        break
    end
end

first = n - TARGET_FACTORS + 1
println(first)  # 134,043
