/*
n! means n * (n - 1) * ... * 3 * 2 * 1

For example, 10! = 10 * 9 * ... * 3 * 2 * 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
*/

// npm install big-integer
var bigInt = require("big-integer");

var sum = 0;
var num = bigInt("1");
for(var i=1; i<=100; i++){
  num = num.times(i);
}

var numstr = num.toString();
for (var i=0; i<numstr.length; i++) {
  sum += parseInt(numstr.charAt(i));
}

console.log(sum);  // 648
