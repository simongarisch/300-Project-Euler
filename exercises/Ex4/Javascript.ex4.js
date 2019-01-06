/*
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.
*/

function is_palindromic_number(x){
  // returns true if x is a palindromic number, false otherwise
  var str = x.toString();
  var reverse = str.split(""); // convert to array
  reverse = reverse.reverse(); // and reverse this array
  reverse = reverse.join("");  // then convert this array back to a string
  if(str == reverse){
    return true;
  }else{
    return false;
  }
}

var largest = 0;
// go through pairs of three digit numbers
// these are all numbers from 100 -> 999
for(var i=100; i<1000; i++){
  for(var j=100; j<1000; j++){
    var result = i * j;
    if(is_palindromic_number(result)){
      if(result > largest){
        largest = result;
      }
    }
  }
}

console.log(largest); // 906609
