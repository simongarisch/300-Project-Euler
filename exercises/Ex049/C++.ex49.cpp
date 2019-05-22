/*
The arithmetic sequence, 1487, 4817, 8147,
in which each of the terms increases by 3330, is unusual in two ways:
(i) each of the three terms are prime, and,
(ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
*/

#include <iostream>
#include <vector>
#include <algorithm>  // this header is required for std::sort to work
#include <cmath>

#define START 1488
#define STOP 1e4
#define INCREMENT 3330

using namespace std;

bool isprime(long x);
bool ispermutation(long a, long b);
long primeperms();


int main(){
  //long a=123, b=321;
  //cout << ispermutation(a,b) << endl;  // true
  cout << primeperms() << endl;  // 296,962,999,629
  return 0;
}


bool ispermutation(long a, long b){
  // returns true if two numbers are permutations of each other,
  // false otherwise
  string astr = to_string(a);
  string bstr = to_string(b);
  sort(astr.begin(), astr.end());
  sort(bstr.begin(), bstr.end());
  if(astr.compare(bstr) == 0){
    return true;
  }else{
    return false;
  }
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


long primeperms(){
  vector<long> primes = {};
  for(long i=START; i<=STOP; i++){
    if(isprime(i)){
      primes.push_back(i);
    }
  }

  long numprimes = primes.size();
  long prime1, prime2, prime3;
  for(int idx1=0; idx1<numprimes; idx1++){
    prime1 = primes.at(idx1);
    for(int idx2=idx1+1; idx2<numprimes; idx2++){
      prime2 = primes.at(idx2);
      for(int idx3=idx2+1; idx3<numprimes; idx3++){
        prime3 = primes.at(idx3);
        // check fro a constant increment
        if(prime1 + INCREMENT == prime2){
          if(prime2 + INCREMENT == prime3){
            // and that these are permutations
            if(ispermutation(prime1, prime2)){
              if(ispermutation(prime2, prime3)){
                return stol(to_string(prime1) + to_string(prime2) + to_string(prime3));
              }
            }
          }
        }
      }
    }
  }
}
