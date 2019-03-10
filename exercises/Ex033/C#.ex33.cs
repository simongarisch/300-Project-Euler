/*
The fraction 49/98 is a curious fraction, as an inexperienced mathematician
in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction,
less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
*/

using System;
using System.Collections.Generic;
using System.Linq;


class Ex33{

  static void Main(){
    List<int> numerators = new List<int>();
    List<int> denominators = new List<int>();
    double result, new_result;
    string numstr, denstr;
    string numshort, denshort;

    for(int denominator=10; denominator<100; denominator++){
      // less than one in value, so numerator < denominator
      for(int numerator=10; numerator<denominator; numerator++){
        // remove non-trivial examples such as 30/50 = 3/5
        if((numerator % 10 == 0) & (denominator % 10 == 0)){
          continue;
        }
        result = (double)numerator / (double)denominator;
        denstr = denominator.ToString();
        numstr = numerator.ToString();
        foreach (char c in numstr){
          if(denstr.Contains(c)){
            numshort = replace_first_occurrence(numstr, c.ToString(), "");
            denshort = replace_first_occurrence(denstr, c.ToString(), "");
            if(String.Equals(denshort, "0")){
              // dodge the zero division error
              continue;
            }
            new_result = Convert.ToDouble(numshort) / Convert.ToDouble(denshort);
            if(new_result == result){
              numerators.Add(numerator);
              denominators.Add(denominator);
              break;
            }
          }
        }
      }
    }

    /*
    // we have the four examples
    foreach(int numerator in numerators){
      Console.WriteLine(numerator);   // 16, 26, 19, 49
    }
    foreach(int denominator in denominators){
      Console.WriteLine(denominator); // 64, 65, 95, 98
    }
    */
    long productnum = 1;
    long productden = 1;
    foreach(int numerator in numerators){
      productnum *= numerator;
    }
    foreach(int denominator in denominators){
      productden *= denominator;
    }
    long minimum_product = Math.Min(productnum, productden);
    for(long divisor=minimum_product; divisor>1; divisor--){
      if(productnum % divisor == 0){
        if(productden % divisor == 0){
          productden /= divisor;
          productnum /= divisor;
          break;
        }
      }
    }

    Console.WriteLine(productden);  // 100
  }

  public static string replace_first_occurrence(string source, string find, string replace){
    int place = source.IndexOf(find);
    string result = source.Remove(place, find.Length).Insert(place, replace);
    return result;
  }

}
