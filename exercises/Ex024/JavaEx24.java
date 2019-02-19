/*
A permutation is an ordered arrangement of objects.
For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
If all of the permutations are listed numerically or alphabetically,
we call it lexicographic order.
The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits
0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
*/
import java.util.*;


public class JavaEx24{

    private static List<String> perms = new ArrayList<String>();

    public static void main(String[] args){
      String numstr = "0123456789";
      permgen(numstr, numstr.length());
      Collections.sort(perms);
      int idx = (int)(Math.pow(10, 6)-1);
      System.out.println(Long.parseLong(perms.get(idx)));  // 2,783,915,460
    }

    private static void permgen(String numstr, int n){
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

    private static String swap(String numstr, int i, int j){
      char temp;
      char[] chars = numstr.toCharArray();
      temp = chars[i];
      chars[i] = chars[j];
      chars[j] = temp;
      String s = new String(chars);
      return s;
    }

}
