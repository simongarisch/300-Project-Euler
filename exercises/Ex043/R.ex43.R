
# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.
#
# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:
#
# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17
# Find the sum of all 0 to 9 pandigital numbers with this property.
library(gtools)
library(stringi)

DIGITS = "0123456789"


has_property <- function(n){
  # returns True if n has the properties defined for problem, False otherwise
  n <- as.character(n)
  if(nchar(n) != 10){
    return(FALSE)
  }

  dig <- base::strsplit(n, "")[[1]]  # collect digits
  if(as.integer(paste0(dig[2], dig[3], dig[4])) %% 2 != 0){
    return(FALSE)
  }
  if(as.integer(paste0(dig[3], dig[4], dig[5])) %% 3 != 0){
    return(FALSE)
  }
  if(as.integer(paste0(dig[4], dig[5], dig[6])) %% 5 != 0){
    return(FALSE)
  }
  if(as.integer(paste0(dig[5], dig[6], dig[7])) %% 7 != 0){
    return(FALSE)
  }
  if(as.integer(paste0(dig[6], dig[7], dig[8])) %% 11 != 0){
    return(FALSE)
  }
  if(as.integer(paste0(dig[7], dig[8], dig[9])) %% 13 != 0){
    return(FALSE)
  }
  if(as.integer(paste0(dig[8], dig[9], dig[10])) %% 17 != 0){
    return(FALSE)
  }
  return(TRUE)
}


#print(has_property(1406357289))  # TRUE
sumpan <- 0
digits <- base::strsplit(DIGITS, "")[[1]]
num_digits <- nchar(DIGITS)
perms <- gtools::permutations(n=num_digits, r=num_digits, v=digits,
                              repeats.allowed=F)
for(row in nrow(perms):1){
  perm <- perms[row,]
  n <- stringi::stri_paste(perm, collapse="")
  n <- as.numeric(n)
  if(has_property(n)){
    sumpan = sumpan + n
  }
}

print(sumpan)  # 16,695,334,890
