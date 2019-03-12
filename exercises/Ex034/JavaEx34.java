/*
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
*/
import java.util.*;


public class JavaEx34 {

    public static void main(String[] args) {
      //System.out.println(is_curious(145));  // true
      int digits = get_max_digits();
      List<Long> curious_numbers = new ArrayList<Long>();
      // as 1! = 1 and 2! = 2 are not sums they are not included
      for(long x=3; x<Math.pow(10, digits); x++){
        if(is_curious(x)){
          curious_numbers.add(x);
        }
      }

      long numsum = 0;
      for(int i=0; i<curious_numbers.size(); i++) {
        numsum += curious_numbers.get(i);
      }
      System.out.println(numsum);  // 40,730
    }


    static long factorial(int n){
      if(n == 0){
        return 1;
      }else{
        return n * factorial(n-1);
      }
    }


    static boolean is_curious(long x){
      // returns True if x is equal to the sum its digit factorials, False otherwise
      long sumfact = 0;
      String xstr = Long.toString(x);
      int digit;
      for(int i=0; i<xstr.length(); i++){
        char c = xstr.charAt(i);
        digit = c - '0';
        sumfact += factorial(digit);
      }
      if(x == sumfact){
        return true;
      }else{
        return false;
      }
    }


    static int get_max_digits(){
      int digit = 1;
      while(factorial(9) * digit > Math.pow(digit - 1, 10)){
        digit += 1;
      }
      return digit;
    }

}
