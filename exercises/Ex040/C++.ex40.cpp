/*
An irrational decimal fraction is created by concatenating the positive integers:

0.12345678910 1 112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.
d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000
*/

#include <iostream>
#include <cstring>

#define MAXCHAR 10

using namespace std;


int main(){
  long num = 0;
  long digit_counter = 0;
  long mult = 1;
  long result = 1;

  bool found;
  int digit;
  char numstr[MAXCHAR];

  while(mult <= 1e6){
    found = false;
    while(!found){
      num++;
      sprintf(numstr, "%ld", num);
      for(int i=0; i<strlen(numstr); i++){
        digit = numstr[i] - '0';
        digit_counter++;
        if(mult == digit_counter){
          result = result * digit;
          found = true;
        }
      }
    }
    mult = mult * 10;
  }

  cout << result << endl;  // 210
  return 0;
}
