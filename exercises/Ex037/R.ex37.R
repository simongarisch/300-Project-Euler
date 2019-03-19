
# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
#
# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
#
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

STOP <- 11

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


istruncatable <- function(n){
  # returns true for primes that are both truncatable
  # from left to right and right to left.
  nstr <- as.character(n)
  nlen <- nchar(nstr)
  for(i in 1:nlen){
    left <- substr(nstr, 1, i-1)
    right <- substr(nstr, i, nlen)
    #print(paste(left, right))
    if(nchar(left) != 0){
      if(!isprime(as.numeric(left))){
        return(FALSE)
      }
    }
    if(!isprime(as.numeric(right))){
      return(FALSE)
    }
  }
  return(TRUE)
}
#print(istruncatable(3797))  # TRUE


found <- 0
totsum <- 0
n <- 8
while(found < STOP){
  if(isprime(n)){
    if(istruncatable(n)){
      found <- found + 1
      totsum <- totsum + n
    }
  }
  n = n + 1
}

print(totsum)  # 748,317
