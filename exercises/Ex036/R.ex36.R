
# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not include leading zeros.)
library("stringi")
 library("binaryLogic")

#print(paste(as.binary(585), collapse = ""))  # "1001001001"

is_both_bases_palindromic <- function(x){
  # returns true if x is palindromic in base 10 and base 2, false otherwise.
  xstr10 <- as.character(x)
  xstr2 <- paste(as.binary(x), collapse = "")
  if(xstr10 == stringi::stri_reverse(xstr10)){
    if(xstr2 == stringi::stri_reverse(xstr2)){
      return(TRUE)
    }
  }
  return(FALSE)
}
#print(is_both_bases_palindromic(585))  # True


totsum <- 0
for(x in 1:(1e6-1)){
  if(is_both_bases_palindromic(x)){
    totsum <- totsum + x
  }
}

print(totsum)  # 872,187
