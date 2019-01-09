/*
The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385
The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten natural
numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred
natural numbers and the square of the sum.
*/

using System;

class Ex6{

  static void Main(){
    long sum = 0;
    long sum_of_squares = 0;

    for(int i=0; i<=100; i++){
      sum += i;
      sum_of_squares += (long)Math.Pow(i, 2);
    }

    long square_of_sum = (long)Math.Pow(sum, 2);

    Console.WriteLine(square_of_sum - sum_of_squares);  // 25,164,150
  }

}
