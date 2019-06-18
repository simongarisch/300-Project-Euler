#=
By replacing the 1st digit of the 2-digit number *3,
it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83,
are all prime.

By replacing the 3rd and 4th digits of 56**3 with the same digit,
this 5-digit number is the first example having seven primes among the ten
generated numbers, yielding the family:
56003, 56113, 56333, 56443, 56663, 56773, and 56993.
Consequently 56003, being the first member of this family,
is the smallest prime with this property.

Find the smallest prime which, by replacing part of the number
(not necessarily adjacent digits) with the same digit,
is part of an eight prime value family.
=#
using Primes
using Combinatorics

START = 1
STOP = 1e6
TARGET_PRIMES = 8
DIGITS = "0123456789"


function collect_primes(start::Int, stop::Int)::Array{Int}
    # collect all prime numbers within some range
    return primes(start, stop)
end
#println(collect_primes(0, 20))  # [2, 3, 5, 7, 11, 13, 17, 19]


function collect_digit_replacements(ndigits)::Array{Array{Int}}
    # we'll have to replace certain digits with a *
    # get combinations of digits we'll need to replace
    combs::Array{Array{Int}} = []
    for i::Int in 1:(ndigits-1)
        for c::Array{Int} in combinations(1:ndigits,i)
            push!(combs, c)
        end
    end
    return combs
end
#println(collect_digit_replacements(2))  # Array{Int64,N} where N[[1], [2]]
#println(collect_digit_replacements(3))  # Array{Int64,N} where N[[1], [2], [3], [1, 2], [1, 3], [2, 3]]


function filter_ndigit(primes::Array{Int}, n::Int)

end
