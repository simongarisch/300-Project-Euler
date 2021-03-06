/*
Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:

Triangle	 	Tn=n(n+1)/2	 	1, 3, 6, 10, 15, ...
Pentagonal	 	Pn=n(3n-1)/2	1, 5, 12, 22, 35, ...
Hexagonal	 	Hn=n(2n-1)	 	1, 6, 15, 28, 45, ...

It can be verified that T285 = P165 = H143 = 40755.

Find the next triangle number that is also pentagonal and hexagonal.
*/
import java.util.*;


public class JavaEx45{

    static long MAXN = (long)1e5;
    static long FIND_AFTER = 40755;


    public static void main(String[] args){
        List<Long> tn = new ArrayList<Long>();
        List<Long> pn = new ArrayList<Long>();
        List<Long> hn = new ArrayList<Long>();

        for(long n=1; n<=MAXN; n++){
          tn.add(triangle(n));
          pn.add(pentagonal(n));
          hn.add(hexagonal(n));
        }

        long result = 0;
        long h;
        search: {
        for(int i=0; i<=hn.size(); i++){
          h = hn.get(i);
          if(h <= FIND_AFTER){
            continue;
          }
          if(pn.contains(h)){
            if(tn.contains(h)){
              result = h;
              break search;
            }
          }
        }
      }  // search

        System.out.println(result);  // 1,533,776,805
    }


    static long triangle(long n){
        return n*(n+1)/2;
    }

     static long pentagonal(long n){
        return n*(3*n-1)/2;
     }

     static long hexagonal(long n){
        return  n*(2*n-1);
     }

}
