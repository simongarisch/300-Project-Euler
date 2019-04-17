/*
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.

g++ -Wall -I/usr/local/include -c C++.ex43.cpp
g++ -L/usr/local/lib -o C++.ex43.exe C++.ex43.o -llibgsl -llibgslcblas -lm
*/

#include <iostream>
#include <cstdlib>
#include <cstring>
#include <gsl/gsl_permutation.h>

#define MAXCHAR 20
#define DIGITS "0123456789"

using namespace std;

bool has_property(long n);
int construct_slice(char *str, int p1, int p2, int p3);


int main(){
  long sumpan = 0;
  int n = strlen(DIGITS);
  gsl_permutation *p;
  p = gsl_permutation_alloc(n);
  gsl_permutation_init(p);

  // given the permutations we can grab digits by position
  size_t size;  // long unsigned int
  size_t *data;
  size_t i;
  char *eptr;
  char permstr[MAXCHAR];
  long perm;

  do{
    size = gsl_permutation_size(p);
    data = gsl_permutation_data(p);
    for(i=0; i<size; i++){
      permstr[i] = DIGITS[data[i]];
    }
    permstr[i] = '\0';
    perm = strtol(permstr, &eptr, 10);
    if(has_property(perm)){
      sumpan = sumpan + perm;
    }
  }while(gsl_permutation_next(p) == GSL_SUCCESS);

  cout << sumpan << endl;  // 16,695,334,890
  return 0;
}


int construct_slice(char *str, int p1, int p2, int p3){
  char sub[MAXCHAR];
  sub[0] = str[p1];
  sub[1] = str[p2];
  sub[2] = str[p3];
  sub[3] = '\0';
  return atoi(sub);
}


bool has_property(long n){
  char str[MAXCHAR];
  sprintf(str, "%ld", n);
  if(strlen(str) != 10){
    return false;
  }

  if(construct_slice(str, 1, 2, 3) % 2 != 0){
    return false;
  }
  if(construct_slice(str, 2, 3, 4) % 3 != 0){
    return false;
  }
  if(construct_slice(str, 3, 4, 5) % 5 != 0){
    return false;
  }
  if(construct_slice(str, 4, 5, 6) % 7 != 0){
    return false;
  }
  if(construct_slice(str, 5, 6, 7) % 11 != 0){
    return false;
  }
  if(construct_slice(str, 6, 7, 8) % 13 != 0){
    return false;
  }
  if(construct_slice(str, 7, 8, 9) % 17 != 0){
    return false;
  }

  return true;
}
