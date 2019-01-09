/*
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 * 99.
Find the largest palindrome made from the product of two 3-digit numbers.
*/

using System;

class Ex4{
  static void Main(){
    long result, largest = 0;
    // go through pairs of three digit numbers
    // these are all numbers from 100 -> 999
    for(int i=100; i<1000; i++){
      for(int j=100; j<1000; j++){
        result = i * j;
        if(is_palindromic_number(result)){
          if(result > largest){
            largest = result;
          }
        }
      }
    }
    Console.WriteLine(largest); // 906609
  }

  static bool is_palindromic_number(long x){
    // returns true if x is a palindromic number, false otherwise
    string strx = x.ToString();
    var arr = strx.ToCharArray();
    Array.Reverse(arr);
    string strxrev = new string(arr);
    if(string.Equals(strx, strxrev)){
      return true;
    }else{
      return false;
    }
  }

}
