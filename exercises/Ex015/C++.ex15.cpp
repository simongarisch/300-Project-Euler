/*
Starting at the top left corner of a 2 x 2 grid, and only being able to move
to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20 x 20 grid?

g++ C++.ex15.cpp -lgmp
*/

#include <iostream>
#include <gmp.h>

#define SIZE 20

void factorial(long int n, mpz_t* result);
void init_bigint(mpz_t* b);

using namespace std;

int main(){
  long int size = SIZE;

  mpz_t factn, factk, result;
  init_bigint(&factn);
  init_bigint(&factk);
  init_bigint(&result);

  factorial(2*size, &factn);
  factorial(size, &factk);

  mpz_mul(result, factk, factk);
  mpz_cdiv_q(result, factn, result);
  gmp_printf("%Zd\n", result);  // 137,846,528,820

  mpz_clear(factn); // free the space
  mpz_clear(factk);
  mpz_clear(result);
  return 0;
}


void factorial(long int n, mpz_t* result){
  // calculates the factorial of n and stores it in result
  while(n > 1){
    // mpz_mul_si (mpz_t rop, const mpz_t op1, long int op2)
    mpz_mul_si(*result, *result, n);
    n--;
  }
}


void init_bigint(mpz_t* b){
  mpz_init2(*b, 100); // give it 100 bits of space
  mpz_set_ui(*b, 1);  // and initialize it to one
}
