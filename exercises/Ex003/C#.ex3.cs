/*
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
*/

using System;

class Ex3{

  static void Main(){
    long largest = 0;            // the largest prime factor
    long target = 600851475143;  // for a target number

    for(long i=2; i<Math.Pow(target, 0.5); i++){
      if(target % i == 0){  // it's a factor
        if(is_prime(i)){    // and it's a prime
          largest = i;
        }
      }
    }

    Console.WriteLine(largest);  // 6,857
  }

  static bool is_prime(long x){
    // will return true if x is prime, false otherwise
    if(x == 2 || x == 3){
      return true;
    }
    for(long i=2; i<x; i++){
      if(x % i == 0){
        return false;
      }
    }
    return true;
  }

}
