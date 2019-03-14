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

int is_prime(long x);
long *digit_rotations(long x);
void slice_str(char *source, char *dest, int start, int end);


int main(){
  //printf("%d\n", is_prime(7));  // 1
  long *rotations = digit_rotations(197);
  long entries = sizeof(rotations) / sizeof(rotations[0]);
  for(long i=0; i<entries; i++){
    printf("%ld\n", rotations[i]);
  }
  free(rotations);

  for(long x=1; x<1e6; x++){
    if(is_prime(x)){
      //if(is_circular_prime(x)){
      //  counter++;
      //}
    }
  }
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


long *digit_rotations(long x){
  // returns an array of results from rotating the digits in x
  char *xstr;
  sprintf(xstr, "%ld", x);
  int xlen = strlen(xstr);
  printf("We are here zZZ!");

  long resultcounter = 0;
  long availableslots = 1;
  long *rotations = (long *)malloc(availableslots * sizeof(long));
  char *left, *right;
  char rotation[MAXCHAR];
  for(int i=1; i<=xlen; i++){
    printf("We are hereXX!");
    slice_str(xstr, left, 0, i-1);
    slice_str(xstr, right, i, xlen);
    strcpy(rotation, right);
    strcat(rotation, left);
    printf("left %s\n", left);
    printf("right %s\n", right);

    resultcounter++;
    if(resultcounter > availableslots){
      rotations = (long *)realloc(rotations, resultcounter);
    }
    rotations[resultcounter-1] = atol(rotation);
  }
  return rotations;
}


void slice_str(char *source, char *dest, int start, int end){
  int j = 0;
  for(int i=start; i<=end; i++){
    dest[j++] = source[i];
  }
  dest[j] = '\0';
}
