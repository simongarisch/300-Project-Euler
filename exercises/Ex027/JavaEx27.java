
public class JavaEx27 {

    public static void main(String[] args) {
      long maxprimes = 0;
      long product = 0;
      long n, qfresult;
      boolean isprime;

      for(long a=-999; a<=999; a++){
        for(long b=-1000; b<=1000; b++){
          n = 0;
          isprime = true;
          while(isprime){
            qfresult = quadratic_formula(n, a, b);
            isprime = is_prime(qfresult);
            if(isprime){
              n++;
              if(n > maxprimes){
                maxprimes = n;
                product = a * b;
              }
            }
          }
        }
      }
      System.out.println(product);  // -59,231
    }


    static boolean is_prime(long x){
      // returns TRUE if x is prime, FALSE otherwise
      if(x <= 1){
        return false;
      }
      if(x == 2){
        return true;
      }
      for(long i=3; i<x; i++){
        if(x % i == 0){
          return false;
        }
      }
      return true;
    }


    static long quadratic_formula(long n, long a, long b){
      // returns the result of n^2 + a*n + b
      return n*n + a*n + b;
    }
}
