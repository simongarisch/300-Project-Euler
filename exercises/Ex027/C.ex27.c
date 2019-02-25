#include <stdio.h>

#define TRUE 1
#define FALSE 0


int is_prime(long x);
long quadratic_formula(long n, long a, long b);


int main(){
  long maxprimes = 0;
  long product = 0;
  long n, qfresult;
  int isprime;

  for(long a=-999; a<=999; a++){
    for(long b=-1000; b<=1000; b++){
      n = 0;
      isprime = TRUE;
      while(isprime){
        qfresult = quadratic_formula(n, a, b);
        isprime = is_prime(qfresult);
        if(isprime){
          n++;
          if(n > maxprimes){
            maxprimes = n;
            product = a * b;
          }
        }
      }
    }
  }

  printf("%d\n", product);  // -59,231
  return 0;
}


int is_prime(long x){
  // returns TRUE if x is prime, FALSE otherwise
  if(x <= 1){
    return FALSE;
  }
  if(x == 2){
    return TRUE;
  }
  for(long i=3; i<x; i++){
    if(x % i == 0){
      return FALSE;
    }
  }
  return TRUE;
}


long quadratic_formula(long n, long a, long b){
  // returns the result of n^2 + a*n + b
  return n*n + a*n + b;
}
