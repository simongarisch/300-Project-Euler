
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

sum_divisors <- function(x){
  # returns the sum for all divisors of x
  sum <- 0
  if(x>1){
    for(i in 1:(x-1)){
      if(x %% i == 0){
        sum <- sum + i
      }
    }
  }
  return(sum)
}


is_amicable <- function(x){
  # returns true if x is an amicable number, false otherwise
  sum_divx <- sum_divisors(x)
  if(sum_divx == x){
    return(FALSE)
  }
  if(sum_divisors(sum_divx) == x){
    return(TRUE)
  }else{
    return(FALSE)
  }
}

#print(is_amicable(220))  # TRUE
sum <- 0
for(x in 1:(10000-1)){
  if(is_amicable(x)){
    sum <- sum + x
  }
}

print(sum)  # 31,626
