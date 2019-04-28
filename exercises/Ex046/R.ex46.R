
# A composite number is a positive integer that can be formed by multiplying
# two smaller positive integers.
# It was proposed by Christian Goldbach that every odd composite number
# can be written as the sum of a prime and twice a square.
#
# 9 = 7 + 2 * 1^2
# 15 = 7 + 2 * 2^2
# 21 = 3 + 2 * 3^2
# 25 = 7 + 2 * 3^2
# 27 = 19 + 2 * 2^2
# 33 = 31 + 2 * 1^2
#
# It turns out that the conjecture was false.
#
# What is the smallest odd composite that cannot be written as
# the sum of a prime and twice a square?
library("pracma")

MAXN <- 1e4


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


# collet odd composite numbers
rng <- 2:MAXN
mesh <- pracma::meshgrid(rng)
mult <- array(mesh$X * mesh$Y)
values <- sort(unique(mult))
compos <- values[lapply(values, "%%", 2) != 0]

# collect the primes and squares
rng <- 1:MAXN
primes <- rng[sapply(rng, isprime)]
squares <- sapply(rng, function(x) x^2)

# find the smallest composite number
# that cannot be written as the sum of a prime and twice a square
mesh <- pracma::meshgrid(primes, 2*squares)
search_arr <- sort(unique(array(mesh$X + mesh$Y)))

smallest <- 0
for(n in compos){
  equalsn <- sum(search_arr == n)
  equalsn <- sum(sapply(search_arr, function(x) x==n))
  if(!equalsn){
    smallest <- n
    break
  }
}

print(smallest)
