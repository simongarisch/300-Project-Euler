/*
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
*/
import java.util.*;


public class JavaEx44 {

    public static void main(String[] args){
        long D = 0;
        long n = 0;
        long p, penta;
        List<Long> pentas = new ArrayList<Long>();

        while(D == 0){
          n++;
          penta = pentagonal_number(n);
          for(int i=0; i<pentas.size(); i++){
            p = pentas.get(i);
            if(pentas.contains(penta-p)){
              if(pentas.contains(penta-2*p)){
                D = penta - 2*p;
                break;
              }
            }
          }
          pentas.add(penta);
        }

        System.out.println(D);  // 5,482,660
    }


    static long pentagonal_number(long n){
      return n*(3*n-1)/2;
    }

}
