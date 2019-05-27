
# The prime 41, can be written as the sum of six consecutive primes:
#
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
#
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
#
# Which prime, below one-million, can be written as the sum of the most consecutive primes?
MAXPRIME <- 1e1

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

for(i in 1:5){
  print(primes[i])
  print(primes_cumsum[i])
}
