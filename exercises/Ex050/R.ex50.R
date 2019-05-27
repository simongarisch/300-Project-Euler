
# The prime 41, can be written as the sum of six consecutive primes:
#
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
#
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
#
# Which prime, below one-million, can be written as the sum of the most consecutive primes?
MAXPRIME <- 1e6

isprime <- function(x){
  if(x < 2){
    return(FALSE)
  }
  if(x == 2){
    return(TRUE)
  }
  for(i in 2:as.integer(x ^ 0.5 + 1)){
    if(x %% i == 0){
      return(FALSE)
    }
  }
  return(TRUE)
}

primes <- c()
for(i in 1:MAXPRIME){
  if(isprime(i)){
    primes <- c(primes, i)
  }
}

primeslen <- length(primes)
primes_cumsum <- c(0)
total <- 0
for(i in 1:primeslen){
  total <- total + primes[i]
  primes_cumsum <- c(primes_cumsum, total)
}

found <- FALSE
which_prime <- 0
which_len <- primeslen

while(!found){
  for(i in 1:(primeslen - which_len + 1)){
    diff <- primes_cumsum[i + which_len] - primes_cumsum[i]
    if(diff > MAXPRIME){
      break
    }
    if(diff %in% primes){
      found <- TRUE
      which_prime <- diff
      break
    }
  }
  if(found){
    break
  }
  which_len = which_len - 1
}

print(which_prime)  # 997,651
