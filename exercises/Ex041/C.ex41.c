/*
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
https://www.gnu.org/software/gsl/doc/html/permutation.html
gcc -Wall -I/usr/local/include -c C.ex41.c
gcc -L/usr/local/lib -o C.ex41.exe C.ex41.o -llibgsl -llibgslcblas -lm
*/

#include <stdio.h>
#include <string.h>
#include <math.h>
#include <gsl/gsl_permutation.h>

#define DIGITS "123456789"
#define TRUE 1
#define FALSE 0
#define MAXCHAR 10

int isprime(long n);


int main(){
  int n = strlen(DIGITS);  // we have 9 digits to begin with
  long largest = 0;

  gsl_permutation *p;
  size_t size;  // long unsigned int
  size_t * data;
  size_t i;
  char *eptr;
  char permstr[MAXCHAR];
  long perm;

  while(n>=1 && largest==0){
    p = gsl_permutation_alloc(n);
    gsl_permutation_init(p);

    // given the permutations we can grab digits by position
    do{
      size = gsl_permutation_size(p);
      data = gsl_permutation_data(p);
      for(i=0; i<size; i++){
        permstr[i] = DIGITS[data[i]];
      }
      permstr[i] = '\0';
      perm = strtol(permstr, &eptr, 10);
      //printf("%ld\n", perm);
      if(isprime(perm)){
        largest = perm;
      }
    }while(gsl_permutation_next(p) == GSL_SUCCESS);

    gsl_permutation_free(p);
    n--;
  }

  printf("%ld\n", largest);  // 7,652,413
  return 0;
}


int isprime(long n){
  // will return true if n is prime, false otherwise
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
