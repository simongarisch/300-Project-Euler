/*
A composite number is a positive integer that can be formed by multiplying
two smaller positive integers.
It was proposed by Christian Goldbach that every odd composite number
can be written as the sum of a prime and twice a square.

9 = 7 + 2 * 1^2
15 = 7 + 2 * 2^2
21 = 3 + 2 * 3^2
25 = 7 + 2 * 3^2
27 = 19 + 2 * 2^2
33 = 31 + 2 * 1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as
the sum of a prime and twice a square?
*/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define TRUE 1
#define FALSE 0
#define MAXN 10

int isprime(long n);
int compare_function(const void *x, const void *y);


int main(){

  // collect composite numbers
  long *compos = (long*)calloc((MAXN-1)*(MAXN-1), sizeof(long));
  long compos_index = -1;
  long mult;
  for(long i=2; i<=MAXN; i++){
    for(long j=2; j<=MAXN; j++){
      mult = i * j;
      if(mult % 2 == 1){  // must be odd
        compos_index++;
        compos[compos_index] = i*j;
      }
    }
  }

  // resize so that we exclude zero values, then sort
  compos = (long*)realloc(compos, (compos_index+1)*sizeof(long));
  qsort(compos, compos_index+1, sizeof(long), compare_function);

  // only use unique compos
  long *unique_compos = (long*)calloc(compos_index+1, sizeof(long));
  unique_compos[0] = compos[0];
  long unique_index = 0;
  for(long i=1; i<=compos_index; i++){
    if(compos[i] != compos[i-1]){
      unique_index++;
      unique_compos[unique_index] = compos[i];
    }
  }
  unique_compos = (long*)realloc(unique_compos, (unique_index+1)*sizeof(long));
  for(long i=0; i<=unique_index; i++){
    printf("%ld\n", unique_compos[i]);
  }

  // collect the primes
  long *primes = (long*)calloc(MAXN, sizeof(long));
  long primes_index = -1;
  for(long i=1; i<=MAXN; i++){
    if(isprime(i)){
      primes_index++;
      primes[primes_index] = i;
    }
  }
  primes = (long*)realloc(primes, (primes_index+1)*sizeof(long));

  // and squares
  long num_squares = (long)pow(MAXN, 0.5);
  long *squares = (long*)calloc(num_squares, sizeof(long));
  for(long i=1; i<=MAXN; i++){
    squares[i-1] = pow(MAXN, 2);
  }

  //free(compos);
  //free(unique_compos);
  //free(primes);
  //free(squares);
  return 0;
}


int compare_function(const void *x, const void *y){
  return *(long*)x - *(long*)y;
}


int isprime(long n){
  // will return true if n is prime, false otherwise
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
