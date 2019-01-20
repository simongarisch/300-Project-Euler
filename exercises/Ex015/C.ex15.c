/*
Starting at the top left corner of a 2 x 2 grid, and only being able to move
to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20 x 20 grid?
*/

#include <stdio.h>
#include "BigInt/BigInt.h"

#define SIZE 20
#define ONE BigInt_construct(1);

BigInt* factorial(int n);
BigInt* binom(BigInt* n, BigInt* k);


int main(){
  BigInt* size = BigInt_construct(SIZE)
  BigInt* choices = binom(BigInt_multiply_int(size, 2), size);
  BigInt_print(choices);  // 137,846,528,820

  BigInt_free(size);
  BigInt_free(choices);
  return 0;
}


BigInt* factorial(BigInt* n){
  if(BigInt_to_int(n)==0){
    return ONE;
  }else{
    return BigInt_multiply(n, factorial(BigInt_subtract(n, ONE)));
  }
}


BigInt* binom(BigInt* n, BigInt* k){
  BigInt* factn = factorial(n);
  BigInt* factk = factorial(k);
  BigInt* factorialnk = factorial(n-k);
  return factorial(n) / (factorial(k) * factorial(n-k));
}
