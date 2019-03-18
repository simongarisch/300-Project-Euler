/*
The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
*/

#include <iostream>
#include <cstring>

#define MAXCHAR 50

using namespace std;

void tobin(long x, char *b);
void str2rev(char *source, char *target);
bool is_both_bases_palindromic(long x);


int main(){
  long totsum = 0;
  for(long x=1; x<1e6; x++){
    if(is_both_bases_palindromic(x)){
      totsum = totsum + x;
    }
  }

  cout << totsum << endl;  // 872,187
  return 0;
}


void tobin(long x, char *b){
  int rem, counter=0;
  while(x > 0){
    rem = x % 2;
    b[counter] = rem + '0';
    x = (x - rem) / 2;
    counter++;
  }
  b[counter] = '\0';
}


bool is_both_bases_palindromic(long x){
  // returns true if x is palindromic in base 10 and base 2, false otherwise.
  char xstr10[MAXCHAR], xstr2[MAXCHAR];
  char xstr10rev[MAXCHAR], xstr2rev[MAXCHAR];
  sprintf(xstr10, "%ld", x);
  str2rev(xstr10, xstr10rev);
  if(strcmp(xstr10, xstr10rev) == 0){
    tobin(x, xstr2);
    str2rev(xstr2, xstr2rev);
    if(strcmp(xstr2, xstr2rev) == 0){
      return true;
    }
  }
  return false;
}


void str2rev(char *source, char *target){
  // reverse a source string and place the result in target
  int len = strlen(source);
  int n = 0;
  while(n <= len){
    target[n] = source[len-n-1];
    n++;
  }
  target[n] = '\0';
}
