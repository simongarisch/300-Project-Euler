#=
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
See https://www.mathsisfun.com/prime-factorization.html
=#

function is_prime(x)
    # will return true if x is prime, false otherwise
    if x == 2 || x == 3
        return true
    end
    for i in 2:x-1
        if x % i == 0
            return false
        end
    end
    return true
end

largest = nothing      # the largest prime factor
target = 600851475143  # for a target number

#=
Every composite number has a factor less than or equal
to its square root.
=#
for i in 2:floor(target ^ 0.5) + 1
  if is_prime(i) && target % i == 0
      largest = i
  end
end

println(largest) # 6,857
