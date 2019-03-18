/*
The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
*/
import java.util.*;
import java.lang.*;


public class JavaEx36{

    public static void main(String[] args) {
      //System.out.println(Long.toBinaryString(585));        // 1001001001
      //System.out.println(is_both_bases_palindromic(585));  // true
      long totsum = 0;
      for(long x=1; x<1e6; x++){
        if(is_both_bases_palindromic(x)){
          totsum += x;
        }
      }
      System.out.println(totsum);  // 872,187
    }


    static boolean is_both_bases_palindromic(long x){
      // returns true if x is palindromic in base 10 and base 2, false otherwise.
      String xstr10 = Long.toString(x);
      String xstr10rev = new StringBuffer(xstr10).reverse().toString();
      if(xstr10.equals(xstr10rev)){
        String xstr2 = Long.toBinaryString(x);
        String xstr2rev = new StringBuffer(xstr2).reverse().toString();
        if(xstr2.equals(xstr2rev)){
          return true;
        }
      }
      return false;
    }

}
