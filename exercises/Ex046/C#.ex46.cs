/*
A composite number is a positive integer that can be formed by multiplying
two smaller positive integers.
It was proposed by Christian Goldbach that every odd composite number
can be written as the sum of a prime and twice a square.

9 = 7 + 2 * 1^2
15 = 7 + 2 * 2^2
21 = 3 + 2 * 3^2
25 = 7 + 2 * 3^2
27 = 19 + 2 * 2^2
33 = 31 + 2 * 1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as
the sum of a prime and twice a square?
*/
using System;
using System.Collections.Generic;
using System.Linq;


class Ex46{

  static long MAXN = (long)1e4;

  static void Main(){
    long[] compos = generateOddCompos(MAXN);
    long[] primes = generatePrimes(MAXN);
    long[] squares = generateSquares(MAXN);

    HashSet<long> searchSet = new HashSet<long>();
    for(long i=0; i<primes.Length; i++){
      for(long j=0; j<squares.Length; j++){
        searchSet.Add(primes[i] + 2*squares[j]);
      }
    }
    long[] searchArr = searchSet.ToArray();
    Array.Sort(searchArr);

    long smallest = 0;
    for(long i=0; i<compos.Length; i++){
      long compo = compos[i];
      if(!searchArr.Contains(compo)){
        smallest = compo;
        break;
      }
    }

    Console.WriteLine(smallest);  // 5,777
  }


  static long[] generateOddCompos(long n){
    HashSet<long> composSet = new HashSet<long>();
    long mult;
    for(long i=2; i<=n; i++){
      for(long j=2; j<=n; j++){
        mult = i * j;
        if(mult % 2 == 1){
          composSet.Add(mult);
        }
      }
    }
    long[] compos = composSet.ToArray();
    Array.Sort(compos);
    return compos;
  }


  static long[] generatePrimes(long n){
    HashSet<long> primesSet = new HashSet<long>();
    for(long i=1; i<=n; i++){
      if(isprime(i)){
        primesSet.Add(i);
      }
    }
    long[] primes = primesSet.ToArray();
    return primes;
  }


  static long[] generateSquares(long n){
    long numSquares = (long)Math.Pow(n, 0.5);
    long[] squares = new long[numSquares];
    for(long i=1; i<=numSquares; i++){
      squares[i-1] = (long)Math.Pow(i,2);
    }
    return squares;
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

}
