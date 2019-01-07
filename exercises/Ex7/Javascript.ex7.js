/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
that the 6th prime is 13.
What is the 10,001st prime number?
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

var primes = [2, 3];
while(primes.length < 10001){
  // add one to your last prime and begin searching from there
  var number = primes[primes.length-1] + 1;
  while(!is_prime(number)){
    number++;
  }
  primes.push(number);
}

console.log(primes[primes.length-1]); // 104,743
