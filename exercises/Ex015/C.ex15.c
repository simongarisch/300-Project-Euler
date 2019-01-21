/*
Starting at the top left corner of a 2 x 2 grid, and only being able to move
to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20 x 20 grid?
*/

#include <stdio.h>
#include <gmp.h>

#define SIZE 20

mpz_t* factorial(int n);

int main(){
  long int size = SIZE;
  gmp_printf("factorial(SIZE) is an mpz %Zd\n", factorial(size));
  return 0;
}


mpz_t* factorial(long int n){
  mpz_t result;           // create a big int
  mpz_init2(result, 100); // give it 100 bits of space
  mpz_set_ui(result, 1);  // and initialize it to one

  while(n > 1){
    // mpz_mul_si (mpz_t rop, const mpz_t op1, long int op2)
    mpz_mul_si(result, result, n)
    n--;
  }
}

/*
BigInt* binom(BigInt* n, BigInt* k){
  BigInt* factn = factorial(n);
  BigInt* factk = factorial(k);
  BigInt* factorialnk = factorial(n-k);
  return factorial(n) / (factorial(k) * factorial(n-k));
}
*/
