/*
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
*/

public class JavaEx6 {

    public static void main(String[] args) {
      long sum = 0;
      long sum_of_squares = 0;

      for(int i=0; i<=100; i++){
        sum += i;
        sum_of_squares += (long)Math.pow(i, 2);
      }

      long square_of_sum = (long)Math.pow(sum, 2);

      System.out.println(square_of_sum - sum_of_squares);  // 25,164,150
    }

}
