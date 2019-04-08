/*
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
*/
var Combinatorics = require("js-combinatorics");

var DIGITS = "123456789";


function isprime(n){
  // will return true if n is prime, false otherwise
  if(n<2){
    return false;
  }
  if(n==2){
    return true;
  }

  for(var i=2; i<=Math.pow(n, 0.5); i++){
    if(n % i == 0){
      return false;
    }
  }
  return true;
}


var n = DIGITS.length;
var largest = 0;

while(n >= 1 && largest==0){
  var digits = DIGITS.slice(0, n-1);
  var perms = Combinatorics.permutation(digits.split(""));
  perms = perms.toArray().reverse();
  for(var i=0; i<perms.length; i++){
    var val = parseInt(perms[i].join(""));
    if(isprime(val)){
      largest = val;
      break;
    }
  }
  n--;
}

console.log(largest);  // 7,652,413
