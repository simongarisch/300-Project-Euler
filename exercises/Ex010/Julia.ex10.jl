#=
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
=#

function is_prime(x)
    # will return true if x is prime, false otherwise
    if x == 0 || x == 1
        return false
    end
    if x == 2
        return true
    end
    for i in 2:floor(x^0.5+1)
        if x % i == 0
            return false
        end
    end
    return true
end


sum = 0
for i in 1:(2000000-1)
  if is_prime(i)
    global sum
    sum += i
  end
end


println(sum)  # 142,913,828,922
