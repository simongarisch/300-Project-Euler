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

using System;
using System.Collections.Generic;


class Ex24{

  private static List<String> perms = new List<String>();

  static void Main(){
    // get our array from 0 -> 9
    String numstr = "0123456789";
    int len = numstr.Length;
    permgen(numstr, numstr.Length);
    perms.Sort();
    Console.WriteLine(long.Parse(perms[1000000-1]));  // 2,783,915,460
  }

  private static void permgen(String numstr, int n){
      if (n == 0){
        perms.Add(numstr);
        //Console.WriteLine(numstr);
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
    char[] chars = numstr.ToCharArray();
    temp = chars[i];
    chars[i] = chars[j];
    chars[j] = temp;
    string s = new string(chars);
    return s;
  }

}
