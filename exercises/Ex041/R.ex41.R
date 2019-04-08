
# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?
library(gtools)
library(stringr)
library(stringi)

DIGITS <- "123456789"

#print(matlab::isprime(7))
#v = base::strsplit(DIGITS, "")[[1]]
#print(gtools::permutations(n=3,r=3,v=v,repeats.allowed=F))

n <- nchar(DIGITS)
largest <- 0


isprime <- function(x){
  if(x < 2){
    return(FALSE)
  }
  if(x == 2){
    return(TRUE)
  }
  for(i in 2:as.integer(x ^ 0.5 + 1)){
    if(x %% i == 0){
      return(FALSE)
    }
  }
  return(TRUE)
}


while(n>=1 & largest==0){
  digits <- stringr::str_sub(DIGITS,start=1,end=n)
  digits <- base::strsplit(digits, "")[[1]]
  perms <- gtools::permutations(n=n, r=n, v=digits, repeats.allowed=F)
  for(row in nrow(perms):1){
    perm <- perms[row,]
    val <- stringi::stri_paste(perm, collapse="")
    val <- as.numeric(val)
    if(isprime(val)){
      largest <- val
      break
    }
  }
  n <- n - 1
}

print(largest)  # 7,652,413
