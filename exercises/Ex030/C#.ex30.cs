/*
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
*/

using System;

class Ex30{

  static int POWER = 5;

  static void Main(){

    long ubound = POWER * (long)Math.Pow(9, POWER);
    long total = 0;
    long num = 2;
    //Console.WriteLine(digit_powers_equal(1634, 4));  // True

    while(num <= ubound){
      if(digit_powers_equal(num, POWER)){
        total += num;
      }
      num += 1;
    }

    Console.WriteLine(total); // 443,839
  }


  static bool digit_powers_equal(long num, int power){
    string numstr = num.ToString();
    long sum_digit_powers = 0;
    for (int i=0; i<numstr.Length; i++){
      sum_digit_powers += (long)Math.Pow(Int32.Parse(numstr.Substring(i,1)), power);
    }
    return num == sum_digit_powers;
  }
}
