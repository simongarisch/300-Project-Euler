/*
A perfect number is a number for which the sum of its proper divisors is
exactly equal to the number.
For example, the sum of the proper divisors of 28 would be
1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n
and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
the smallest number that can be written as the sum of two abundant numbers is 24.
By mathematical analysis, it can be shown that all integers greater than 28123
can be written as the sum of two abundant numbers. However, this upper limit cannot
be reduced any further by analysis even though it is known that the greatest number
that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
*/
import java.util.*;


public class JavaEx23{

    static long LIMIT = 28123;

    public static void main(String[] args) {
      //System.out.println(get_sum_proper_divisors(12));  // 16;
      List<Long> abundant_numbers = new ArrayList<Long>();
      for(long x=1; x<=LIMIT; x++){
        if(get_sum_proper_divisors(x) > x){
          abundant_numbers.add(x);
        }
      }
      //System.out.println(abundant_numbers.size());  // 6,965

      // get all combinations with replacement for two of these abundent numbers
      Set<Long> combinations = new HashSet<Long>();
      for(int i=0; i<abundant_numbers.size(); i++){
        for(int j=0; j<abundant_numbers.size(); j++){
          combinations.add(abundant_numbers.get(i) + abundant_numbers.get(j));
        }
      }
      //System.out.println(combinations.size());

      // We have a list of the abundant numbers we need.
      // Find all numbers that cannot be expressed as the sum of two of these.
      long sumc = 0;
      for(long x=1; x<=LIMIT; x++){
        if(combinations.contains(x)){
          continue;
        }else{
          sumc += x;
        }
      }
      System.out.println(sumc);  // 4,179,871
    }


    private static long get_sum_proper_divisors(long x){
      long sumd = 0;
      if(x == 1){
        return 0;
      }
      for(long i=1; i<=(x/2); i++){
        if(x % i == 0){
          sumd += i;
        }
      }
      return sumd;
    }

}
