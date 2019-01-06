/*
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 * 99.
Find the largest palindrome made from the product of two 3-digit numbers.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int is_palindromic_number(int x){
  // returns true if x is a palindromic number, false otherwise
  char strx[4];
  sprintf(strx, "%d", x);  // convert x to a char string

  int len = strlen(strx);
  char *strxrev = (char*)malloc((len + 1) * sizeof(char));
  strxrev[len] = '\0';
  for(int i = 0; i < len; i++) {
    strxrev[i] = strx[len - 1 - i];
  }

  printf("%s\n", strx);
  printf("%s\n", strxrev)
}

int main(){
  int x = 801;
  printf("%d\n", x);
  is_palindromic_number(x);
  return 0;
}
