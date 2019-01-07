/*
2520 is the smallest number that can be divided by each of the numbers
from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of
the numbers from 1 to 20?
*/

function is_divisible_to_20(x){
  // returns true if x is evenly divisible by all of the
  // numbers from 1 to 20, false otherwise.
  for(var i=1; i<=20; i++){
    if(x % i != 0){
      return false;
    }
  }
  return true;
}

var counter = 1;
while(!is_divisible_to_20(counter)){
  counter += 1;
}

console.log(counter); // 232,792,560
