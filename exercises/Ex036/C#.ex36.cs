/*
The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
*/

using System;

class Ex36{

  static void Main(){
    //Console.WriteLine(Convert.ToString(585, 2));        // 1001001001
    //Console.WriteLine(is_both_bases_palindromic(585));  // true
    long totsum = 0;
    for(long x=1; x<1e6; x++){
      if(is_both_bases_palindromic(x)){
        totsum += x;
      }
    }
    Console.WriteLine(totsum);  // 872,187
  }

  static bool is_both_bases_palindromic(long x){
    // returns true if x is palindromic in base 10 and base 2, false otherwise.
    string xstr10 = x.ToString();
    char[] x10arr = xstr10.ToCharArray();
    Array.Reverse(x10arr);
    string xstr10rev = new String(x10arr);
    if(xstr10.Equals(xstr10rev)){
      string xstr2 = Convert.ToString(x, 2);
      char[] x2arr = xstr2.ToCharArray();
      Array.Reverse(x2arr);
      string xstr2rev = new String(x2arr);
      if(xstr2.Equals(xstr2rev)){
        return true;
      }
    }
    return false;
  }

}
