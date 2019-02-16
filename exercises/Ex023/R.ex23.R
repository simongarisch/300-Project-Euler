
# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number.
# For example, the sum of the proper divisors of 28 would be
# 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than n
# and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
# the smallest number that can be written as the sum of two abundant numbers is 24.
# By mathematical analysis, it can be shown that all integers greater than 28123
# can be written as the sum of two abundant numbers. However, this upper limit cannot
# be reduced any further by analysis even though it is known that the greatest number
# that cannot be expressed as the sum of two abundant numbers is less than this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

library("arrangements")
LIMIT <- 28123


get_sum_proper_divisors <- function(x){
  # returns the sum of all proper divisors for x
  divisors <- c()
  if(x == 1){
    return(0)
  }
  for(i in 1:(as.integer(x/2))){
    if(x %% i == 0){
      divisors <- c(divisors, i)
    }
  }
  #print(divisors)
  return(sum(divisors))
}
#print(get_sum_proper_divisors(12))  # 16

abundant_numbers = c()
for(x in 1:LIMIT){
  if(get_sum_proper_divisors(x) > x){
    abundant_numbers <- c(abundant_numbers, x)
  }
}
#print(abundant_numbers)

# get all combinations with replacement for two of these abundent numbers
combsums <- unique(rowSums(combinations(abundant_numbers, 2, replace=TRUE)))

sum <- 0
for(x in 1:LIMIT){
  if(x %in% combsums){
    next
  }else{
    sum <- sum + x
  }
}
print(sum)  # 4,179,871
