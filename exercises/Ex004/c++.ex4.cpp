/*
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 * 99.
Find the largest palindrome made from the product of two 3-digit numbers.
*/

#include <iostream>
#include <string>
#include <algorithm>

bool is_palindromic_number(long int x);


int main(){
  long int result, largest = 0;
  // go through pairs of three digit numbers
  // these are all numbers from 100 -> 999
  for(int i=100; i<1000; i++){
    for(int j=100; j<1000; j++){
      result = i * j;
      if(is_palindromic_number(result)){
        if(result > largest){
          largest = result;
        }
      }
    }
  }

  std::cout << largest << std::endl;  // 906609
  return 0;
}


bool is_palindromic_number(long int x){
  // returns true if x is a palindromic number, false otherwise
  std::string strx = std::to_string(x);
  std::string strxrev(strx);
  std::reverse(strxrev.begin(), strxrev.end());
  if(strx.compare(strxrev) == 0){
    return true;
  }else{
    return false;
  }
}
