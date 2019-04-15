/*
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.
*/
var Combinatorics = require("js-combinatorics");

var DIGITS  = "0123456789"


function has_property(n){
  // returns True if n has the properties defined for problem, False otherwise
  n = n.toString();
  if(n.length != 10){
    return false;
  }

  if(parseInt(n[1]+n[2]+n[3]) % 2 != 0){
    return false;
  }
  if(parseInt(n[2]+n[3]+n[4]) % 3 != 0){
    return false;
  }
  if(parseInt(n[3]+n[4]+n[5]) % 5 != 0){
    return false;
  }
  if(parseInt(n[4]+n[5]+n[6]) % 7 != 0){
    return false;
  }
  if(parseInt(n[5]+n[6]+n[7]) % 11 != 0){
    return false;
  }
  if(parseInt(n[6]+n[7]+n[8]) % 13 != 0){
    return false;
  }
  if(parseInt(n[7]+n[8]+n[9]) % 17 != 0){
    return false;
  }
  return true;
}

//console.log(has_property(1406357289));  // true
var sumpan = 0;
var perms = Combinatorics.permutation(DIGITS.split(""));
perms = perms.toArray();
for(var i=0; i<perms.length; i++){
  var n = parseInt(perms[i].join(""));
  if(has_property(n)){
    sumpan += n;
  }
}

console.log(sumpan);  // 16,695,334,890
