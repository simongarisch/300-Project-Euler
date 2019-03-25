/*
Take the number 192 and multiply it by each of 1, 2, and 3:

192 * 1 = 192
192 * 2 = 384
192 * 3 = 576
By concatenating each product we get the 1 to 9 pandigital, 192384576.
We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5,
giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
concatenated product of an integer with (1,2, ... , n) where n > 1?
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TRUE 1
#define FALSE 0
#define MAXCHAR 20

unsigned long long int pandigital(int x, int n);

int main(){
  pandigital(192, 3);  // 192384576
  return 0;
}


unsigned long long int pandigital(int x, int n){
  // returns pandigital value if ispandigital
  // 0 otherwise
  char results[MAXCHAR];
  results[0] = '\0';
  char strmult[MAXCHAR];
  int mult;
  for(int i=1; i<=n; i++){
    mult = x * i;
    sprintf(strmult, "%d", mult);
    strcat(results, strmult);
  }
  //printf("%s\n", results);
  char **pend;
  unsigned long long int pnum = strtoull(results, pend, 10);
  return pnum;
}
