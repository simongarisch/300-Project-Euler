
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.
# What is the 10,001st prime number?

is_prime <- function(x){
  if(x == 0 || x == 1){
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


number = counter = 0
while(counter < 10001){
  number = number + 1
  if(is_prime(number)){
    counter = counter + 1
  }
}

print(number)  # 104,743
