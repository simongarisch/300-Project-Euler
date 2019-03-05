/*
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
*/

#include <stdio.h>
#include <string.h>

#define TRUE 1
#define FALSE 0
#define MAXCHAR 20
#define MAX_MULTIPLICAND 10000
#define MAX_MULTIPLER 100

int is_pandigital(long multiplicand, long multiplier, long product);

int cmpfunc(const void *a, const void *b){
  return *(long*)a - *(long*)b;
}

int main(){
  //printf("%d\n", is_pandigital(39, 186, 7254));  // TRUE

  long n = MAX_MULTIPLICAND * MAX_MULTIPLER;
  long product;
  products = (long*)calloc(n, sizeof(long));
  int productscount = 0;

  for(long multiplicand=0; multiplicand<=MAX_MULTIPLICAND; multiplicand++){
    for(long multiplier=0; multiplier<=MAX_MULTIPLER; multiplier++){
      product = multiplicand * multiplier;
      if(is_pandigital(multiplicand, multiplier, product)){
        products[productscount] = product;
        productscount++;
      }
    }
  }

  // sort our products
  

  long productsum = 0;
  //printf("%d\n", sum);  //
  return 0;
}

int is_pandigital(long multiplicand, long multiplier, long product){
  char numstr1[MAXCHAR], numstr2[MAXCHAR], numstr3[MAXCHAR];
  char allnums[MAXCHAR];
  sprintf(numstr1, "%ld", multiplicand);
  sprintf(numstr2, "%ld", multiplier);
  sprintf(numstr3, "%ld", product);

  strcpy(allnums, "");
  strcat(allnums, numstr1);
  strcat(allnums, numstr2);
  strcat(allnums, numstr3);
  //printf("%s\n", allnums);

  char targetstr[] = "123456789";
  int targetlen = strlen(targetstr);
  if(strlen(allnums) != targetlen){
    return FALSE;
  }

  // sort this string
  char temp;
  for(int i=0; i<targetlen-1; i++){
     for(int j=i+1; j<targetlen; j++){
       if(allnums[i] > allnums[j]) {
           temp = allnums[i];
           allnums[i] = allnums[j];
           allnums[j] = temp;
        }
     }
  }
  //printf("%s\n", allnums);

  if(strcmp(targetstr, allnums) == 0){
    return TRUE;
  }else{
    return FALSE;
  }
}
