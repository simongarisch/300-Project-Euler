
# The arithmetic sequence, 1487, 4817, 8147,
# in which each of the terms increases by 3330, is unusual in two ways:
# (i) each of the three terms are prime, and,
# (ii) each of the 4-digit numbers are permutations of one another.
#
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
# exhibiting this property, but there is one other 4-digit increasing sequence.
#
# What 12-digit number do you form by concatenating the three terms in this sequence?

START = 1488  # look for the next one
STOP = 1e4
INCREMENT = 3330


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


ispermutation <- function(a, b){
  astr <- paste(sort(unlist(strsplit(as.character(a), ""))), collapse = "")
  bstr <- paste(sort(unlist(strsplit(as.character(b), ""))), collapse = "")
  return(astr == bstr)
}


primeperms <- function(){
  primes <- c()
  for(i in START:STOP){
    if(isprime(i)){
      primes <- c(primes, i)
    }
  }

  numprimes <- length(primes)
  for(idx1 in 1:numprimes){
    prime1 = primes[idx1]
    for(idx2 in idx1:numprimes){
      prime2 = primes[idx2]
      for(idx3 in idx2:numprimes){
        prime3 = primes[idx3]
        # check for a constant increment
        if(prime1 + INCREMENT == prime2){
          if(prime2 + INCREMENT == prime3){
            # and that these are permutations
            if(ispermutation(prime1, prime2)){
              if(ispermutation(prime2, prime3)){
                primestr1 <- as.character(prime1)
                primestr2 <- as.character(prime2)
                primestr3 <- as.character(prime3)
                return(paste0(primestr1, primestr2, primestr3))
              }
            }
          }
        }
      }
    }
  }
}

print(primeperms())  # 296,962,999,629
