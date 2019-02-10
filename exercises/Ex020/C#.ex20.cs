/*
n! means n * (n - 1) * ... * 3 * 2 * 1

For example, 10! = 10 * 9 * ... * 3 * 2 * 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
csc.exe C#.ex20.cs -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5\System.Numerics.dll"
*/

using System;
using System.Numerics;

class Ex20{
  static void Main(){
    BigInteger num = BigInteger.Parse("1");
    for(int i=1; i<=100; i++){
      num = BigInteger.Multiply(num, i);
    }
    String numstr = num.ToString();
    //Console.WriteLine(numstr);

    int sum = 0;
    foreach (char c in numstr){
      //Console.WriteLine(c);
      sum += int.Parse(c.ToString());
    }
    Console.WriteLine(sum);  // 648
  }
}
