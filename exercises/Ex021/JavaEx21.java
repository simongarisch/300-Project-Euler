/*
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
*/

public class JavaEx21 {

    public static void main(String[] args) {
      //System.out.println(is_amicable(220));  // true
      long sum = 0;
      for(long x=1; x<10000; x++){
        if(is_amicable(x)){
          sum += x;
        }
      }
      System.out.println(sum);  // 31,626
    }


    public static long sum_divisors(long x){
      // returns the sum for all divisors of x
      long sum = 0;
      if(x > 1){
        for(long i=1; i<x; i++){
          if(x % i == 0){
            sum = sum + i;
          }
        }
      }
      return sum;
    }


    public static boolean is_amicable(long x){
      // returns true if x is an amicable number, false otherwise
      long sum_divx = sum_divisors(x);
      if(sum_divx == x){
        return false;
      }
      if(sum_divisors(sum_divx) == x){
        return true;
      }else{
        return false;
      }
    }

}
