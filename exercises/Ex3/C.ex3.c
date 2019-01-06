/*
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
*/

#include <stdio.h>
#include <math.h>

int is_prime(long int x);
// CHECK THIS MOD
long long int mod(long long int target, long int i);

int main(){
  long int largest = 0;       // the largest prime factor
  long long int target = 22;  // for a target number

  for(long int i=0; i<(long int)pow(target, 0.5); i++){
    if(mod(target, i) == 0){  // it's a factor
      if(is_prime(i)){    // and it's a prime
        printf("%ld\n", i);
        largest = i;
      }
    }
  }

  printf("%ld\n", largest);  // 6,857
  return 0;
}


long long int mod(long long int target, long int i){
  // returns the result of x % y
  long long int div = (long long int) target / i;
  return target - i * div;
}


int is_prime(long int x){
  // will return true if x is prime, false otherwise
  if(x == 2 || x == 3){
    return 1;
  }
  for(long int i=2; i<x; i++){
    if(x % i == 0){
      return 0;
    }
  }
  return 1;
}
