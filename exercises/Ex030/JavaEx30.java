/*
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
*/

public class JavaEx30 {

    static int POWER = 5;

    public static void main(String[] args) {
      long ubound = POWER * (long)Math.pow(9, POWER);
      long total = 0;
      long num = 2;
      //System.out.println(digit_powers_equal(1634, 4));  // true

      while(num <= ubound){
        if(digit_powers_equal(num, POWER)){
          total += num;
        }
        num += 1;
      }
      System.out.println(total);  // 443,839
    }

    static boolean digit_powers_equal(long num, int power){
      String numstr = Long.toString(num);
      long sum_digit_powers = 0;
      int digit;
      long increment;
      for (int i=0; i<numstr.length(); i++){
        digit = Integer.valueOf(numstr.substring(i, i+1));
        sum_digit_powers += (long)Math.pow(digit, power);
      }
      return num == sum_digit_powers;
    }

}
