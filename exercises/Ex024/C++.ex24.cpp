/*
A permutation is an ordered arrangement of objects.
For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
If all of the permutations are listed numerically or alphabetically,
we call it lexicographic order.
The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits
0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

https://www.gnu.org/software/gsl/doc/html/permutation.html
permutations are generated in lexicographic order
g++ -Wall -I/usr/local/include -c C++.ex24.cpp
g++ -L/usr/local/lib -o C++.ex24.exe C++.ex24.o -llibgsl -llibgslcblas -lm
*/

#include <iostream>
#include <cstdlib>
#include <gsl/gsl_permutation.h>

using namespace std;

int main (void){
  gsl_permutation * p = gsl_permutation_alloc(10);
  gsl_permutation_init(p);

  long counter = 0;
  size_t size;  // long unsigned int
  size_t * data;
  long long int multiplier=1, result = 0;
  do{
    counter++;
    if(counter == 1000000){
      size = gsl_permutation_size(p);
      data = gsl_permutation_data(p);
      for(size_t i=0; i<(size); i++)
        multiplier = multiplier * 10;

      for(size_t i=0; i<size; i++){
        multiplier = multiplier / 10;
        result = result + data[i] * multiplier;
      }
    }
   }while (gsl_permutation_next(p) == GSL_SUCCESS);

  cout << result << endl;  // 2,783,915,460
  gsl_permutation_free (p);
  return 0;
}
