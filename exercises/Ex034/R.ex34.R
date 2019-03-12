
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

is_curious <- function(x){
  # returns True if x is equal to the sum its digit factorials, False otherwise
  sumfact <- 0
  for(digit in strsplit(as.character(x), "")[[1]]){
    sumfact <- sumfact + factorial(as.numeric(digit))
  }
  if(x == sumfact){
    return(TRUE)
  }else{
    return(FALSE)
  }
}
#print(is_curious(145))  # TRUE

get_max_digits <- function(){
  digit <- 1
  while(factorial(9) * digit > (digit - 1) ^ 10){
    digit <- digit + 1
  }
  return(digit)
}

digits <- get_max_digits()
curious_numbers <- c()
#  as 1! = 1 and 2! = 2 are not sums they are not included
for(x in 3:(1 * 10 ^ digits)){
  if(is_curious(x)){
    curious_numbers <- c(curious_numbers, x);
  }
}

print(sum(curious_numbers))  # 40,730
