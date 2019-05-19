/*
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
*/

let bigInt = require("big-integer");

let START = 1;
let STOP = 1000;

let currentValue = START;
let seriesSum =  START;

while(currentValue < STOP){
  currentValue++;
  // get the last 12 integers from each increment
  let increment = parseInt(bigInt(currentValue).pow(currentValue).toString().slice(-10));
  seriesSum += increment;
}

let lastDigits = parseInt(seriesSum.toString().slice(-10));
console.log(lastDigits);  // 9,110,846,700
