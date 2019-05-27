#=
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
=#
MAXPRIME = Int(1e6)


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


function collect_primes(maxprime::Int)::Array{Int}
    primes::Array{Int} = []
    for i::Int in 1:maxprime
        if isprime(i)
            push!(primes, i)
        end
    end
    return primes
end


function which_prime()::Array{Int}
    # Which prime, below one-million,
    # can be written as the sum of the most consecutive primes?
    primes::Array{Int} = collect_primes(MAXPRIME)
    primes_cumsum::Array{Int} = [0]
    primeslen::Int = length(primes)

    total::Int = 0
    for i::Int in 1:primeslen
        total += primes[i]
        push!(primes_cumsum, total)
    end

    found::Bool = false
    which_prime::Int = 0
    which_len::Int = primeslen
    diff::Int = 0

    while !found
        for i::Int in 1:(primeslen - which_len + 1)
            diff = primes_cumsum[i + which_len] - primes_cumsum[i]
            if diff > MAXPRIME
                break
            end
            if diff in primes
                found = true
                which_prime = diff
                break
            end
        end
        if found
            break
        end
        which_len -= 1
    end

    return [which_prime, which_len]
end


println(which_prime()[1])  # 997,651
