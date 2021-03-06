/*
Consider all integer combinations of a^b for 2 leq a leq 5 and 2 leq b leq 5:

2^2=4, 2^3=8, 2^4=16, 2^5=32
3^2=9, 3^3=27, 3^4=81, 3^5=243
4^2=16, 4^3=64, 4^4=256, 4^5=1024
5^2=25, 5^3=125, 5^4=625, 5^5=3125

If they are then placed in numerical order, with any repeats removed, we get the following sequence of 15 distinct terms:

4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125

How many distinct terms are in the sequence generated by ab for 2 leq a leq 100 and 2 leq b leq 100?
http://www.bruceianhartman.com/common/gdb.html
gcc C.ex29.c -lgmp
*/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>

#define MAXCHARS 250

void init_bigint(mpz_t* b, int start);
int compare_function(const void *x, const void *y);


int main(){
  long from=2, to=100;
  long numloops = pow(to-from+1, 2);
  mpz_t result;
  mpz_init(result);
  mpz_set_ui(result, 0);

  long resultcounter = 0;
  char **results = (char **)malloc(numloops * sizeof(char *));
  for(long a=from; a<=to; a++){
    for(long b=from; b<=to; b++){
      mpz_ui_pow_ui(result, a, b);
      results[resultcounter] = (char *)malloc(sizeof(MAXCHARS));
      results[resultcounter] = mpz_get_str(NULL, 10, result);
      //printf("%s\n", results[resultcounter]);
      resultcounter++;
    }
  }

  // sort the result strings
  qsort(results, resultcounter, sizeof(char *), compare_function);

  // count unique results
  long numunique = 1;
  for(long i=1; i<resultcounter; i++){
    if(strcmp(results[i-1],results[i]) != 0){
      numunique++;
    }
    //printf("%s\n", results[i]);
  }


  for (long i=0; i<resultcounter; i++){
    free(results[i]);
    results[i] = NULL;
  }
  free(results);
  results = NULL;

  printf("%ld\n", numunique);  // 9,183
  return 0;
}


int compare_function(const void *x, const void *y){
  return(strcmp(*((char**)x),*((char**)y)));
}
