/*
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/

using System;

class Ex9{

  static void Main(){
    long product = 0;
    for(int a=1; a<1000; a++){
      for(int b=(a+1); b<1000; b++){
        for(int c=(b+1); c<1000; c++){
          if((a+b+c == 1000) && (Math.Pow(a,2) + Math.Pow(b,2) == Math.Pow(c,2))){
            product = a * b * c;
            break;
          }
        }
      }
    }
    Console.WriteLine(product); // 31,875,000
  }

}
