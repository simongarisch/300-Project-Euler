/*
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 * 99.
Find the largest palindrome made from the product of two 3-digit numbers.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TRUE 1
#define FALSE 0

int is_palindromic_number(long int x);


int main(){
  long int result, largest = 0;
  // go through pairs of three digit numbers
  // these are all numbers from 100 -> 999
  for(int i=100; i<1000; i++){
    for(int j=100; j<1000; j++){
      result = i * j;
      if(is_palindromic_number(result)){
        if(result > largest){
          largest = result;
        }
      }
    }
  }

  printf("%ld\n", largest);  // 906609
  return 0;
}


int is_palindromic_number(long int x){
  // returns true if x is a palindromic number, false otherwise
  char strx[4];
  sprintf(strx, "%ld", x);  // convert x to a char string

  // create strxrev, a reversal of the strx char string
  int len = strlen(strx);
  char *strxrev = (char*)malloc((len) * sizeof(char));
  strxrev[len] = '\0';
  for(int i = 0; i < len; i++) {
    strxrev[i] = strx[len - 1 - i];
  }

  // check if the number is a palindrome
  int palindrome = strcmp(strx, strxrev) == 0;
  free(strxrev);

  if(palindrome){
    return TRUE;
  }else{
    return FALSE;
  }
}
