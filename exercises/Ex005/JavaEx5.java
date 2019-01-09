/*
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
*/

public class JavaEx5 {

    public static void main(String[] args) {

      long counter = 1;
      while(!is_divisible_to_20(counter)){
        counter = counter + 1;
      }
      System.out.println(counter);  // 232,792,560
    }

    public static boolean is_divisible_to_20(long x){
      // returns true if x is evenly divisible by all of the
      // numbers from 1 to 20, false otherwise.
      for(int i=1; i<=20; i++){
        if(x % i != 0){
          return false;
        }
      }
      return true;
    }

}
