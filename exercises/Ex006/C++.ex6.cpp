/*
The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385
The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten natural
numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred
natural numbers and the square of the sum.
*/

#include <iostream>
#include <cmath>

int main(){
  long sum = 0;
  long sum_of_squares = 0;

  for(int i=0; i<=100; i++){
    sum = sum + i;
    sum_of_squares = sum_of_squares + pow(i, 2);
  }

  long square_of_sum = pow(sum, 2);

  std::cout << (square_of_sum - sum_of_squares) << std::endl;  // 25,164,150
  return 0;
}
