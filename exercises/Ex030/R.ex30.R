
# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
#
# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 1^4 is not a sum it is not included.
#
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
options(scipen = 999)  # disabling scientific notation when converting to string
POWER <- 5
ubound <- POWER * 9 ^ POWER

digit_powers_equal <- function(numstr, power){
  numlist <- strsplit(as.character(numstr), "")
  pow_sum <- do.call(sum, lapply(numlist, function(x) as.numeric(x)^power))
  return(as.character(pow_sum) == numstr)
}
#print(digit_powers_equal("1634", 4))  # TRUE

total <- 0
num <- 2
while(num <= ubound){
  if(digit_powers_equal(as.character(num), POWER)){
    total <- total + num
  }
  num = num + 1
}

print(total)  # 443,839
