
# Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:
#
# Triangle	 	Tn=n(n+1)/2	 	1, 3, 6, 10, 15, ...
# Pentagonal	 	Pn=n(3n-1)/2	1, 5, 12, 22, 35, ...
# Hexagonal	 	Hn=n(2n-1)	 	1, 6, 15, 28, 45, ...
#
# It can be verified that T285 = P165 = H143 = 40755.
#
# Find the next triangle number that is also pentagonal and hexagonal.

MAXN <- 1e5
FIND_AFTER <- 40755

triangle <- function(n){
  return(n*(n+1)/2)
}

pentagonal <- function(n){
  return(n*(3*n-1)/2)
}

hexagonal <- function(n){
  return(n*(2*n-1))
}

populate <- function(func){
  listn <- c()
  n <- 0
  while(n <= MAXN){
    n = n + 1
    listn <- c(listn, func(n))
  }
  return(listn)
}

tn <- populate(triangle)
pn <- populate(pentagonal)
hn <- populate(hexagonal)

result <- 0
for(h in hn){
  if(h %in% pn){
    if(h %in% tn){
      if(h > FIND_AFTER){
        result <- h;
        break;
      }
    }
  }
}

print(result)  # 1,533,776,805
