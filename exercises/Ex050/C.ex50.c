/*
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define TRUE 1
#define FALSE 0
#define MAXPRIME 1e6


struct Primes {
   long *arr;
   long len;
};


// forward declarations
int isprime(long x);
struct Primes collectPrimes(long maxprime);
long whichPrime();
int primesContains(struct Primes primes, long n);


int main(){
  long prime = whichPrime();
  printf("%ld\n", prime);  // 997,651
  return 0;
}


long whichPrime(){
  // Which prime, below one-million,
  // can be written as the sum of the most consecutive primes?
  struct Primes primes = collectPrimes(MAXPRIME);
  struct Primes cumsum;

  cumsum.len = primes.len + 1;
  cumsum.arr = (long*)calloc(cumsum.len, sizeof(long));
  long total = 0;
  for(int i=0; i<primes.len; i++){
    total = total + primes.arr[i];
    cumsum.arr[i+1] = total;
  }
  //for(int i=0; i<primes.len; i++){
  //  printf("%ld, %ld\n", primes.arr[i], cumsum.arr[i+1]);
  //}

  int found = FALSE;
  long whichPrime = 0;
  long whichLen = primes.len;
  long diff;

  while(!found){
    for(int i=0; i < primes.len - whichLen + 1; i++){
      diff = cumsum.arr[i+whichLen] - cumsum.arr[i];
      if(diff > MAXPRIME){
        break;
      }
      if(primesContains(primes, diff)){
        found = TRUE;
        whichPrime = diff;
        break;
      }
    }
    if(found){
      break;
    }
    whichLen = whichLen - 1;
    if(whichLen <= 0){
      break;
    }
  }

  free(primes.arr);
  free(cumsum.arr);
  return whichPrime;
}


int primesContains(struct Primes primes, long n){
  for(int i=0; i<primes.len; i++){
    if(primes.arr[i] == n){
      return TRUE;
    }
  }
  return FALSE;
}


struct Primes collectPrimes(long maxprime){
  struct Primes primes;
  primes.arr = (long *)malloc(MAXPRIME * sizeof(long));
  primes.len = 0;
  for(long i=1; i<=MAXPRIME; i++){
    if(isprime(i)){
      primes.len++;
      primes.arr[primes.len-1] = i;
    }
  }
  primes.arr = (long*)realloc(primes.arr, (primes.len)*sizeof(long));
  return primes;
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
