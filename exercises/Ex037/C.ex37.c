/*
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#define TRUE 1
#define FALSE 0
#define MAXCHAR 20
#define STOP 11

int isprime(long n);
int istruncatable(long n);
void slice_str(char *source, char *dest, int start, int end);


int main(){
  //printf("%d\n", istruncatable(3797));  // 1
  int found = 0;
  long totsum = 0;
  long n = 8;

  while(found < STOP){
    if(isprime(n)){
      if(istruncatable(n)){
        found++;
        totsum = totsum + n;
      }
    }
    n++;
  }

  printf("%ld\n", totsum);  // 748,317
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


int istruncatable(long n){
  // returns true for primes that are both truncatable
  // from left to right and right to left.
  char nstr[MAXCHAR];
  sprintf(nstr, "%ld", n);
  int nlen = strlen(nstr);
  char left[MAXCHAR], right[MAXCHAR];
  for(int i=1; i<=nlen; i++){
    slice_str(nstr, left, 0, i-1);
    slice_str(nstr, right, i, nlen);
    //printf("%s, %s\n", left, right);

    if(strlen(left) > 0){
      if(!isprime(atol(left))){
        return FALSE;
      }
    }
    if(strlen(right) > 0){
      if(!isprime(atol(right))){
        return FALSE;
      }
    }
  }
  return TRUE;
}


void slice_str(char *source, char *dest, int start, int end){
  int j = 0;
  for(int i=start; i<=end; i++){
    dest[j++] = source[i];
  }
  dest[j] = '\0';
}
