/*
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
*/

#include <stdio.h>

int isprime(long n);

#define DIGITS "123456789"
#define TRUE 1
#define FALSE 0

int main(){

  return 0;
}


int isprime(long n){
  // will return true if x is prime, false otherwise
  if(n < 2){
    return FALSE;
  }
  if(n == 2){
    return TRUE;
  }
  for(long i=2; i<=pow(n, 0.5); i++){
    if(n % i == 0){
      return FALSE;
    }
  }
  return TRUE;
}
