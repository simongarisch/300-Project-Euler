/*
A composite number is a positive integer that can be formed by multiplying
two smaller positive integers.
It was proposed by Christian Goldbach that every odd composite number
can be written as the sum of a prime and twice a square.

9 = 7 + 2 * 1^2
15 = 7 + 2 * 2^2
21 = 3 + 2 * 3^2
25 = 7 + 2 * 3^2
27 = 19 + 2 * 2^2
33 = 31 + 2 * 1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as
the sum of a prime and twice a square?

https://stackoverflow.com/questions/38558989/node-js-heap-out-of-memory
node --max-old-space-size=8192 Javascript.ex46.js
*/

var MAXN = 1e4;


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


function generate_odd_compos(n){
  var compos_set = new Set();
  for(var i=2; i<=n; i++){
    for(var j=2; j<=n; j++){
      var mult = i * j;
      if(mult % 2 == 1){
        compos_set.add(mult);
      }
    }
  }
  var compos_arr = [... compos_set];
  compos_arr.sort(function(a, b){return a - b});
  return compos_arr;
}


function generate_primes(n){
  var primes = [];
  for(var i=1; i<=n; i++){
    if(isprime(i)){
      primes.push(i);
    }
  }
  return primes;
}


function generate_squares(n){
  var squares = [];
  for(var i=1; i<=Math.sqrt(n); i++){
    squares.push(Math.pow(i,2));
  }
  return squares;
}


function find_smallest(n){
  // find the smallest odd composite that cannot be written as
  // the sum of a prime and twice a square
  var compos = generate_odd_compos(n);
  var primes = generate_primes(n);
  var squares = generate_squares(n);
  var search_set = new Set();

  for(var i=0; i<primes.length; i++){
    for(var j=0; j<squares.length; j++){
      search_set.add(primes[i] + 2*squares[j]);
    }
  }

  var search_arr = [... search_set];
  search_arr.sort(function(a, b){return a - b});
  var smallest = 0;

  for(var i=0; i<compos.length; i++){
    var compo = compos[i];
    if(!search_arr.includes(compo)){
      smallest = compo;
      break;
    }
  }

  return smallest;
}


var smallest = find_smallest(MAXN);
console.log(smallest);  // 5,777
