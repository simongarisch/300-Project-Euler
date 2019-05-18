/*
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
*/

#include <stdio.h>
#include <string.h>

#define START 1
#define STOP 10
#define MAXCHAR 20

long powerof(int n);
void slice_str(char *str, char *buffer, int start, int end);


int main(){
  long totsum = 0;
  for(int i=START; i<=STOP; i++){
    totsum = totsum + powerof(i);
  }
  char totstr[MAXCHAR];
  char totstr_slice[MAXCHAR];
  sprintf(totstr, "%ld", totsum);
  int numchar = strlen(totstr);
  slice_str(totstr, totstr_slice, numchar-10, numchar);
  printf("%s\n", totstr);
  return 0;
}


long powerof(int n){
  // fetch the last digits from the result n^n
  long result = n;
  for(int i=2; i<=n; i++){
    result = result * n;
    // only keep the last digits
    result = result % (long)1e12;
  }
  return result;
}


void slice_str(char *str, char *buffer, int start, int end){
  int j = 0;
  for(int i=start; i<=end; i++){
    buffer[j++] = str[i];
  }
  buffer[j] = "\0";
}
