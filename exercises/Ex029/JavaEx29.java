/*
Consider all integer combinations of a^b for 2 leq a leq 5 and 2 leq b leq 5:

2^2=4, 2^3=8, 2^4=16, 2^5=32
3^2=9, 3^3=27, 3^4=81, 3^5=243
4^2=16, 4^3=64, 4^4=256, 4^5=1024
5^2=25, 5^3=125, 5^4=625, 5^5=3125

If they are then placed in numerical order, with any repeats removed, we get the following sequence of 15 distinct terms:

4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125

How many distinct terms are in the sequence generated by ab for 2 leq a leq 100 and 2 leq b leq 100?
*/
import java.util.*;
import java.math.*;


public class JavaEx29{

    public static void main(String[] args) {
      int from=2, to=100;
      BigInteger bigint;
      String numstr;
      List<String> terms = new ArrayList<String>();

      for(int a=from; a<=to; a++){
        for(int b=from; b<=to; b++){
          bigint = BigInteger.valueOf(a);
          bigint = bigint.pow(b);
          numstr = bigint.toString();
          terms.add(numstr);
          //System.out.println(numstr);
        }
      }


      Set<String> set = new HashSet<String>(terms);
      System.out.println(set.size());  // 9,183
    }

}
