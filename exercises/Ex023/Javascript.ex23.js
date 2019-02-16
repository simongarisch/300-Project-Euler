/*
A perfect number is a number for which the sum of its proper divisors is
exactly equal to the number.
For example, the sum of the proper divisors of 28 would be
1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n
and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
the smallest number that can be written as the sum of two abundant numbers is 24.
By mathematical analysis, it can be shown that all integers greater than 28123
can be written as the sum of two abundant numbers. However, this upper limit cannot
be reduced any further by analysis even though it is known that the greatest number
that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
*/

var LIMIT = 28123

function get_sum_proper_divisors(x){
  // returns the sum of all proper divisors for x
  if(x == 1){
    return 0;
  }
  var divisors = [];
  for(var i=1; i<=(x/2); i++){
    if(x % i == 0){
      divisors.push(i);
    }
  }
  //console.log(divisors);
  return divisors.reduce((a,b) => {return a+b});
}
//console.log(get_sum_proper_divisors(12))  // 16

var abundant_numbers = [];
for(var x=1; x<=LIMIT; x++){
  if(get_sum_proper_divisors(x) > x){
    abundant_numbers.push(x);
  }
}
//console.log(abundant_numbers);
//console.log(abundant_numbers.length);  // 6965

function sum_unique_combinations(arr){
  // get all of the unique combination sums (of 2 elements) with replacement
  var combinations = new Set();
  var sum;
  for(var i=0; i<arr.length; i++){
    for(var j=0; j<arr.length; j++){
      combinations.add(arr[i] + arr[j]);
    }
  }
  return [... combinations];
}

var combinations = sum_unique_combinations(abundant_numbers);
var sumc = 0;
for(var x=1; x<=LIMIT; x++){
  if(combinations.includes(x)){
    continue;
  }else{
    sumc += x;
  }
}
console.log(sumc)  // 4,179,871
