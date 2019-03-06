/*
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
*/

using System;
using System.Collections.Generic;
using System.Linq;


class Ex32{

  static long MAX_MULTIPLICAND = 10000;
  static long MAX_MULTIPLER = 100;


  static void Main(){
    //Console.WriteLine(is_pandigital(39, 186, 7254));  // true

    long product;
    HashSet<long> products = new HashSet<long>();
    for(long multiplicand=0; multiplicand<=MAX_MULTIPLICAND; multiplicand++){
      for(long multiplier=0; multiplier<=MAX_MULTIPLER; multiplier++){
        product = multiplicand * multiplier;
        if(is_pandigital(multiplicand, multiplier, product)){
          products.Add(product);
        }
      }
    }

    Console.WriteLine(products.Sum());  // 45,228
  }


  static bool is_pandigital(long multiplicand, long multiplier, long product){
    string[] numbers = {
      multiplicand.ToString(),
      multiplier.ToString(),
      product.ToString()
    };
    string numstr = string.Join("", numbers);
    char[] numarr = numstr.ToCharArray();
    Array.Sort(numarr);
    numstr = new string(numarr);
    //Console.WriteLine(numstr);

    if(numstr.Equals("123456789")){
      return true;
    }else{
      return false;
    }
  }
}
