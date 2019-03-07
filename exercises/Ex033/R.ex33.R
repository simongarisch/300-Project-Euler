
# The fraction 49/98 is a curious fraction, as an inexperienced mathematician
# in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction,
# less than one in value, and containing two digits in the numerator and denominator.
#
# If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
library(stringr)

numerators <- c()
denominators <- c()
for(denominator in 10:99){
  # less than one in value, so numerator < denominator
  for(numerator in 10:(denominator-1)){
    # remove non-trivial examples such as 30/50 = 3/5
    if(numerator %% 10 == 0 & denominator %% 10 == 0){
      next
    }
    result <- numerator / denominator
    denstr <- as.character(denominator)
    numstr <- as.character(numerator)
    for(c in strsplit(numstr, "")[[1]]){
      if(str_detect(denstr, c)){
        short_num <- sub(c, "", numstr)
        short_den <- sub(c, "", denstr)
        if(short_den == "0"){
          # dodge the zero division error
          next
        }
        new_result <- as.numeric(short_num) / as.numeric(short_den)
        if(new_result == result){
          numerators <- c(numerators, numerator)
          denominators <- c(denominators, denominator)
          break
        }
      }
    }
  }
}

# we have the four examples
#print(numerators)    # [1] 16 26 19 49
#print(denominators)  # [1] 64 65 95 98
productnum <- prod(numerators)
productden <- prod(denominators)
minimum_product <- min(productnum, productden)
for(divisor in minimum_product:2){
  if(productnum %% divisor == 0){
    if(productden %% divisor == 0){
      productnum <- productnum / divisor
      productden <- productden / divisor
      break
    }
  }
}
print(productden)  # 100
