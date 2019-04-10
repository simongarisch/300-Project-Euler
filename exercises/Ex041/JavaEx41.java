/*
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
*/
import java.util.*;


public class JavaEx41{

    private static String DIGITS = "123456789";
    private static List<String> perms = new ArrayList<String>();

    public static void main(String[] args){
      int n = DIGITS.length();
      long largest = 0;
      String numstr;
      long perm;

      while(n>=1 && largest==0){
        perms.clear();
        numstr = DIGITS.substring(0, n);
        permgen(numstr, numstr.length());
        Collections.sort(perms);
        for(int i=0; i<perms.size(); i++){
          perm = Long.parseLong(perms.get(i));
          if(isprime(perm)){
            largest = perm;
          }
        }
        n--;
      }

      System.out.println(largest);  // 7,652,413
    }


    static void permgen(String numstr, int n){
        if (n == 0){
          perms.add(numstr);
          //System.out.println(numstr);
        }else{
            for(int i=0; i<n; i++){
              numstr = swap(numstr, i, n-1);
              permgen(numstr, n-1);
              numstr = swap(numstr, i, n-1);
            }
        }
    }


    static String swap(String numstr, int i, int j){
      char temp;
      char[] chars = numstr.toCharArray();
      temp = chars[i];
      chars[i] = chars[j];
      chars[j] = temp;
      String s = new String(chars);
      return s;
    }


    static boolean isprime(long x){
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
