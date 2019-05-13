/*
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 * 7
15 = 3 * 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2^2 * 7 * 23
645 = 3 * 5 * 43
646 = 2 * 17 * 19.

Find the first four consecutive integers to have four distinct prime factors each.
What is the first of these numbers?
*/
#include <iostream>
#include <vector>
#include <cstdlib>
#include <cmath>

#define TARGET_FACTORS 4
#define MAXPRIME 1e3

using namespace std;

bool isprime(long x);


int main(){
  // collect our prime numbers
  long numprimes = 0;
  vector<long> primes = {};
  for(long i=0; i<MAXPRIME; i++){
    if(isprime(i)){
      primes.push_back(i);
    }
  }
  //for(long prime : primes){
  //  cout << prime << endl;
  //}

  long sequence = 0;
  long n = 0;
  vector<long> multiples_vector;
  vector<long> factors_vector;
  bool multiple_found;  // is n within multiples

  while(true){
    n++;
    // reset the factors vector
    factors_vector = {};

    for(long prime : primes){
      if(n % prime == 0){
        factors_vector.push_back(prime);
      }
      if(prime > n){
        break;
      }
    }

    if(factors_vector.size() == TARGET_FACTORS){
      multiples_vector = {};
      multiples_vector.push_back(1);
      // straight multiplication
      for(long factor : factors_vector){
        multiples_vector.at(0) = multiples_vector.at(0) * factor;
      }
      // and for the ^2
      for(long factor : factors_vector){
        multiples_vector.push_back(multiples_vector.at(0) * factor);
      }

      multiple_found = false;
      for(long multiple : multiples_vector){
        if(n == multiple){
          multiple_found = true;
        }
      }

      if(multiple_found){
        sequence++;
      }else{
        sequence = 0;
      }
    }else{
      sequence = 0;
    }

    if(sequence == TARGET_FACTORS){
      break;
    }
  }

  long first = n - TARGET_FACTORS + 1;
  cout << first << endl;  // 134,043
  return 0;
}


bool isprime(long x){
  // will return true if x is prime, false otherwise
  if(x < 2){
    return false;
  }
  if(x == 2){
    return true;
  }
  for(long i=2; i<=pow(x, 0.5); i++){
    if(x % i == 0){
      return false;
    }
  }
  return true;
}
