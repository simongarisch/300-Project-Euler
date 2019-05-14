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
using System;
using System.Collections.Generic;
using System.Linq;


class Ex47{

  static int TARGET_FACTORS = 4;
  static int MAXPRIME = (int)1e3;


  public static void Main(){
    List<long> primes = new List<long>();
    for(long i=1; i<=MAXPRIME; i++){
      if(isprime(i)){
        primes.Add(i);
      }
    }

    long sequence = 0;
    long n = 0;
    List<long> factorsList = new List<long>();
    List<long> multiples = new List<long>();
    while(true){
      n += 1;
      factorsList.Clear();
      multiples.Clear();

      foreach(long prime in primes){
        if(n % prime == 0){
          factorsList.Add(prime);
        }
        if(prime > n){
          break;
        }
      }

      if(factorsList.Count == TARGET_FACTORS){
        multiples = multFactors(factorsList);
        if(multiples.Contains(n)){
          sequence += 1;
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
    Console.WriteLine(first);  // 134,043
  }


  public static List<long> multFactors(List<long> factorsList){
    // return the results we get from multiplying prime factors
    List<long> results = new List<long>();
    long result = 1;

    // straight multiplication
    foreach(long prime in factorsList){
      result *= prime;
    }
    results.Add(result);

    // where we have a ^2
    foreach(long prime in factorsList){
      results.Add(result * prime);
    }
    return results;
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

}
