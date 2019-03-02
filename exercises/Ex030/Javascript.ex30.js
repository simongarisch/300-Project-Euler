/*
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
*/

var POWER = 5;
var ubound = POWER * Math.pow(9, POWER);

function digit_powers_equal(numstr, power){
  var sum_digit_powers = 0;
  for(var i = 0; i < numstr.length; i++){
    sum_digit_powers += Math.pow(parseInt(numstr.charAt(i)), power);
  }
  return sum_digit_powers == parseInt(numstr);
}
//console.log(digit_powers_equal("1634", 4))  // true

var total = 0;
var num = 2;
while(num <= ubound){
  if(digit_powers_equal(num.toString(), POWER)){
    total += num;
  }
  num += 1;
}
console.log(total);  // 443,839
