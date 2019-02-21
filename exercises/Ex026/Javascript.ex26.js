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

var longest_pattern = 0   // the longest recurring cycle
var longest_divisor = 0   // for a particular divisor

for(var i=2; i<1000; i++){
  var n = 1;        // numerator to be divided by
  var result = [];  // track the result of our division

  // the maximum number of potential remainders we can have is (i-1)
  var remainders_found = {}
  for(var x=1; x<i; x++){
    remainders_found[x] = false;
  }
  var pattern_length = 0;
  var pattern_found = false;

  while(n != 0){
    n *= 10;             // go to the next significant figure
    var wholes = n / i;  // get the number of times n is evenly divisible by i
    n = n % i;           // continue with division for the remainder
    result.push(wholes);
    if(n==0){
      break;
    }

    // check if we have seen this remainder before
    if(remainders_found[n]){
      var idx1 = result.findIndex(function(x){return x == wholes});
      var idx2 = result.length;
      pattern_length = idx2 - idx1 - 1;
      if(pattern_length == 0){
        if(Object.values(remainders_found).filter(x => x).length == 1){
          pattern_length = 1;
        }
      }
      if(pattern_length > longest_pattern){
        longest_pattern = pattern_length;
        longest_divisor = i;
      }
      pattern_found = true;
    }
    remainders_found[n] = true;
    if(pattern_found){
      break;
    }
  }
}

console.log(longest_divisor);  // 983
