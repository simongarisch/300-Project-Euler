/*
The arithmetic sequence, 1487, 4817, 8147,
in which each of the terms increases by 3330, is unusual in two ways:
(i) each of the three terms are prime, and,
(ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
*/
using System;
using System.Collections.Generic;
using System.Linq;


class Ex49{

  static int START = 1488;
  static int STOP = (int)1e4;
  static int INCREMENT = 3330;

  static void Main(){
    Console.WriteLine(primeperms());  // 296,962,999,629
  }


  static bool ispermutation(long a, long b){
    string astr = new string (a.ToString().OrderBy(c => c).ToArray());
    string bstr = new string (b.ToString().OrderBy(c => c).ToArray());
    return astr.Equals(bstr);
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


  static long primeperms(){
    List<long> primes = new List<long>();
    for(long i=START; i<=STOP; i++){
      if(isprime(i)){
        primes.Add(i);
      }
    }

    int numprimes = primes.Count;
    long prime1, prime2, prime3;
    for(int idx1=0; idx1<numprimes; idx1++){
      prime1 = primes[idx1];
      for(int idx2=idx1+1; idx2<numprimes; idx2++){
        prime2 = primes[idx2];
        for(int idx3=idx2+1; idx3<numprimes; idx3++){
          prime3 = primes[idx3];
          // check for a constant increment
          if(prime1 + INCREMENT == prime2){
            if(prime2 + INCREMENT == prime3){
              // and that these are permutations
              if(ispermutation(prime1, prime2)){
                if(ispermutation(prime2, prime3)){
                  string[] str = new String[]{prime1.ToString(),
                                              prime2.ToString(),
                                              prime3.ToString()};
                  return long.Parse(String.Join("", str));
                }
              }
            }
          }
        }
      }
    }
    return -1;
  }

}
