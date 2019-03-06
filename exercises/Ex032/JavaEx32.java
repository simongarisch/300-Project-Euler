/*
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
*/
import java.util.*;


public class JavaEx32{

  static long MAX_MULTIPLICAND = 10000;
  static long MAX_MULTIPLER = 100;


    public static void main(String[] args) {
      //System.out.println(is_pandigital(39, 186, 7254));  // true
      long product;
      Set<Long> products = new HashSet<Long>();
      for(long multiplicand=0; multiplicand<=MAX_MULTIPLICAND; multiplicand++){
        for(long multiplier=0; multiplier<=MAX_MULTIPLER; multiplier++){
          product = multiplicand * multiplier;
          if(is_pandigital(multiplicand, multiplier, product)){
            products.add(product);
          }
        }
      }

      long productsum = 0;
      Iterator iterator = products.iterator();
      while (iterator.hasNext()) {
         productsum += (long)iterator.next();
      }

      System.out.println(productsum);  // 45,228
    }


    static boolean is_pandigital(long multiplicand, long multiplier, long product){
      String[] numbers = {
        Long.toString(multiplicand),
        Long.toString(multiplier),
        Long.toString(product)
      };
      String numstr = String.join("", numbers);
      char[] numarr = numstr.toCharArray();
      Arrays.sort(numarr);
      numstr = new String(numarr);

      if(numstr.equals("123456789")){
        return true;
      }else{
        return false;
      }
    }

}
