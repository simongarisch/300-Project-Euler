/*
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
*/

using System;
using System.Collections.Generic;
using System.Linq;


class Ex34 {

  static void Main(){
    //Console.WriteLine(is_curious(145));  // true
    int digits = get_max_digits();
    List<long> curious_numbers = new List<long>();
    // as 1! = 1 and 2! = 2 are not sums they are not included
    for(long x=3; x<Math.Pow(10, digits); x++){
      if(is_curious(x)){
        curious_numbers.Add(x);
      }
    }

    long numsum = 0;
    foreach(long number in curious_numbers){
      numsum += number;
    }
    Console.WriteLine(numsum);  // 40,730
  }


  static long factorial(int n){
    if(n == 0){
      return 1;
    }else{
      return n * factorial(n-1);
    }
  }


  static bool is_curious(long x){
    // returns True if x is equal to the sum its digit factorials, False otherwise
    long sumfact = 0;
    string xstr = x.ToString();
    int digit;
    foreach(char c in xstr){
      digit = c - '0';
      sumfact += factorial(digit);
    }
    if(x == sumfact){
      return true;
    }else{
      return false;
    }
  }


  static int get_max_digits(){
    int digit = 1;
    while(factorial(9) * digit > Math.Pow(digit - 1, 10)){
      digit = digit + 1;
    }
    return digit;
  }

}
