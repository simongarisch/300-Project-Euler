/*
n! means n * (n - 1) * ... * 3 * 2 * 1

For example, 10! = 10 * 9 * ... * 3 * 2 * 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
csc.exe C#.ex20.cs -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5\System.Numerics.dll"
*/


import java.math.*;

public class JavaEx20 {

    public static void main(String[] args) {
      BigInteger num = new BigInteger("1");
      for(int i=1; i<=100; i++){
        num = num.multiply(BigInteger.valueOf(i));
      }
      String numstr = num.toString();
      //System.out.println(numstr);

      int sum = 0;
      for (int i = 0; i < numstr.length(); i++){
        sum += Character.getNumericValue(numstr.charAt(i));
      }
      System.out.println(sum);  // 648
    }

}
