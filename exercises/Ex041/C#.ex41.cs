/*
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
*/
using System;
using System.Collections.Generic;


class Ex41{

  static string DIGITS = "123456789";
  static List<String> perms = new List<String>();

  static void Main(){
    int n = DIGITS.Length;
    long largest = 0;
    string numstr;
    long perm;

    while(n>=1 && largest==0){
      perms.Clear();
      numstr = DIGITS.Substring(0, n);
      permgen(numstr, numstr.Length);
      perms.Sort();
      for(int i=0; i<perms.Count; i++){
        //Console.WriteLine(perms[i]);
        perm = long.Parse(perms[i]);
        if(isprime(perm)){
          largest = perm;
        }
      }
      n--;
    }

    Console.WriteLine(largest);  // 7,652,413
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


  static bool isprime(long n){
    // will return true if n is prime, false otherwise
    if(n < 2){
      return false;
    }
    if(n == 2){
      return true;
    }
    for(long i=2; i<=Math.Pow(n,0.5); i++){
      if(n % i == 0){
        return false;
      }
    }
    return true;
  }

}
