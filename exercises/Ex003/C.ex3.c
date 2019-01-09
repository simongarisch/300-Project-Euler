/*
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
*/

#include <stdio.h>
#include <math.h>

int is_prime(long long int x);

int main(){
  long long int largest = 0;            // the largest prime factor
  long long int target = 600851475143;  // for a target number

  for(long long int i=2; i<(long long int)pow(target, 0.5); i++){
    if(target % i == 0){  // it's a factor
      if(is_prime(i)){        // and it's a prime
        largest = i;
      }
    }
  }

  printf("%lld\n", largest);  // 6,857
  return 0;
}


int is_prime(long long int x){
  // will return true if x is prime, false otherwise
  if(x == 2 || x == 3){
    return 1;
  }
  for(long long int i=2; i<x; i++){
    if(x % i == 0){
      return 0;
    }
  }
  return 1;
}
