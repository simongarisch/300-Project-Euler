#=
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
that the 6th prime is 13.
What is the 10,001st prime number?
=#

function is_prime(x)
    # will return true if x is prime, false otherwise
    if x == 0 || x == 1
        return false
    end
    if x == 2
        return true
    end
    for i in 2:x-1
        if x % i == 0
            return false
        end
    end
    return true
end


number = counter = 0
while counter < 10001
    global number, counter
    number += 1
    if is_prime(number)
        counter += 1
    end
end

println(number)  # 104,743
