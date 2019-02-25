

function is_prime(x::Int)::Bool
    if x <= 1
        return false
    end
    if x == 2
        return true
    end
    for i::Int in 3:(x-1)
        if x % i == 0
            return false
        end
    end
    return true
end


function quadratic_formula(n::Int, a::Int, b::Int)::Int
    # returns the result of n^2 + a*n + b
    return n^2 + a*n + b
end

asearch_range = -999:999
bsearch_range = -1000:1000

maxprimes = 0
product = 0

for a in asearch_range
    for b in bsearch_range
        n = 0
        isprime = true
        while isprime
            qfresult = quadratic_formula(n, a, b)
            isprime = is_prime(qfresult)
            if isprime
                n += 1
                if n > maxprimes
                    global maxprimes, product
                    maxprimes = n
                    product = a * b
                end
            end
        end
    end
end

println(product)  # -59,231
