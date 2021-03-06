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

#include <iostream>
#include <cmath>
#include <cstdlib>

#define MAXN 1e4

using namespace std;

bool isprime(long n);
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
  for(long i=1; i<=num_squares; i++){
    squares[i-1] = pow(i, 2);
  }

  long compo, prime, square;
  long smallest = 0;
  int found;
  for(long ui=0; ui<=unique_index; ui++){
    compo = unique_compos[ui];
    found = false;
    for(long pi=0; pi<=primes_index; pi++){
      prime = primes[pi];
      for(long si=0; si<num_squares; si++){
        square = squares[si];
        if(compo == (prime + 2* square)){
          found = true;
          break;
        }
      }
    }
    if(!found){
      smallest = compo;
      break;
    }
  }

  cout << smallest << endl;  // 5,777

  free(compos);
  free(unique_compos);
  free(primes);
  free(squares);
  return 0;
}


int compare_function(const void *x, const void *y){
  return *(long*)x - *(long*)y;
}


bool isprime(long n){
  // will return true if n is prime, false otherwise
  if(n < 2){
    return false;
  }
  if(n == 2){
    return true;
  }
  for(long i=2; i<=pow(n, 0.5); i++){
    if(n % i == 0){
      return false;
    }
  }
  return true;
}
