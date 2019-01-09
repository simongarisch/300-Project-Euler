
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

is_prime <- function(x){
  if(x == 0 || x == 1){
    return(FALSE)
  }
  if(x == 2){
    return(TRUE)
  }
  for(i in 2:as.integer(x^0.5+1)){
    if(x %% i == 0){
      return(FALSE)
    }
  }
  return(TRUE)
}

sum = 0
for(i in 1:2000000-1){
  if(is_prime(i)){
    sum = sum + i
  }
}

print(sum)  # 142,913,828,922
