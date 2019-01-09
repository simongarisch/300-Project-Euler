/*
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
*/

#include <stdio.h>
#include <math.h>

#define TRUE 1
#define FALSE 0

int is_prime(long x);


int main(){
  long long int sum = 0;
  for(long i=1; i<2000000; i++){
    if(is_prime(i)){
      sum += i;
    }
  }
  printf("%lld\n", sum);  // 142,913,828,922
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
  for(long i=2; i<(pow(x,0.5)+1); i++){
    if(x % i == 0){
      return FALSE;
    }
  }
  return TRUE;
}
