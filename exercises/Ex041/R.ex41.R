
# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?
library(matlab)
library(gtools)

DIGITS <- "123456789"

print(matlab::isprime(7))
v = base::strsplit(DIGITS, "")[[1]]
print(gtools::permutations(n=3,r=3,v=v,repeats.allowed=F))
