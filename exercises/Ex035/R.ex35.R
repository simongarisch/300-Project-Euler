
# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?

is_prime <- function(x){
  if(x < 2){
    return(FALSE)
  }
  if(x == 2){
    return(TRUE)
  }
  for(i in 3:x-1){
    if(x %% i == 0){
      return(FALSE)
    }
  }
  return(TRUE)
}


digit_rotations <- function(x){
  # returns a vector of results from rotating the digits in x
  xstr <- as.character(x)
  xlen <- nchar(xstr)
  rotations <- c()
  for(i in 1:xlen){
    left <- substr(xstr, 0, i-1)
    right <- substr(xstr, i, xlen)
    rotation <- as.numeric(paste0(right, left))
    rotations <- c(rotations, rotation)
  }
  return(rotations)
}
#print(digit_rotations(197))  # 197 971 719


all_primes <- function(numvec){
  # returns true if all of the numbers in numvec are prime, false otherwise
  for(i in 1:length(numvec)){
    number <- numvec[i]
    if(!is_prime(number)){
      return(FALSE)
    }else{
      return(TRUE)
    }
  }
}


is_circular_prime <- function(x){
  # returns true if x is a circular prime, false otherwise
  rotations <- digit_rotations(x)
  return(all_primes(rotations))
}
#print(is_circular_prime(197))  # TRUE


counter <- 0
for(x in 1:(1e6-1)){
  if(is_prime(x)){
    if(is_circular_prime(x)){
      counter <- counter + 1
    }
  }
  print(x)
}

print(counter)
