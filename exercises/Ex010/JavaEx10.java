/*
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
*/

public class JavaEx10 {

    public static void main(String[] args) {
      long sum = 0;
      for(long i=1; i<2000000; i++){
        if(is_prime(i)){
          sum += i;
        }
      }
      System.out.println(sum);  // 142,913,828,922
    }

    public static boolean is_prime(long x){
      // will return true if x is prime, false otherwise
      if(x == 0 || x == 1){
        return false;
      }
      if(x == 2){
        return true;
      }
      for(long i=2; i<Math.floor(Math.pow(x, 0.5)+1); i++){
        if(x % i == 0){
          return false;
        }
      }
      return true;
    }

}
