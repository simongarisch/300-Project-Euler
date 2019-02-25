
is_prime <- function(x){
  # will return TRUE if x is a prime number, FALSE otherwise
  if(x <= 1){
    return(FALSE)
  }
  if(x == 2){
    return(TRUE)
  }
  for(i in 3:x-1){
    if(x %% i == 0){
      return(FALSE)
    }
  }
  return(TRUE)
}


quadratic_formula <- function(n, a, b){
  # returns the result of n^2 + a*n + b
  return(n**2 + a*n + b)
}


# where |a| < 1000 and |b| leq 1000
asearch_range <- -999:999
bsearch_range <- -1000:1000
#print(len(asearch_range), len(bsearch_range))  # 1999, 2001

maxprimes <- 0
product <- 0

for(a in asearch_range){
  for(b in bsearch_range){
    n <- 0
    isprime <- TRUE
    while(isprime){
        qfresult <- quadratic_formula(n, a, b)
        isprime <- is_prime(qfresult)

        if(isprime){
          n <- n + 1
          if(n > maxprimes){
            maxprimes <- n
            product <- a * b
          }
        }
    }
  }
}

print(product)  # -59,231
