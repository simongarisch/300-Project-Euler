/*
2^15= 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?

gcc C.ex16.c -lgmp
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <gmp.h>

void init_bigint(mpz_t* b, int start);
void substring(char origstr[], char substr[], int pos, int length);

int main(){
  // get the number we are after
  mpz_t num;
  init_bigint(&num, 2);
  mpz_pow_ui(num, num, 1000);
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
  printf("%d\n", sum);  // 1,366
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
