/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
that the 6th prime is 13.
What is the 10,001st prime number?
*/

#include <stdio.h>

#define TRUE 1
#define FALSE 0

int is_prime(long x);


int main(){
  int number=0, counter=0;
  while(counter < 10001){
    number++;
    if(is_prime(number)){
      counter++;
    }
  }

  printf("%ld\n", number);  // 104,743
  return 0;
}


int is_prime(long x){
  // will return true if x is prime, false otherwise
  if(x == 0 || x == 1){
    return FALSE;
  }
  if(x == 2){
    return TRUE;
  }
  for(long i=2; i<x; i++){
    if(x % i == 0){
      return FALSE;
    }
  }
  return TRUE;
}
