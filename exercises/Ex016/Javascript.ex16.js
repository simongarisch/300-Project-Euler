/*
2^15= 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
*/

var bigInt = require("big-integer");

var sum = 0;
var num = bigInt("2").pow(1000);
var numstr = num.toString();
for (var i=0; i<numstr.length; i++) {
  sum += parseInt(numstr.charAt(i));
}

console.log(sum);  // 1,366
