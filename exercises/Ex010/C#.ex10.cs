/*
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
*/

using System;

class Ex10{

  static void Main(){
    long sum = 0;
    for(long i=1; i<2000000; i++){
      if(is_prime(i)){
        sum += i;
      }
    }
    Console.WriteLine(sum); // 142,913,828,922
  }

  static bool is_prime(long x){
    // will return true if x is prime, false otherwise
    if(x == 0 || x == 1){
      return false;
    }
    if(x == 2){
      return true;
    }
    for(long i=2; i<Math.Floor(Math.Pow(x, 0.5)+1); i++){
      if(x % i == 0){
        return false;
      }
    }
    return true;
  }

}
