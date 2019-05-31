/*
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
*/

#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>

#define MAXPRIME 1e6


// forward declarations
bool isprime(long x);
long whichPrime();


int main(){
  long prime = whichPrime();
  std::cout << prime << std::endl;  // 997,651
  return 0;
}


long whichPrime(){
  // Which prime, below one-million,
  // can be written as the sum of the most consecutive primes?
  std::vector<long> primes = {};
  for(long i=1; i<=MAXPRIME; i++){
    if(isprime(i)){
      primes.push_back(i);
    }
  }

  std::vector<long> cumsum = {0};
  long total = 0;
  for(long prime : primes){
    total = total + prime;
    cumsum.push_back(total);
  }

  long primesLen = primes.size();
  bool found = false;
  long whichPrime = 0;
  long whichLen = primesLen;
  long diff;

  while(!found){
    for(int i=0; i < primesLen - whichLen + 1; i++){
      diff = cumsum.at(i+whichLen) - cumsum.at(i);
      if(diff > MAXPRIME){
        break;
      }
      // check if the difference is in primes
      if(std::find(primes.begin(), primes.end(), diff) != primes.end()){
        found = true;
        whichPrime = diff;
        break;
      }
    }
    if(found){
      break;
    }
    whichLen = whichLen - 1;
    if(whichLen <= 0){
      break;
    }
  }

  return whichPrime;
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
