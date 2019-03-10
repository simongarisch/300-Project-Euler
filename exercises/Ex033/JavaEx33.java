/*
The fraction 49/98 is a curious fraction, as an inexperienced mathematician
in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction,
less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
*/
import java.util.*;

public class JavaEx33 {

    public static void main(String[] args) {
      List<Integer> numerators = new ArrayList<Integer>();
      List<Integer> denominators = new ArrayList<Integer>();
      double result, new_result;
      String numstr, denstr;
      String numshort, denshort;

      for(int denominator=10; denominator<100; denominator++){
        // less than one in value, so numerator < denominator
        for(int numerator=10; numerator<denominator; numerator++){
          if((numerator % 10 == 0) & (denominator % 10 == 0)){
            continue;
          }
          result = (double)numerator / (double)denominator;
          denstr = Integer.toString(denominator);
          numstr = Integer.toString(numerator);
          for(int x=0; x<numstr.length(); x++){
            char c = numstr.charAt(x);
            if(denstr.contains(String.valueOf(c))){
              numshort = numstr.replaceFirst(String.valueOf(c), "");
              denshort = denstr.replaceFirst(String.valueOf(c), "");
              if(denshort.equals("0")){
                // dodge the zero division error
                continue;
              }
              new_result = Double.parseDouble(numshort) / Double.parseDouble(denshort);
              if(new_result == result){
                numerators.add(numerator);
                denominators.add(denominator);
                break;
              }
            }
          }
        }
      }

      /*
      // we have the four examples
      for(int i=0; i<numerators.size(); i++){
        System.out.println(numerators.get(i));   // 16, 26, 19, 49
      }
      for(int i=0; i<denominators.size(); i++){
        System.out.println(denominators.get(i)); // 64, 65, 95, 98
      }
      */
      long productnum = 1;
      long productden = 1;
      for(int i=0; i<numerators.size(); i++){
        productnum *= numerators.get(i);
      }
      for(int i=0; i<denominators.size(); i++){
        productden *= denominators.get(i);
      }
      long minimum_product = Math.min(productnum, productden);
      for(long divisor=minimum_product; divisor>1; divisor--){
        if(productnum % divisor == 0){
          if(productden % divisor == 0){
            productden /= divisor;
            productnum /= divisor;
            break;
          }
        }
      }

      System.out.println(productden);  // 100
    }

}
