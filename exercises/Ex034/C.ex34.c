/*
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define TRUE 1
#define FALSE 0
#define MAXCHAR 10

long factorial(int n);
int is_curious(long x);

int main(){
  //printf("%d\n", is_curious(145));  // 1
  int digits = get_max_digits();
  long resultcounter = 0;
  long availableslots = 1;
  long *curious_numbers = (long *)malloc(availableslots * sizeof(long));
  for(long x=3; x<pow(10, digits), x++){
    if(is_curious(x)){
      resultcounter++;
      if(resultcounter > availableslots){
        curious_numbers = (long *)realloc(curious_numbers, resultcounter);
      }
      curious_numbers[resultcounter-1] = x;
    }
  }

  long arrsum = 0; 

  free(curious_numbers);
  return 0;
}


long factorial(int n){
  if(n == 0){
    return 1;
  }else{
    return n * factorial(n-1);
  }
}


int is_curious(long x){
  long sumfact = 0;
  char xstr[MAXCHAR];
  sprintf(xstr, "%ld", x);
  int digit;
  for(int n=0; n<strlen(xstr); n++){
    digit = xstr[n] - '0';
    sumfact = sumfact + factorial(digit);
  }
  if(x == sumfact){
    return TRUE;
  }else{
    return FALSE;
  }
}


int get_max_digits(){
  int digit = 1;
  while(factorial(9) * digit > pow(digit - 1, 10)){
    digit = digit + 1;
  }
  return digit;
}
