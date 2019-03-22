/*
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
*/

using System;

class Ex37{

  static int STOP = 11;

  static void Main(){
    int found = 0;
    long totsum = 0;
    long n = 8;

    while(found < STOP){
      if(isprime(n)){
        if(istruncatable(n)){
          found++;
          totsum += n;
        }
      }
      n++;
    }

    Console.WriteLine(totsum);  // 748,317
  }


  static bool isprime(long n){
    // will return true if n is prime, false otherwise
    if(n < 2){
      return false;
    }
    if(n == 2){
      return true;
    }
    for(long i=2; i<=Math.Pow(n,0.5); i++){
      if(n % i == 0){
        return false;
      }
    }
    return true;
  }


  static bool istruncatable(long n){
    // returns true for primes that are both truncatable
    // from left to right and right to left.
    string nstr = n.ToString();
    int nlen = nstr.Length;
    string left, right;

    for(int i=1; i<=nlen; i++){
      left = nstr.Substring(0, i);
      right = nstr.Substring(i, nlen-i);

      if(left.Length > 0){
        if(!isprime(long.Parse(left))){
          return false;
        }
      }
      if(right.Length > 0){
        if(!isprime(long.Parse(right))){
          return false;
        }
      }
    }
    return true;
  }

}
