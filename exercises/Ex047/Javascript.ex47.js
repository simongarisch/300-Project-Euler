/*
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 * 7
15 = 3 * 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2^2 * 7 * 23
645 = 3 * 5 * 43
646 = 2 * 17 * 19.

Find the first four consecutive integers to have four distinct prime factors each.
What is the first of these numbers?
*/

var TARGET_FACTORS = 4
var MAXPRIME = 1e3


function isprime(x){
  // will return true if number is prime, false otherwise
  if(x<2){
    return false;
  }
  if(x==2){
    return true;
  }

  for(var i=2; i<=Math.pow(x, 0.5); i++){
    if(x % i == 0){
      return false;
    }
  }
  return true;
}


function mult_factors(prime_factors){
  // return the results we get from multiplying prime factors
  var results = [];
  var result = 1;
  for(var i=0; i<prime_factors.length; i++){
    result *= prime_factors[i];
  }
  results.push(result);

  for(var i=0; i<prime_factors.length; i++){
    results.push(result * prime_factors[i]);
  }
  return results;
}


var primes = []
for(var i=1; i<=MAXPRIME; i++){
  if(isprime(i)){
    primes.push(i);
  }
}

var sequence = 0;
var n = 0;
while(true){
  n++;
  var factors = 0;
  var prime_factors = [];
  for(var i=0; i<primes.length; i++){
    var prime = primes[i];
    if(n % prime == 0){
      factors++;
      prime_factors.push(prime);
    }
    if(prime > n){
      break;
    }
  }

  if(factors == TARGET_FACTORS){
    var multiples = mult_factors(prime_factors);
    if(multiples.includes(n)){
      sequence++;
    }else{
      sequence = 0;
    }
  }else{
    sequence = 0;
  }

  if(sequence == TARGET_FACTORS){
    break;
  }
}

var first = n - TARGET_FACTORS + 1;
console.log(first);  // 134,043
