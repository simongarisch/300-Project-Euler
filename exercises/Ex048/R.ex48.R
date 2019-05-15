
# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
#
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

# https://cran.r-project.org/web/packages/gmp/index.html
library(gmp)
library(stringr)
options(scipen = 999) # avoid scientific notation for this problem

START <- 1
STOP <- 10

current_value <- START
series_sum <- gmp::as.bigz(START)

while(current_value < STOP){
  current_value <- current_value + 1;
  series_sum <- gmp::as.bigz(series_sum + gmp::pow.bigz(current_value, current_value))
}

print(series_sum)
last_ten_digits <- stringr::str_sub(as.character(series_sum), start=-10)
print(last_ten_digits)
