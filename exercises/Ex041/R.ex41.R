
# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?
library(matlab)
library(gtools)
library(stringr)
library(stringi)

DIGITS <- "123456789"

#print(matlab::isprime(7))
#v = base::strsplit(DIGITS, "")[[1]]
#print(gtools::permutations(n=3,r=3,v=v,repeats.allowed=F))

n <- nchar(DIGITS)
largest <- 0

while(n>=1 & largest==0){
  digits <- stringr::str_sub(DIGITS,start=1,end=n)
  digits <- base::strsplit(digits, "")[[1]]
  perms <- gtools::permutations(n=n, r=n, v=digits, repeats.allowed=F)
  print(digits)
  print(length(perms))
  print(n)
  print("***")
  for(perm in perms){
    #print(perm)
    val <- stringi::stri_paste(perm, collapse="")
    #print(val)
    val <- as.numeric(val)
    if(matlab::isprime(val)){
      largest <- val
      break
    }
  }
  n <- n - 1
}

print(largest)  #
