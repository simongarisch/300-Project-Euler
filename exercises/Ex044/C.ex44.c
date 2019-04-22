/*
Pentagonal numbers are generated by the formula, P(n) = n(3n-1)/2
The first ten pentagonal numbers are:
1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

It can be seen that P4 + P7 = 22 + 70 = 92 = P8.
However, their difference, 70 - 22 = 48, is not pentagonal.

Find the pair of pentagonal numbers, Pj and Pk, for which their
sum and difference are pentagonal and D = abs(Pk - Pj) is minimised
what is the value of D?
*/

#include <stdio.h>
#include <stdlib.h>

#define TRUE 1
#define FALSE 0
#define LIMIT 3000

long pentagonal_number(long n);
int array_contains(long *arr, long val, long arraylen);


int main(){
  long *pentagonal_numbers = (long*)calloc(LIMIT, sizeof(long));
  for(long i=1; i<=LIMIT; i++){
    pentagonal_numbers[i-1] = pentagonal_number(i);
    if(i<=10){
      //printf("%ld\n", pentagonal_numbers[i-1]);
    }
  }

  long D = 0;
  long penta, p;
  for(long i=0; i<=LIMIT; i++){
    penta = pentagonal_numbers[i];
    for(long j=0; j<i; j++){
      p = pentagonal_numbers[j];
      if(array_contains(pentagonal_numbers, penta-p, LIMIT)){
        if(array_contains(pentagonal_numbers, penta-2*p, LIMIT)){
          D = penta - 2*p;
          break;
        }
      }
    }
  }

  printf("%ld\n", D);  // 5,482,660
  return 0;
}


long pentagonal_number(long n){
  return n*(3*n-1)/2;
}


int array_contains(long *arr, long val, long arraylen){
  for(long i=0; i<arraylen; i++){
    if(arr[i] == val){
      return TRUE;
    }
  }
  return FALSE;
}
