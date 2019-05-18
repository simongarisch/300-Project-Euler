/*
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
*/

using System;

class Ex48{

  static int START = 1;
  static int STOP = 1000;


  static void Main(){
    long totsum = 0;
    for(long i=START; i<=STOP; i++){
      totsum = (totsum + powerof(i)) % (long)1e10;
    }
    Console.WriteLine(totsum);  // 9,110,846,700
  }


  static long powerof(long n){
    // fetch the last digits from the result n^n
    long result = n;
    for(int i=2; i<=n; i++){
      result *= n;
      // only keep the last digits
      result %= (long)1e10;
    }
    return result;
  }

}
