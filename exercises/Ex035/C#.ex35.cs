/*
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
*/
using System;
using System.Collections.Generic;
using System.Linq;

class Ex35{

  static void Main(){
    /*
    Console.WriteLine(isprime(7));  // True
    List<long> rotations = digit_rotations(197);
    foreach(long rotation in rotations){
      Console.WriteLine(rotation);  // 197, 971, 719
    }
    */
    long counter = 0;
    for(long x=1; x<1e6; x++){
      if(isprime(x)){
        if(is_circular_prime(x)){
          counter += 1;
        }
      }
    }

    Console.WriteLine(counter);  // 55
  }


  static bool isprime(long x){
    // will return true if x is prime, false otherwise
    if(x < 2){
      return false;
    }
    if(x == 2){
      return true;
    }
    for(long i=2; i<=Math.Pow(x,0.5); i++){
      if(x % i == 0){
        return false;
      }
    }
    return true;
  }


  static List<long> digit_rotations(long x){
    // returns a list of results from rotating the digits in x
    string xstr = x.ToString();
    List<long> rotations = new List<long>();
    string left, right, rotation;
    for(int i=0; i<xstr.Length; i++){
      left = xstr.Substring(0, i);
      right = xstr.Substring(i, xstr.Length-i);
      rotation = String.Concat(right, left);
      rotations.Add(long.Parse(rotation));
    }
    return rotations;
  }


  static bool allprimes(List<long> rotations){
    // returns true if all of the numbers in numlist are prime, false otherwise
    foreach(long rotation in rotations){
      if(!isprime(rotation)){
        return false;
      }
    }
    return true;
  }


  static bool is_circular_prime(long x){
    // returns true if x is a circular prime, false otherwise
    List<long> rotations = digit_rotations(x);
    return allprimes(rotations);
  }

}
