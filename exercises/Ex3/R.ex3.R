
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
# See https://www.mathsisfun.com/prime-factorization.html


is_prime <- function(x){
  if(x == 2 || x == 3){
    return(TRUE)
  }
  for(i in 2:x-1){
    if(x %% i == 0){
      return(FALSE)
    }
  }
  return(TRUE)
}

largest <- NULL         # the largest prime factor
target <- 600851475143  # for a target number

# Every composite number has a factor less than or equal
# to its square root.
for(i in 2:as.integer(target**0.5)+1){
  if(is_prime(i) && target %% i == 0){
    largest <- i
  }
}

print(largest)  # 6,857
