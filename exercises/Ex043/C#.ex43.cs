/*
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.
*/
using System;
using System.Collections.Generic;


class Ex43{

  static string DIGITS = "0123456789";
  static List<String> perms = new List<String>();


  static void Main(){
    //Console.WriteLine(has_property(1406357289));  // True
    long sumpan = 0;
    long perm;

    perms.Clear();
    permgen(DIGITS, DIGITS.Length);
    for(int i=0; i<perms.Count; i++){
      perm = long.Parse(perms[i]);
      if(has_property(perm)){
        sumpan += perm;
      }
    }

    Console.WriteLine(sumpan);  //  16,695,334,890
  }


  static long construct_slice(string str, int p1, int p2, int p3){
    char[] chars = str.ToCharArray();
    char[] arr = new char[3];
    arr[0] = chars[p1];
    arr[1] = chars[p2];
    arr[2] = chars[p3];
    return long.Parse(new string(arr));
  }

  static bool has_property(long n){
    string str = n.ToString();
    if(str.Length != 10){
      return false;
    }

    if(construct_slice(str, 1, 2, 3) % 2 != 0){
      return false;
    }
    if(construct_slice(str, 2, 3, 4) % 3 != 0){
      return false;
    }
    if(construct_slice(str, 3, 4, 5) % 5 != 0){
      return false;
    }
    if(construct_slice(str, 4, 5, 6) % 7 != 0){
      return false;
    }
    if(construct_slice(str, 5, 6, 7) % 11 != 0){
      return false;
    }
    if(construct_slice(str, 6, 7, 8) % 13 != 0){
      return false;
    }
    if(construct_slice(str, 7, 8, 9) % 17 != 0){
      return false;
    }
    return true;
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
