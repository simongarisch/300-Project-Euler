/*
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
See https://www.mathsisfun.com/prime-factorization.html
*/

function is_prime(x){
  // will return true if number is prime, false otherwise
  if(x==2 || x==3){ // 2 and 3 are primes
    return true;
  }

  for(var i=2; i<x; i++){
    if(x % i == 0){
      return false;
    }
  }
  return true;
}

var largest = null;        // the largest prime factor
var target = 600851475143; // for a target number

/*
Every composite number has a factor less than or equal
to its square root.*/
for(var i=2; i < parseInt(Math.pow(target, 0.5)) + 1; i++){
  if(is_prime(i) && target % i == 0){
    largest = i;
  }
}

// note that this will take time to execute
console.log(largest); // 6,857
