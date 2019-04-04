/*
An irrational decimal fraction is created by concatenating the positive integers:

0.12345678910 1 112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.
d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000
*/

#include <stdio.h>
#include <string.h>

#define TRUE 1
#define FALSE 0
#define MAXCHAR 10


int main(){
  long num = 0;
  long digit_counter = 0;
  long mult = 1;
  long result = 1;

  int found;
  int digit;
  char numstr[MAXCHAR];

  while(mult <= 1e6){
    found = FALSE;
    while(!found){
      num++;
      sprintf(numstr, "%ld", num);
      for(int i=0; i<strlen(numstr); i++){
        digit = numstr[i] - '0';
        digit_counter++;
        if(mult == digit_counter){
          result = result * digit;
          found = TRUE;
        }
      }
    }
    mult = mult * 10;
  }

  printf("%ld\n", result);  // 210
  return 0;
}
