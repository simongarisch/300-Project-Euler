/*
See the GMP lib manual: https://gmplib.org/manual/
There is also this guide: http://www.theijes.com/papers/vol6-issue2/B0602010611.pdf

To compile: gcc gmplib_example.c -lgmp
*/

#include <stdio.h>
#include <gmp.h>

int main(){
  printf("Loaded GMP successfully!\n");

  mpz_t b; // declare b as big int

  // variables of big number type must be first initialized and then set a value
  mpz_init2(b, 100); // initialize variable m by 100 bits of space to store it
  mpz_set_ui(b, 50); // set unsigned integer 50 to m
  gmp_printf("b is an mpz %Zd\n", b); // b is an mpz 50

  // https://www.geeksforgeeks.org/data-types-in-c/
  // unsigned long long int, 8 bytes, 0 to 18,446,744,073,709,551,615, %llu
  unsigned long long int x = 18446744073709551615;
  printf("%llu\n", x);      // this works fine
  x = 18446744073709551616; // add one to this number and try again
  // this last assignment for x throws a warning: integer constant too large for its type
  printf("%llu\n", x);      // prints zero

  // try this using gmplib
  // https://gmplib.org/manual/Simultaneous-Integer-Init-_0026-Assign.html#Simultaneous-Integer-Init-_0026-Assign
  mpz_init_set_str(b, "18446744073709551616", 10);
  gmp_printf("b is an mpz %Zd\n", b); // this works well

  // we can apply arithmetic to these
  // https://gmplib.org/manual/Integer-Arithmetic.html#Integer-Arithmetic
  mpz_t a; // create a and set it to one
  mpz_init(a);
  mpz_set_ui(a, 1);

  // create result as a large int
  mpz_t result;
  mpz_init2(result, 100);

  // add the two together
  mpz_add(result, a, b);
  gmp_printf("result is an mpz %Zd\n", result);

  mpz_clear(a); // free the space occupied by a
  mpz_clear(b); // free the space occupied by b
  mpz_clear(result);
  return 0;
}
