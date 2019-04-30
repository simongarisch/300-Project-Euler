#=
A composite number is a positive integer that can be formed by multiplying
two smaller positive integers.
It was proposed by Christian Goldbach that every odd composite number
can be written as the sum of a prime and twice a square.

9 = 7 + 2 * 1^2
15 = 7 + 2 * 2^2
21 = 3 + 2 * 3^2
25 = 7 + 2 * 3^2
27 = 19 + 2 * 2^2
33 = 31 + 2 * 1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as
the sum of a prime and twice a square?
=#
MAXN = Int(1e4)


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


function generate_odd_compos(n::Int)::Array{Int}
    # generate odd composite numbers using 1:n
    compos::Array{Int} = []
    for i::Int in 2:n
        for j::Int in 2:n
            mult::Int = i*j
            if mult % 2 == 1
                push!(compos, i*j)
            end
        end
    end
    return sort(unique(compos))
end


function generate_primes(n::Int)::Array{Int}
    # generate primes up to n
    primes::Array{Int} = []
    for i::Int in 1:n
        if isprime(i)
            push!(primes, i)
        end
    end
    return primes
end


function generate_squares(n::Int)::Array{Int}
    # generate squares up to n
    squares::Array{Int} = [i^2 for i in 1:Int(sqrt(n))]
    return squares
end


function find_smallest(n::Int)::Int
    # find the smallest odd composite that cannot be written as
    # the sum of a prime and twice a square
    compos::Array{Int} = generate_odd_compos(n)
    primes::Array{Int} = generate_primes(n)
    squares::Array{Int} = generate_squares(n)
    search_arr::Array{Int} = sort(unique([p + 2*s for p=primes, s=squares]))

    smallest::Int = 0
    for n::Int in compos
        if !(n in search_arr)
            smallest = n
            break
        end
    end
    return smallest
end


smallest = find_smallest(MAXN)
println(smallest)  # 5,777
