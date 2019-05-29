/*
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
*/
var MAXPRIME = 1e6;


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


function collect_primes(maxprime){
  var primes = [];
  for(var i=1; i<maxprime; i++){
    if(isprime(i)){
      primes.push(i);
    }
  }
  return primes;
}


function which_prime(){
  // Which prime, below one-million,
  // can be written as the sum of the most consecutive primes?
  var primes = collect_primes(MAXPRIME);
  var primes_cumsum = [0];
  var primeslen = primes.length;

  var total = 0;
  for(var i=0; i<primeslen; i++){
    total += primes[i];
    primes_cumsum.push(total);
  }

  var found = false;
  var which_prime = 0;
  var which_len = primeslen;

  while(!found){
    for(var i=0; i < primeslen - which_len + 1; i++){
      var diff = primes_cumsum[i+which_len] - primes_cumsum[i];
      if(diff > MAXPRIME){
        break;
      }
      if(primes.includes(diff)){
        found = true;
        which_prime = diff;
        break;
      }
    }
    if(found){
      break;
    }
    which_len -= 1;
    if(which_len <= 0){
      break;
    }
  }

  return which_prime;
}


console.log(which_prime());  // 997,651
