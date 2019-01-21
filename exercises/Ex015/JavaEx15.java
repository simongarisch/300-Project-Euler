/*
Starting at the top left corner of a 2 x 2 grid, and only being able to move
to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20 x 20 grid?
*/

import java.math.BigInteger;

public class JavaEx15 {

    public static void main(String[] args) {
      int SIZE = 20;
      BigInteger choices = new BigInteger("1");

      for (int i = 1; i <= (SIZE); i++){
          choices = choices.multiply(BigInteger.valueOf((2*SIZE) - (SIZE - i)));
          choices = choices.divide(BigInteger.valueOf(i));
      }

      System.out.println(choices);  // 137,846,528,820
    }

}
