/*
The fraction 49/98 is a curious fraction, as an inexperienced mathematician
in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction,
less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TRUE 1
#define FALSE 0
#define MAXCHAR 10
#define MIN(a,b) (((a)<(b))?(a):(b))

void rem_first_occurrence_char(char *s, char chr);


int main(){
  int availableslots = 1;
  int resultcounter = 0;
  int *numerators = (int *)malloc(availableslots * sizeof(int));
  int *denominators = (int *)malloc(availableslots * sizeof(int));;

  float result, new_result;
  char numstr[MAXCHAR], denstr[MAXCHAR];
  char numshort[MAXCHAR], denshort[MAXCHAR];
  char c, temp, *cp;

  for(int denominator=10; denominator<100; denominator++){
    // less than one in value, so numerator < denominator
    for(int numerator=10; numerator<denominator; numerator++){
      // remove non-trivial examples such as 30/50 = 3/5
      if((numerator % 10 == 0) & (denominator % 10 == 0)){
        continue;
      }
      result = (float)numerator / (float)denominator;
      sprintf(numstr, "%d", numerator);
      sprintf(denstr, "%d", denominator);
      for(int x=0; x<strlen(numstr); x++){
        c = numstr[x];
        cp = strchr(denstr, c);
        if(cp != NULL){ // char c found in denstr
          strcpy(numshort, numstr);
          strcpy(denshort, denstr);
          // length of numstr and denstr will be two chars
          if(x == 0){
            numshort[0] = numshort[1];
            numshort[1] = '\0';
          }else{
            numshort[1] = '\0';
          }
          rem_first_occurrence_char(denshort, c);
          //printf("%s->%s ... %s->%s\n", numstr, numshort, denstr, denshort);
          if(denshort[0] == '0'){
            // dodge the zero division error
            continue;
          }
          new_result = atof(numshort) / atof(denshort);
          if(new_result == result){
            //puts("found one!");
            //printf("%s->%s ... %s->%s\n", numstr, numshort, denstr, denshort);
            //printf("%ld, %ld\n", new_result, result);
            //puts("**********");

            // check that we have space to store the new results
            resultcounter++;
            if(resultcounter > availableslots){
              numerators = (int *)realloc(numerators, resultcounter);
              denominators = (int *)realloc(denominators, resultcounter);
            }

            // add these to our numerators and denominators
            numerators[resultcounter-1] = numerator;
            denominators[resultcounter-1] = denominator;
            break;
          }
        }
      }
    }
  }

  // we have the four examples
  for(int i=0; i<resultcounter; i++){
    //printf("%d, %d\n", numerators[i], denominators[i]);
    /* 16, 64
       26, 65
       19, 95
       49, 98 */
  }

  long productnum = 1;
  long productden = 1;
  for(int i=0; i<resultcounter; i++){
    productnum = productnum * numerators[i];
    productden = productden * denominators[i];
  }
  long minproduct = MIN(productnum, productden);
  for(long divisor=minproduct; divisor>1; divisor--){
    if(productnum % divisor == 0){
      if(productden % divisor == 0){
        productden = productden / divisor;
        productnum = productnum / divisor;
        break;
      }
    }
  }

  printf("%d\n", productden);  // 100
  free(numerators);
  free(denominators);
  numerators = NULL;
  denominators = NULL;
  return 0;
}


void rem_first_occurrence_char(char *s, char chr){
  int found = FALSE;
  int j = 0;
  for(int i=0; s[i]!='\0'; i++){
    // keep the character if not equal to chr
    // or if we have already removed one
    if(s[i] != chr || found == TRUE){
      s[j++] = s[i];
    }else{
      found = TRUE;
    }
  }
  s[j] = '\0';
}
