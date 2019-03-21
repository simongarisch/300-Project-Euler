/*
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
*/

#include <iostream>
#include <cmath>

#define STOP 11

using namespace std;

bool isprime(long n);
bool istruncatable(long n);


int main(){
  //cout << istruncatable(3797)  << endl;  // true
  int found = 0;
  long totsum = 0;
  long n = 8;

  while(found < STOP){
    if(isprime(n)){
      if(istruncatable(n)){
        found++;
        totsum = totsum + n;
      }
    }
    n++;
  }

  cout << totsum << endl;  // 748,317
  return 0;
}


bool isprime(long n){
  // will return true if x is prime, false otherwise
  if(n < 2){
    return false;
  }
  if(n == 2){
    return true;
  }
  for(long i=2; i<=pow(n, 0.5); i++){
    if(n % i == 0){
      return false;
    }
  }
  return true;
}


bool istruncatable(long n){
  // returns true for primes that are both truncatable
  // from left to right and right to left.
  string nstr, left, right;
  nstr = to_string(n);
  int nlen = nstr.length();
  for(int i=1; i<=nlen; i++){
    left = nstr.substr(0, i-1);
    right = nstr.substr(i, nlen);
    //cout << left << ", " << right << endl;

    if(left.length() > 0){
      if(!isprime(stol(left))){
        return false;
      }
    }
    if(right.length() > 0){
      if(!isprime(stol(right))){
        return false;
      }
    }
  }
  return true;
}
