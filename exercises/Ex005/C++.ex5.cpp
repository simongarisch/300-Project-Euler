/*
2520 is the smallest number that can be divided by each of the numbers
from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of
the numbers from 1 to 20?
*/

#include <iostream>

int is_divisible_to_20(long x);


int main(){
  long counter = 1;
  while(!is_divisible_to_20(counter)){
    counter = counter + 1;
  }
  std::cout << counter << std::endl;  // 232,792,560
  return 0;
}


int is_divisible_to_20(long x){
  // returns true if x is evenly divisible by all of the
  // numbers from 1 to 20, false otherwise.
  for(int i=1; i<=20; i++){
    if(x % i != 0){
      return false;
    }
  }
  return true;
}
