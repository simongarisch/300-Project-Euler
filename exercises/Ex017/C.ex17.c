/*
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
The use of "and" when writing out numbers is in compliance with British usage.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Numbers{
   char str[4];
   char name[10];
};

char* get_number_text(int num, struct Numbers* numbers, int lennumbers);
char* wordlookup(char* c, struct Numbers* numbers, int lennumbers);


int main(){

  struct Numbers numbers[27] = {
    {"1", "One"},
    {"2", "Two"},
    {"3", "Three"},
    {"4", "Four"},
    {"5", "Five"},
    {"6", "Six"},
    {"7", "Seven"},
    {"8", "Eight"},
    {"9", "Nine"},
    {"10", "Ten"},
    {"11", "Eleven"},
    {"12", "Twelve"},
    {"13", "Thirteen"},
    {"14", "Fourteen"},
    {"15", "Fifteen"},
    {"16", "Sixteen"},
    {"17", "Seventeen"},
    {"18", "Eighteen"},
    {"19", "Nineteen"},
    {"20", "Twenty"},
    {"30", "Thirty"},
    {"40", "Forty"},
    {"50", "Fifty"},
    {"60", "Sixty"},
    {"70", "Seventy"},
    {"80", "Eighty"},
    {"90", "Ninety"}
  };
  /*
  printf("Number of elements: %d\n", sizeof(numbers)/sizeof(numbers[0]));
  for(int i=0; i<sizeof(numbers)/sizeof(numbers[0]); i++){
    printf("%s\n", numbers[i].str);
    printf("%s\n", numbers[i].name);
  }
  */

  int lennumbers = sizeof(numbers)/sizeof(numbers[0]);
  //printf("%s\n", wordlookup("1", numbers, lennumbers));
  printf("%s\n", get_number_text(1000, numbers, lennumbers));
  /*
  long num_chars = 0;
  for(int num=1; num<=1000; num++){
    char* txt = get_number_text(num, numbers, lennumbers);
    num_chars = num_chars + strlen(txt);
  }

  printf("%ld\n", num_chars);
  */
  return 0;
}


char* wordlookup(char* c, struct Numbers* numbers, int lennumbers){
  // lookup a particular character from our numbers array of structs
  char* result = NULL;
  for(int i=0; i<lennumbers; i++){
    if(!strcmp(c, numbers[i].str)){
      result = numbers[i].name;
      break;
    }
  }
  return result;
}


char* get_number_text(int num, struct Numbers* numbers, int lennumbers){
  char numstr[5];
  sprintf(numstr, "%d", num);
  char* txt = "";

  printf("%s\n", numstr);
  printf("%d\n", strlen(numstr));
  if(strlen(numstr) == 4){  // get the thousands
    txt = wordlookup((char *)&numstr[0], numbers, lennumbers);
    printf("%s\n", txt);
    strcat(txt, "Thousand");
    strncpy(numstr, numstr+1, 3);
    if(!strcmp(numstr, "000")){
      return txt;
    }
  }

  return txt;
}
