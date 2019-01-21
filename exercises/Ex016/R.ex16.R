
# 2^15= 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2^1000?

sum <- 0
num <- 2 ^ 1000
options(scipen = 999) # avoid scientific notation for this problem
numstr <- as.character(num)
numstr_split <- strsplit(numstr, "")[[1]]
for(char in numstr_split){
  print(as.numeric(char))
  sum <- sum + as.numeric(char)
}

print(sum)
