/*
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
*/

public class JavaEx50{

    static long MAXPRIME = (long)1e6;

    public static void main(String[] args) {
        System.out.println(whichPrime());  //
    }


    static long whichPrime(){
      // Which prime, below one-million,
      // can be written as the sum of the most consecutive primes?
      List<Long> primes = collectPrimes(MAXPRIME);
      List<Long> cumsum = new ArrayList<Long>();
      cumsum.add(0);

      long total = 0;
      for(int i=0; i<primes.size(); i++){
        total += prime;
        cumsum.add(total);
      }

      bool found = false;
      long primesLen = primes.Count;
      long whichPrime = 0;
      long whichLen = primesLen;
      long diff = 0;

      while(!found){
        for(int i=0; i < primesLen - whichLen + 1; i++){
          diff = cumsum[i+(int)whichLen] - cumsum[i];
          if(diff > MAXPRIME){
            break;
          }
          if(primes.Contains(diff)){
            found = true;
            whichPrime = diff;
            break;
          }
        }
        if(found){
          break;
        }
        whichLen -= 1;
        if(whichLen <= 0){
          break;
        }
      }
      return whichPrime;
    }


    static List<Long> collectPrimes(long maxprime){
      List<Long> primes = new ArrayList<Long>();
      for(var i=1; i<maxprime; i++){
        if(isprime(i)){
          primes.add(i);
        }
      }
      return primes;
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
