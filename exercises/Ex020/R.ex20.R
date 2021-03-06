
# n! means n * (n - 1) * ... * 3 * 2 * 1
#
# For example, 10! = 10 * 9 * ... * 3 * 2 * 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!

# use the gmp package
# https://cran.r-project.org/web/packages/gmp/index.html
library(gmp)

factresult <- as.bigz(1)
for(i in 1:100){
  factresult <- factresult * i
}
factresult_str <- as.character(factresult)

sumchars <- 0
for (numstr in strsplit(factresult_str, "")[[1]]) {
  sumchars <- sumchars + as.numeric(numstr)
}

# need to check gmp num
print(sumchars)  # 648
