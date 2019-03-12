/*
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
*/

#include <iostream>
#include <cstdlib>
#include <cstring>
#include <cmath>

#define MAXCHAR 10

using namespace std;

long factorial(int n);
bool is_curious(long x);
int get_max_digits();


int main(){
  //cout << is_curious(145) << endl;  // true
  int digits = get_max_digits();
  long resultcounter = 0;
  long availableslots = 1;
  long *curious_numbers = (long *)malloc(availableslots * sizeof(long));
  for(long x=3; x<pow(10, digits); x++){
    if(is_curious(x)){
      resultcounter++;
      if(resultcounter > availableslots){
        curious_numbers = (long *)realloc(curious_numbers, resultcounter);
      }
      curious_numbers[resultcounter-1] = x;
    }
  }

  long arrsum = 0;
  for(long i=0; i<resultcounter; i++){
    arrsum = arrsum + curious_numbers[i];
  }
  cout << arrsum << endl;  // 40,730

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


bool is_curious(long x){
  long sumfact = 0;
  char xstr[MAXCHAR];
  sprintf(xstr, "%ld", x);
  int digit;
  for(int n=0; n<strlen(xstr); n++){
    digit = xstr[n] - '0';
    sumfact = sumfact + factorial(digit);
  }
  if(x == sumfact){
    return true;
  }else{
    return false;
  }
}


int get_max_digits(){
  int digit = 1;
  while(factorial(9) * digit > pow(digit - 1, 10)){
    digit = digit + 1;
  }
  return digit;
}
