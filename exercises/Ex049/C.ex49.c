/*
The arithmetic sequence, 1487, 4817, 8147,
in which each of the terms increases by 3330, is unusual in two ways:
(i) each of the three terms are prime, and,
(ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define TRUE 1
#define FALSE 0
#define MAXCHAR 100
#define START 1488
#define STOP 1e4
#define INCREMENT 3330

int isprime(long x);
int ispermutation(long a, long b);
long primeperms();
int cmpfunc( const void *a, const void *b) {
  return *(char*)a - *(char*)b;
}


int main(){
  //long a=123, b=321;
  //printf("%d\n", ispermutation(a,b));  // 1
  printf("%ld\n", primeperms());  // 296,962,999,629
  return 0;
}


int ispermutation(long a, long b){
  // returns true (1) if two numbers are permutations of each other,
  // false otherwise
  char astr[MAXCHAR], bstr[MAXCHAR];
  // get these numbers as strings
  sprintf(astr, "%ld", a);
  sprintf(bstr, "%ld", b);
  // and sort them
  qsort(astr, strlen(astr), sizeof(char), cmpfunc);
  qsort(bstr, strlen(bstr), sizeof(char), cmpfunc);
  if(strcmp(astr, bstr) == 0){
    return TRUE;
  }else{
    return FALSE;
  }
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


long primeperms(){
  long *primes = (long*)calloc(STOP, sizeof(long));
  long primescounter = 0;
  for(long i=START; i<=STOP; i++){
    if(isprime(i)){
      primescounter++;
      primes[primescounter-1] = i;
    }
  }
  primes = (long*)realloc(primes, (primescounter)*sizeof(long));

  long prime1, prime2, prime3;
  char resultstr[MAXCHAR];
  for(int idx1=0; idx1<primescounter; idx1++){
    prime1 = primes[idx1];
    for(int idx2=idx1+1; idx2<primescounter; idx2++){
      prime2 = primes[idx2];
      for(int idx3=idx2+1; idx3<primescounter; idx3++){
        prime3 = primes[idx3];
        // check fro a constant increment
        if(prime1 + INCREMENT == prime2){
          if(prime2 + INCREMENT == prime3){
            // and that these are permutations
            if(ispermutation(prime1, prime2)){
              if(ispermutation(prime2, prime3)){
                sprintf(resultstr, "%ld%ld%ld", prime1, prime2, prime3);
                free(primes);
                return atol(resultstr);
              }
            }
          }
        }
      }
    }
  }
}
