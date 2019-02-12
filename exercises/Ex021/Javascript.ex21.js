/*
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
*/

function sum_divisors(x){
  // returns the sum for all divisors of x
  var sum = 0;
  if(x > 1){
    for(var i=1; i<x; i++){
      if(x % i == 0){
        sum += i;
      }
    }
  }
  return sum;
}


function is_amicable(x){
  // returns true if x is an amicable number, false otherwise
  var sum_divx = sum_divisors(x);
  if(sum_divx == x){
    return false;
  }
  if(sum_divisors(sum_divx) == x){
    return true;
  }else{
    return false;
  }
}

//console.log(is_amicable(220));  // true
var sum = 0;
for(var x=1; x<10000; x++){
  if(is_amicable(x)){
    sum += x;
  }
}

console.log(sum);  // 31,626
