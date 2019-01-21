/*
Starting at the top left corner of a 2 x 2 grid, and only being able to move
to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20 x 20 grid?

csc.exe C#.ex15.cs -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5\System.Numerics.dll"
*/

using System;
using System.Numerics;

class Ex15{

  static void Main(){
    int SIZE = 20;
    BigInteger choices = new BigInteger(1);

    for (int i = 1; i <= (SIZE); i++){
        choices *= (2*SIZE) - (SIZE - i);
        choices /= i;
    }

    Console.WriteLine(choices);  // 137,846,528,820
  }

}
