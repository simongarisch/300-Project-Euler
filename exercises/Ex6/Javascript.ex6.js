/*
The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385
The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten natural
numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred
natural numbers and the square of the sum.
*/

var sum = 0;
var sum_of_squares = 0;

for(var i=1; i<=100; i++){
  sum += i;
  sum_of_squares += Math.pow(i, 2);
}

var square_of_sum = Math.pow(sum, 2);

console.log(square_of_sum - sum_of_squares);  // 25,164,150
