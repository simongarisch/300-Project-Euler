#=
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
=#
STOP = 11

function isprime(n::Int)::Bool
    # will return true if x is prime, false otherwise
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


function istruncatable(n::Int)::Bool
    #= returns true for primes that are both truncatable
       from left to right and right to left.
    =#
    nstr::String = string(n)
    nlen::Int = length(nstr)
    for i::Int in 1:nlen
        left::String = nstr[1:(i-1)]
        right::String = nstr[i:nlen]
        #println(left * ", " * right)
        if length(left) != 0
            if !isprime(parse(Int,left))
                return false
            end
        end
        if !isprime(parse(Int, right))
            return false
        end
    end
    return true
end
#println(istruncatable(3797))  # true


found = 0
totsum = 0
n = 8
while found < STOP
    if isprime(n)
        if istruncatable(n)
            global found += 1
            global totsum += n
        end
    end
    global n += 1
end

println(totsum)  # 748,317
