/*
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
*/
var STOP = 11;

function isprime(n){
  // will return true if number is prime, false otherwise
  if(n<2){
    return false;
  }
  if(n==2){
    return true;
  }

  for(var i=2; i<=Math.pow(n, 0.5); i++){
    if(n % i == 0){
      return false;
    }
  }
  return true;
}


function istruncatable(n){
  // returns true for primes that are both truncatable
  // from left to right and right to left.
  var nstr = n.toString();
  var nlen = nstr.length;
  for(var i=0; i<nlen; i++){
    var left = nstr.substring(0,i);
    var right = nstr.substring(i, nlen);
    //console.log(left + ", " + right)

    if(left.length > 0){
      if(!isprime(parseInt(left))){
        return false;
      }
    }
    if(right.length > 0){
      if(!isprime(parseInt(right))){
        return false;
      }
    }
  }
  return true;
}
//console.log(istruncatable(3797));  // true


var found = 0;
var totsum = 0;
var n = 8;
while(found < STOP){
  if(isprime(n)){
    if(istruncatable(n)){
      found++;
      totsum += n;
    }
  }
  n++;
}

console.log(totsum)  // 748,317
