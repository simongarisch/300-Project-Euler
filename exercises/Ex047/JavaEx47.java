/*
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 * 7
15 = 3 * 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2^2 * 7 * 23
645 = 3 * 5 * 43
646 = 2 * 17 * 19.

Find the first four consecutive integers to have four distinct prime factors each.
What is the first of these numbers?
*/
import java.util.*;


public class JavaEx47{


    static int TARGET_FACTORS = 4;
    static int MAXPRIME = (int)1e3;


    public static void main(String[] args) {
      List<Long> primes = new ArrayList<Long>();
      for(long i=1; i<=MAXPRIME; i++){
        if(isprime(i)){
          primes.add(i);
          //System.out.println(i);
        }
      }

      long sequence = 0;
      long n = 0;
      long prime;
      List<Long> factorsList = new ArrayList<Long>();
      List<Long> multiples = new ArrayList<Long>();
      while(true){
        n += 1;
        factorsList.clear();
        multiples.clear();

        for(int i=0; i<primes.size(); i++){
          prime = primes.get(i);
          if(n % prime == 0){
            factorsList.add(prime);
          }
          if(prime > n){
            break;
          }
        }

        if(factorsList.size() == TARGET_FACTORS){
          multiples = multFactors(factorsList);
          if(multiples.contains(n)){
            sequence += 1;
          }else{
            sequence = 0;
          }
        }else{
          sequence = 0;
        }

        if(sequence == TARGET_FACTORS){
          break;
        }
      }

      long first = n - TARGET_FACTORS + 1;
      System.out.println(first);  // 134,043
    }


    public static List<Long> multFactors(List<Long> factorsList){
      // return the results we get from multiplying prime factors
      List<Long> results = new ArrayList<Long>();
      long prime, result = 1;

      // straight multiplication
      for(int i=0; i<factorsList.size(); i++){
        prime = factorsList.get(i);
        result *= prime;
      }
      results.add(result);

      // where we have a ^2
      for(int i=0; i<factorsList.size(); i++){
        prime = factorsList.get(i);
        results.add(result * prime);
      }
      return results;
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

}
