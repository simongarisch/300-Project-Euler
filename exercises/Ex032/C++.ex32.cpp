/*
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
*/

#include <iostream>
#include <cstdlib>
#include <cstring>

#define MAXCHAR 20
#define MAX_MULTIPLICAND 10000
#define MAX_MULTIPLER 100

using namespace std;

bool is_pandigital(long multiplicand, long multiplier, long product);

int cmpfunc(const void *a, const void *b){
  return *(long*)a - *(long*)b;
}

int main(){
  long n = MAX_MULTIPLICAND * MAX_MULTIPLER;
  long product;
  long *products = (long*)calloc(n, sizeof(long));
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
  qsort(products, n, sizeof(long), cmpfunc);

  long productsum = products[0];
  for(long i=1; i<n; i++){
    if(products[i] != products[i-1]){
      productsum = productsum + products[i];
    }
  }

  free(products);
  cout << productsum << endl;  // 45,228
  return 0;
}

bool is_pandigital(long multiplicand, long multiplier, long product){
  char numstr1[MAXCHAR], numstr2[MAXCHAR], numstr3[MAXCHAR];
  char allnums[MAXCHAR];
  sprintf(numstr1, "%ld", multiplicand);
  sprintf(numstr2, "%ld", multiplier);
  sprintf(numstr3, "%ld", product);

  strcpy(allnums, "");
  strcat(allnums, numstr1);
  strcat(allnums, numstr2);
  strcat(allnums, numstr3);

  char targetstr[] = "123456789";
  int targetlen = strlen(targetstr);
  if(strlen(allnums) != targetlen){
    return false;
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

  if(strcmp(targetstr, allnums) == 0){
    return true;
  }else{
    return false;
  }
}
