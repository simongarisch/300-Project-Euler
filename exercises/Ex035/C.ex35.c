/*
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?

For debugging: https://cets.seas.upenn.edu/answers/gcc.html
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#define TRUE 1
#define FALSE 0
#define MAXCHAR 20
#define TESTNUM 197

int is_prime(long x);
struct Rotations digit_rotations(long x);
int all_primes(struct Rotations rota);
int is_circular_prime(long x);
void slice_str(char *source, char *dest, int start, int end);


struct Rotations {
   long *rotationsarr;
   long counter;
};


int main(){
  /*
  printf("%d\n", is_prime(7));  // 1
  struct Rotations rota = digit_rotations(TESTNUM);
  for(long i=0; i<rota.counter; i++){
    printf("%ld\n", rota.rotationsarr[i]);  // 971, 719, 197
  }
  free(rota.rotationsarr);
  rota.rotationsarr = NULL;
  */

  long counter = 0;
  for(long x=1; x<1e6; x++){
    if(is_prime(x)){
      printf("%d is prime\n", x);
      if(is_circular_prime(x)){
        printf("---%d is circular prime\n", x);
        counter++;
      }
    }
  }

  printf("%ld\n", counter);
  return 0;
}


int is_prime(long x){
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


struct Rotations digit_rotations(long x){
  // returns an array of results from rotating the digits in x
  char xstr[MAXCHAR];
  sprintf(xstr, "%ld", x);
  int xlen = strlen(xstr);

  long slots = 1;
  struct Rotations rota;
  rota.counter = 0;
  rota.rotationsarr = (long *)malloc(slots * sizeof(long));
  char left[MAXCHAR], right[MAXCHAR], rotation[MAXCHAR];
  for(int i=1; i<=xlen; i++){
    slice_str(xstr, left, 0, i-1);
    slice_str(xstr, right, i, xlen);
    strcpy(rotation, right);
    strcat(rotation, left);

    rota.counter++;
    if(rota.counter > slots){
      rota.rotationsarr = (long *)realloc(rota.rotationsarr, rota.counter);
    }
    rota.rotationsarr[rota.counter-1] = atol(rotation);
  }
  return rota;
}


int all_primes(struct Rotations rota){
  // returns TRUE if all of the numbers in rota are prime, FALSE otherwise
  for(long i=0; i<rota.counter; i++){
    if(!is_prime(rota.rotationsarr[i])){
      return(FALSE);
    }
  }
  return(TRUE);
}


int is_circular_prime(long x){
  // returns TRUE if x is a circular prime, FALSE otherwise
  struct Rotations rota = digit_rotations(x);
  int is_all_primes = all_primes(rota);
  free(rota.rotationsarr);
  rota.rotationsarr = NULL;
  return(is_all_primes);
}


void slice_str(char *source, char *dest, int start, int end){
  int j = 0;
  for(int i=start; i<=end; i++){
    dest[j++] = source[i];
  }
  dest[j] = '\0';
}
