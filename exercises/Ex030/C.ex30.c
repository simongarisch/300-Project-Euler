/*
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
*/

#include <stdio.h>
#include <math.h>
#include <string.h>

#define POWER 5
#define MAXCHAR 50

int digit_powers_equal(long num, int power);

int main(){

  long ubound = POWER * pow(9, POWER);
  //printf("%d\n", digit_powers_equal(1634, 4));  // 1

  long total = 0;
  long num = 2;
  while(num <= ubound){
    if(digit_powers_equal(num, POWER)){
      total = total + num;
    }
    num = num + 1;
  }
  printf("%d\n", total);  // 443,839
  return 0;
}


int digit_powers_equal(long num, int power){
  char numstr[MAXCHAR];
  sprintf(numstr,"%ld", num);

  long sum_digit_powers = 0;
  long increment;
  int digit;
  for (int i=0; i<strlen(numstr); i++){
    digit = numstr[i] - '0';
    sum_digit_powers = sum_digit_powers + pow(digit, power);
  }
  return num == sum_digit_powers;
}
