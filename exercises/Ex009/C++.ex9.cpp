/*
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/

#include <iostream>
#include <cmath>


int main(){

  long product = 0;
  for(int a=1; a<1000; a++){
    for(int b=(a+1); b<1000; b++){
      for(int c=(b+1); c<1000; c++){
        if((a+b+c == 1000) && (pow(a,2) + pow(b,2) == pow(c,2))){
          product = a * b * c;
          break;
        }
      }
    }
  }

  std::cout << product << std::endl;  // # 31,875,000
  return 0;
}
