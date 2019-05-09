
# The first two consecutive numbers to have two distinct prime factors are:
#
# 14 = 2 * 7
# 15 = 3 * 5
#
# The first three consecutive numbers to have three distinct prime factors are:
#
# 644 = 2^2 * 7 * 23
# 645 = 3 * 5 * 43
# 646 = 2 * 17 * 19.
#
# Find the first four consecutive integers to have four distinct prime factors each.
# What is the first of these numbers?
library(matlab)

TARGET_FACTORS = 4
MAXPRIME = 1e3


primes <- c()
for(i in 1:MAXPRIME){
  if(matlab::isprime(i)){
    primes <- c(primes, i)
  }
}


mult_factors <- function(prime_factors){
  # return the results we get from multiplying prime factors
  result <- 1
  for(prime in prime_factors){
    # straight multiplication
    result <- result * prime
  }

  results <- c(result)
  for(prime in prime_factors){
    # where we have ^2
    results <- c(results, result * prime)
  }
  return(results)
}


sequence <- 0
n <- 0
while(TRUE){
  n <- n + 1
  factors <- 0
  prime_factors <- c()
  for(prime in primes){
    if(n %% prime == 0){
      factors <- factors + 1
      prime_factors <- c(prime_factors, prime)
    }
    if(prime > n){
      break
    }
  }

  if(factors == TARGET_FACTORS){
    multiples <- mult_factors(prime_factors)
    if(n %in% multiples){
      sequence <- sequence + 1
    }else{
      sequence <- 0
    }
  }else{
    sequence <- 0
  }

  if(sequence == TARGET_FACTORS){
    break
  }
}

first <- n - TARGET_FACTORS + 1
print(first)  # 134,043
