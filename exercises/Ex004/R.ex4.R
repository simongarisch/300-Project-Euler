
# A palindromic number reads the same both ways. The largest palindrome made from
# the product of two 2-digit numbers is 9009 = 91 * 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

library(stringi)

is_palindromic_number <- function(x){
    # returns true if x is a palindromic number, false otherwise
    strx <- toString(x)
    if(strx == stringi::stri_reverse(strx)){
      return(TRUE)
    }else{
      return(FALSE)
    }
}

largest <- 0
# go through pairs of three digit numbers
# these are all numbers from 100 -> 999
for(i in 100:999){
  for(j in 100:999){
    result <- i * j
    if(is_palindromic_number(result)){
      if(result > largest){
        largest <- result
      }
    }
  }
}

print(largest)  # 906609
