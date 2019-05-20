#=
The arithmetic sequence, 1487, 4817, 8147,
in which each of the terms increases by 3330, is unusual in two ways:
(i) each of the three terms are prime, and,
(ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
=#
using Primes
import Primes: isprime

START = 1488  # look for the next one
STOP = Int(1e4)
INCREMENT = 3330


function ispermutation(a::Int, b::Int)::Bool
    astr::String = join(sort(split(string(a), "")), "")
    bstr::String = join(sort(split(string(b), "")), "")
    return astr == bstr
end


function primeperms()::Int
    global INCREMENT
    primes::Array{Int} = [x for x in START:STOP if isprime(x)]
    nprimes::Int = length(primes)
    for idx1::Int in 1:nprimes
        prime1::Int = primes[idx1]
        for idx2::Int in idx1:nprimes
            prime2::Int = primes[idx2]
            for idx3::Int in idx2:nprimes
                prime3::Int = primes[idx3]
                # check for a constant increment
                if prime1 + INCREMENT == prime2
                    if prime2 + INCREMENT == prime3
                        # and that these are permutations
                        if ispermutation(prime1, prime2)
                            if ispermutation(prime2, prime3)
                                primestr1::String = string(prime1)
                                primestr2::String = string(prime2)
                                primestr3::String = string(prime3)
                                return parse(Int, join([primestr1, primestr2, primestr3], ""))
                            end
                        end
                    end
                end
            end
        end
    end
end


println(primeperms())  # 296,962,999,629
