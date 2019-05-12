/*
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 * 7
15 = 3 * 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2^2 * 7 * 23
645 = 3 * 5 * 43
646 = 2 * 17 * 19.

Find the first four consecutive integers to have four distinct prime factors each.
What is the first of these numbers?
*/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define TRUE 1
#define FALSE 0
#define TARGET_FACTORS 4
#define MAXPRIME 1e3

int isprime(long x);


int main(){
  // collect our prime numbers
  long numprimes = 0;
  long *primes = (long*)calloc(MAXPRIME, sizeof(long));
  for(long i=0; i<MAXPRIME; i++){
    if(isprime(i)){
      primes[numprimes] = i;
      numprimes++;
    }
  }
  //primes = (long*)realloc(primes, (numprimes)*sizeof(long));
  for(int i=0; i<numprimes; i++){
    printf("%ld\n", primes[i]);
  }

  long factors, prime, sequence = 0;
  long n = 0;
  long *multiples, *factors_array;
  long multiple_found;  // is n within multiples

  while(TRUE){
    n++;
    factors = 0;
    // reset the factors array
    factors_array = (long*)calloc(TARGET_FACTORS, sizeof(long));

    for(long i=0; i<numprimes; i++){
      prime = primes[i];
      printf("%ld, %d, %ld\n", n, i, prime);
      if(n % prime == 0){
        factors_array[factors] = prime;
        factors++;
      }
      if(prime > n){
        break;
      }
    }
    /*

    if(factors == TARGET_FACTORS){
      multiples = (long*)calloc(factors+1, sizeof(long));
      multiples[0] = 1;
      // straight multiplication
      for(int i=0; i<factors; i++){
        multiples[0] = multiples[0] * factors_array[i];
      }
      // and for the ^2
      for(int i=0; i<factors; i++){
        multiples[i+1] = multiples[0] * factors_array[i];
      }

      multiple_found = FALSE;
      for(int i=0; i<factors+1; i++){
        if(n == multiples[i]){
          multiple_found = TRUE;
        }
      }
      free(multiples);
      if(multiple_found){
        sequence++;
      }else{
        sequence = 0;
      }
    }else{
      sequence = 0;
    }
    */
    free(factors_array);
    if(sequence == TARGET_FACTORS){
      break;
    }
  }

  free(primes);
  long first = n - TARGET_FACTORS + 1;
  printf("%ld\n", first);
  return 0;
}


int isprime(long x){
  // will return true if x is prime, false otherwise
  if(x < 2){
    return FALSE;
  }
  if(x == 2){
    return TRUE;
  }
  for(long i=2; i<=pow(x, 0.5); i++){
    if(x % i == 0){
      return FALSE;
    }
  }
  return TRUE;
}
