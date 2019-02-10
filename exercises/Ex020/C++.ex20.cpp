/*
n! means n * (n - 1) * ... * 3 * 2 * 1

For example, 10! = 10 * 9 * ... * 3 * 2 * 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
g++ C++.ex20.cpp -lgmp
*/

#include <iostream>
#include <string.h>
#include <stdlib.h>
#include <gmp.h>

using namespace std;

void init_bigint(mpz_t* b, int start);
void substring(char origstr[], char substr[], int pos, int length);

int main(){
  // get the number we are after
  mpz_t num, multiplier;
  init_bigint(&num, 1);
  init_bigint(&multiplier, 1);
  // add one to the multiplier until we reach 100
  while(mpz_cmp_ui(multiplier, 100) != 0){
    mpz_add_ui(multiplier, multiplier, 1);
    mpz_mul(num, num, multiplier);
  }
  //gmp_printf("%Zd\n", num);

  // convert this to a string
  char* numstr;
  mpz_get_str(numstr, 10, num);
  //printf("%s\n", numstr);

  // and get the sum of each digit
  int sum = 0;
  char substr[2];
  for(int i=0; i<strlen(numstr); i++){
    substring(numstr, substr, i, 1);
    sum = sum + atoi(substr);
  }

  mpz_clear(num);
  cout << sum << endl;  // 648
  return 0;
}


void init_bigint(mpz_t* b, int start){
  mpz_init2(*b, 100); // give it 100 bits of space
  mpz_set_ui(*b, start);
}


void substring(char origstr[], char substr[], int pos, int length){
  int count = 0;
  while (count < length) {
    substr[count] = origstr[pos+count];
    count++;
  }
  substr[count] = '\0';
}
