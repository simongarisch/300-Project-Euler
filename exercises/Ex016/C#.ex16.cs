/*
2^15= 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?

csc.exe C#.ex16.cs -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5\System.Numerics.dll"
*/

using System;
using System.Numerics;

class Ex16{
  static void Main(){
    BigInteger num = BigInteger.Pow(2, 1000);
    String numstr = num.ToString();
    //Console.WriteLine(numstr);

    int sum = 0;
    foreach (char c in numstr){
      //Console.WriteLine(c);
      sum += int.Parse(c.ToString());
    }
    Console.WriteLine(sum);  // 1,366
  }
}
