/*
A unit fraction contains 1 in the numerator.
The decimal representation of the unit fractions with denominators 2 to 10 are given:

1/2	= 	0.5
1/3	= 	0.(3)
1/4	= 	0.25
1/5	= 	0.2
1/6	= 	0.1(6)
1/7	= 	0.(142857)
1/8	= 	0.125
1/9	= 	0.(1)
1/10	= 	0.1
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d < 1000 for which 1/d contains the longest
recurring cycle in its decimal fraction part.

NOTES:
We'll approach this dividing by some int and keeping track of the result, remainder
and significant figure we're working with.
If we divide my a int (i) then the maximum number of potential remainders we can have is (i-1)
For example, if we have x / 12, possible remainders (if there are any) include
1, 2, 3, ... 11.
If we find the same remainder again them the pattern will repeat.
*/

using System;
using System.Collections.Generic;
using System.Linq;

class Ex26{

  static void Main(){
    int longest_pattern = 0;   // the longest recurring cycle
    int longest_divisor = 0;   // for a particular divisor

    int n, wholes, resultcounter;
    List<int> result;
    bool[] remainders_found;
    int pattern_length;
    bool pattern_found;
    int idx;

    for(int i=2; i<1000; i++){
      n = 1;  // numerator to be divided by
      resultcounter = 0;
      result = new List<int>();  // track the result of our division

      // the maximum number of potential remainders we can have is (i-1)
      remainders_found = new bool[i-1];
      remainders_found = remainders_found.Select(x => false).ToArray();
      pattern_length = 0;
      pattern_found = false;

      while(n != 0){
        n *= 10;         // go to the next significant figure
        wholes = n / i;  // get the number of times n is evenly divisible by i
        n = n % i;       // continue with division for the remainder

        result.Add(wholes);
        resultcounter++;
        if(n == 0){
          break;
        }

        // check if we have seen this remainder before
        if(remainders_found[n-1]){
          idx = 0;
          for(int x=0; x<(i-1); x++){
            idx++;
            if(result[x] == wholes){
              break;
            }
          }
          pattern_length = resultcounter - idx;
          if(pattern_length > longest_pattern){
            longest_pattern = pattern_length;
            longest_divisor = i;
          }
          pattern_found = true;
        }

        remainders_found[n-1] = true;
        if(pattern_found){
          break;
        }
      }

      List<string> resultlist = new List<string>();
      foreach (int digit in result){
        resultlist.Add(digit.ToString());
      }
      String resultstr = i.ToString() +", 0." + String.Join("", resultlist.ToArray());
      resultstr = resultstr + ", " + pattern_length.ToString();
      //Console.WriteLine(resultstr);
    }

    Console.WriteLine(longest_divisor);  // 983
  }

}
