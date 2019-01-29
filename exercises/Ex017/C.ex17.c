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

char* get_number_text(char* txt, int num, const struct Numbers* numbers, int lennumbers);
void wordlookup(char* result, char* c, const struct Numbers* numbers, int lennumbers);
void get_first_char(char* dest, char* str);
void get_second_char(char* dest, char* str);


int main(){

  const struct Numbers numbers[27] = {
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

  //printf("Number of elements: %d\n", sizeof(numbers)/sizeof(numbers[0]));
  int lennumbers = sizeof(numbers)/sizeof(numbers[0]);
  //printf("%s\n", get_number_text(1000, numbers, lennumbers));

  long num_chars = 0;
  char txt[30];
  char* ptrtxt = txt;
  for(int num=1; num<=1000; num++){
    strcpy(txt, "");
    get_number_text(ptrtxt, num, numbers, lennumbers);
    //printf("%d: %s\n", num, txt);
    num_chars += strlen(txt);
  }

  printf("%ld\n", num_chars);  // 21,124
  return 0;
}


void wordlookup(char* result, char* c, const struct Numbers* numbers, int lennumbers){
  // lookup a particular character from our numbers array of structs
  for(int i=0; i<lennumbers; i++){
    if(!strcmp(c, numbers[i].str)){
      strcpy(result, numbers[i].name);
      break;
    }
  }
}


void get_first_char(char* dest, char* str){
  strncpy(dest, str, 1);
  dest[1] = '\0';
}


void get_second_char(char* dest, char* str){
  strncpy(dest, str+1, 2);
  dest[1] = '\0';
}


char* get_number_text(char* txt, int num, const struct Numbers* numbers, int lennumbers){
  char numstr[5];
  char substr[5];
  char lookup_result[20];
  char* ptrnumstr = numstr;
  sprintf(numstr, "%d", num);

  if(strlen(ptrnumstr) == 4){  // get the thousands
    get_first_char(substr, ptrnumstr);
    wordlookup(lookup_result, substr, numbers, lennumbers);
    strcpy(txt, lookup_result);
    strcat(txt, "Thousand");
    ptrnumstr++;  // now cut the first char from numstr
    if(!strcmp(ptrnumstr, "000")){
      return txt;
    }
  }

  if(strlen(ptrnumstr) == 3){  // the hundreds
    get_first_char(substr, ptrnumstr);
    wordlookup(lookup_result, substr, numbers, lennumbers);
    strcat(txt, lookup_result);
    strcat(txt, "Hundred");
    ptrnumstr++;
    if(!strcmp(ptrnumstr, "00")){
      return txt;
    }
  }

  if(strlen(txt) > 0){
    strcat(txt, "And");
  }

  if(strlen(ptrnumstr) == 2){
    get_first_char(substr, ptrnumstr);
    int first_digit = atoi(substr);
    get_second_char(substr, ptrnumstr);
    int second_digit = atoi(substr);

    if(first_digit == 0){
      ptrnumstr++;
    }else if(first_digit > 1){
      sprintf(substr, "%d", first_digit * 10);
      wordlookup(lookup_result, substr, numbers, lennumbers);
      strcat(txt, lookup_result);
      ptrnumstr++;
    }else{
      wordlookup(lookup_result, ptrnumstr, numbers, lennumbers);
      strcat(txt, lookup_result);
      strcpy(ptrnumstr, "");
    }
    if(second_digit == 0){
      strcpy(ptrnumstr, "");
    }
  }

  if(strlen(ptrnumstr) == 1){
    wordlookup(lookup_result, ptrnumstr, numbers, lennumbers);
    strcat(txt, lookup_result);
  }

  return txt;
}
