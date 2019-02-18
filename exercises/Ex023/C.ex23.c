/*
A perfect number is a number for which the sum of its proper divisors is
exactly equal to the number.
For example, the sum of the proper divisors of 28 would be
1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n
and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
the smallest number that can be written as the sum of two abundant numbers is 24.
By mathematical analysis, it can be shown that all integers greater than 28123
can be written as the sum of two abundant numbers. However, this upper limit cannot
be reduced any further by analysis even though it is known that the greatest number
that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
*/
#include <stdlib.h>
#include <stdio.h>

#define LIMIT 28123
#define TRUE 1
#define FALSE 0

long get_sum_proper_divisors(long x);
void get_combinations(long *combinations, long *abundant_numbers, long counter);
int incombinations(long *combinations, long counter, long x);

int compare_function(const void *px, const void *py){
  long x = *((long*)px);
  long y = *((long*)py);
  return x - y;
}


int main(void){
  //printf("%ld\n", get_sum_proper_divisors(12));  // 16
  long *abundant_numbers = (long*)calloc(LIMIT, sizeof(long));
  long counter = 0;
  for(long x=1; x<=LIMIT; x++){
    if(get_sum_proper_divisors(x) > x){
      abundant_numbers[counter] = x;
      counter++;
    }
  }
  //printf("%ld\n", counter);  // 6,965

  // create an array of combinations and fill it
  long combinations_length = counter * counter;
  long *combinations = (long*)calloc(combinations_length, sizeof(long));
  get_combinations(combinations, abundant_numbers, counter);
  qsort(combinations, combinations_length, sizeof(long), compare_function);

  // We have all of the sorted combinations, but there are duplicates...
  // Create a new set of combinations with no duplicated values.
  long *uniquecombinations = (long*)calloc(combinations_length, sizeof(long));
  long unique_counter = 0;
  long current_value, last = 0;
  for(long i=0; i<combinations_length; i++){
    current_value = combinations[i];
    if(current_value != last){
      uniquecombinations[unique_counter] = current_value;
      unique_counter++;
    }
    last = current_value;
  }

  // We have the combinations of two abundant numbers we need
  // Find all numbers that cannot be expressed as the sum of two of these.
  long sumc = 0;
  for(long x=1; x<=LIMIT; x++){
    if(incombinations(uniquecombinations, counter, x) == TRUE){
      continue;
    }else{
      sumc = sumc + x;
    }
  }

  printf("%ld\n", sumc);  // 4,179,871
  free(abundant_numbers);
  free(combinations);
  free(uniquecombinations);
	return 0;
}


long get_sum_proper_divisors(long x){
  long sumd = 0;
  if(x == 1){
    return 0;
  }
  for(long i=1; i<=(x/2); i++){
    if(x % i == 0){
      sumd = sumd + i;
    }
  }
  return sumd;
}


void get_combinations(long *combinations, long *abundant_numbers, long counter){
  // fills the combinations array with pairs of summed abundant_numbers
  long ccounter = 0;
  long combinations_length = counter * counter;
  long numi, numj, sum;
  int include;
  for(long i=0; i<counter; i++){
    for(long j=0; j<counter; j++){
      // get the sum of these two numbers
      numi = abundant_numbers[i];
      numj = abundant_numbers[j];
      sum = numi + numj;
      combinations[ccounter] = sum;
      ccounter++;
    }
  }
}


int incombinations(long *combinations, long counter, long x){
  // checks whether x is in our combinations array
  for(long k=0; k<(counter*counter); k++){
    if(combinations[k] == x){
      // x found... return TRUE and exit
      return TRUE;
    }
    if(combinations[k] == 0){
      // we hit a zero from orig calloc (so x not found)
      // return FALSE and exit
      return FALSE;
    }
  }
  return FALSE;
}
