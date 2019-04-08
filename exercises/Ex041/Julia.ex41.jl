#=
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
=#
using Combinatorics

DIGITS = "123456789"

n = length(DIGITS)
largest = 0


function isprime(n::Int)::Bool
    # will return true if n is prime, false otherwise
    if n < 2
        return false
    end
    if n == 2
        return true
    end
    for i::Int in 2:(floor(n ^ 0.5) + 1)
        if n % i == 0
            return false
        end
    end
    return true
end


while n >= 1 && largest==0
    digits = DIGITS[1:n]
    perms = reverse([i for i in Combinatorics.permutations(digits)])
    for perm in perms
        val = parse(Int, join(perm))
        if isprime(val)
            global largest = val
            break
        end
    end
    global n -= 1
end

print(largest)  # 7,652,413
