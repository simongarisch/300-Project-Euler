/*
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
*/

#include <stdio.h>

int main(){
  long sum = 0;
  long sum_of_squares = 0;

  for(int i=0; i<=100; i++){
    sum = sum + i;
    sum_of_squares = sum_of_squares + i ** 2;
  }

  long square_of_sum = sum ** 2

  printf("%ld\n", square_of_sum - sum_of_squares)  # 25,164,150
  return 0;
}
