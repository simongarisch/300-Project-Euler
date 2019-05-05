/*
A composite number is a positive integer that can be formed by multiplying
two smaller positive integers.
It was proposed by Christian Goldbach that every odd composite number
can be written as the sum of a prime and twice a square.

9 = 7 + 2 * 1^2
15 = 7 + 2 * 2^2
21 = 3 + 2 * 3^2
25 = 7 + 2 * 3^2
27 = 19 + 2 * 2^2
33 = 31 + 2 * 1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as
the sum of a prime and twice a square?
*/
import java.util.*;


public class JavaEx46{

    static long MAXN = (long)1e4;

    public static void main(String[] args){
      Long[] compos = generateOddCompos(MAXN);
      Long[] primes = generatePrimes(MAXN);
      Long[] squares = generateSquares(MAXN);

      Set<Long> searchSet = new HashSet<Long>();
      for(int i=0; i<primes.length; i++){
        for(int j=0; j<squares.length; j++){
          searchSet.add(primes[i] + 2*squares[j]);
        }
      }
      Object[] searchObjArr = searchSet.toArray();
      Arrays.sort(searchObjArr);
      Long[] searchArr = Arrays.copyOf(searchObjArr, searchObjArr.length, Long[].class);

      long smallest = 0;
      for(int i=0; i<compos.length; i++){
        long compo = compos[i];
        if(!Arrays.asList(searchArr).contains(compo)){
          smallest = compo;
          break;
        }
      }

      System.out.println(smallest);  // 5,777
    }


    static Long[] generateOddCompos(long n){
      Set<Long> composSet = new HashSet<Long>();
      long mult;
      for(long i=2; i<=n; i++){
        for(long j=2; j<=n; j++){
          mult = i * j;
          if(mult % 2 == 1){
            composSet.add(mult);
          }
        }
      }
      Object[] compos = composSet.toArray();
      Arrays.sort(compos);
      return Arrays.copyOf(compos, compos.length, Long[].class);
    }


    static Long[] generatePrimes(long n){
      Set<Long> primesSet = new HashSet<Long>();
      for(long i=1; i<=n; i++){
        if(isprime(i)){
          primesSet.add(i);
        }
      }
      Object[] primes = primesSet.toArray();
      Arrays.sort(primes);
      return Arrays.copyOf(primes, primes.length, Long[].class);
    }


    static Long[] generateSquares(long n){
      int numSquares = (int)Math.pow(n, 0.5);
      Long[] squares = new Long[numSquares];
      for(int i=1; i<=numSquares; i++){
        squares[i-1] = (long)Math.pow(i,2);
      }
      return squares;
    }


    public static boolean isprime(long n){
      // will return true if n is prime, false otherwise
      if(n < 2){
        return false;
      }
      if(n == 2){
        return true;
      }
      for(long i=2; i<=Math.pow(n, 0.5); i++){
        if(n % i == 0){
          return false;
        }
      }
      return true;
    }

}
