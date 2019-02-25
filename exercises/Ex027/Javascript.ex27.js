
function is_prime(x){
  // returns true is x is prime, false otherwise
  if(x <= 1){
    return false;
  }
  if(x == 2){
    return true;
  }
  for(var i=3; i<x; i++){
    if(x % i == 0){
      return false;
    }
  }
  return true;
}


function quadratic_formula(n, a, b){
  // returns the result of n^2 + a*n + b
  return Math.pow(n, 2) + a*n + b;
}


var maxprimes = 0;
var product = 0;

for(var a=-999; a<=999; a++){
  for(var b=-1000; b<=1000; b++){
    var n = 0;
    var isprime = true;
    while(isprime){
      var qfresult = quadratic_formula(n, a, b);
      isprime = is_prime(qfresult);
      if(isprime){
        n++;
        if(n > maxprimes){
          maxprimes = n;
          product = a * b;
        }
      }
    }
  }
}

console.log(product);  // -59,231
