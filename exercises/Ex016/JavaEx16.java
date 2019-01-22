/*
2^15= 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
*/

import java.math.BigInteger;

public class JavaEx16 {

    public static void main(String[] args) {
      BigInteger num = new BigInteger("2");
      num = num.pow(1000);
      String numstr = num.toString();
      //System.out.println(numstr);

      int sum = 0;
      for (int i = 0; i < numstr.length(); i++){
        sum += Character.getNumericValue(numstr.charAt(i));
      }
      System.out.println(sum);  // 1,366
    }

}
