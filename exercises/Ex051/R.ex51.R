
# By replacing the 1st digit of the 2-digit number *3,
# it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83,
# are all prime.
#
# By replacing the 3rd and 4th digits of 56**3 with the same digit,
# this 5-digit number is the first example having seven primes among the ten
# generated numbers, yielding the family:
# 56003, 56113, 56333, 56443, 56663, 56773, and 56993.
# Consequently 56003, being the first member of this family,
# is the smallest prime with this property.
#
# Find the smallest prime which, by replacing part of the number
# (not necessarily adjacent digits) with the same digit,
# is part of an eight prime value family.
library("arrangements")

START = 1
STOP = 1e6
TARGET_PRIMES = 8
DIGITS = "0123456789"


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


collect_primes <- function(start, stop){
  primes <- c()
  for(i in start:stop){
    if(isprime(i)){
      primes <- c(primes, i)
    }
  }
  return(primes)
}
#print(collect_primes(0, 20))  # [1]  2  3  5  7 11 13 17 19


collect_digit_replacements <- function(ndigits){
  # we'll have to replace certain digits with a *
  # get combinations of digits we'll need to replace
  combs <- list()
  counter <- 0
  indices <- 1:ndigits
  for(i in indices){
    counter <- counter + 1
    a <- arrangements::combinations(indices, i, replace=FALSE)
    combs[[counter]] <- a
  }
  return(combs)
}
#print(collect_digit_replacements(2))  # list of matrices


filter_ndigit <- function(primes, n){
  primes_filtered <- c()
  primes_strings <- c()
  for(i in 1:length(primes)){
    prime <- primes[i]
    if(nchar(as.character(prime))==n){
      primes_filtered <- c(primes_filtered, prime)
      primes_strings <- c(primes_strings, as.character(prime))
    }
  }

  replacements = collect_digit_replacements(n)
  stars <- c()
}