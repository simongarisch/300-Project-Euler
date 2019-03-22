/*
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
*/
import java.util.*;


public class JavaEx37{

    static int STOP = 11;

    public static void main(String[] args){
      int found = 0;
      long totsum = 0;
      long n = 8;

      while(found < STOP){
        if(isprime(n)){
          if(istruncatable(n)){
            found++;
            totsum += n;
          }
        }
        n++;
      }
      System.out.println(totsum);  // 748,317
    }


    public static boolean isprime(long x){
      // will return true if x is prime, false otherwise
      if(x < 2){
        return false;
      }
      if(x == 2){
        return true;
      }
      for(long i=2; i<=Math.pow(x, 0.5); i++){
        if(x % i == 0){
          return false;
        }
      }
      return true;
    }


    static boolean istruncatable(long n){
      // returns true for primes that are both truncatable
      // from left to right and right to left.
      String nstr = Long.toString(n);
      int nlen = nstr.length();
      String left, right;

      for(int i=1; i<=nlen; i++){
        left = nstr.substring(0, i);
        right = nstr.substring(i);

        if(left.length() > 0){
          if(!isprime(Long.parseLong(left))){
            return false;
          }
        }
        if(right.length() > 0){
          if(!isprime(Long.parseLong(right))){
            return false;
          }
        }
      }
      return true;
    }

}
