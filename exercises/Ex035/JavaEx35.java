/*
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
*/
import java.util.*;


public class JavaEx35{

    public static void main(String[] args) {
      /*
      System.out.println(isprime(7));  // true
      List<Long> rotations = digit_rotations(197);
      for(int i=0; i<rotations.size(); i++){
        System.out.println(rotations.get(i));  // 197, 971, 719
      }
      */
      long counter = 0;
      for(long x=1; x<1e6; x++){
        if(isprime(x)){
          if(is_circular_prime(x)){
            counter += 1;
          }
        }
      }

      System.out.println(counter);  // 55
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


    static List<Long> digit_rotations(long x){
      // returns a list of results from rotating the digits in x
      String xstr = Long.toString(x);
      List<Long> rotations = new ArrayList<Long>();
      String left, right, rotation;
      for(int i=0; i<xstr.length(); i++){
        left = xstr.substring(0, i);
        right = xstr.substring(i);
        rotation = right + left;
        rotations.add(Long.parseLong(rotation));
      }
      return rotations;
    }


    static boolean allprimes(List<Long> rotations){
      // returns true if all of the numbers in rotations are prime, false otherwise
      for(int i=0; i<rotations.size(); i++){
        if(!isprime(rotations.get(i))){
          return false;
        }
      }
      return true;
    }


    static boolean is_circular_prime(long x){
      // returns true if x is a circular prime, false otherwise
      List<Long> rotations = digit_rotations(x);
      return allprimes(rotations);
    }

}
