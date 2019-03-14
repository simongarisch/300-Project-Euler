/*
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
*/
function is_prime(x){
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


function digit_rotations(x){
  // returns an array of results from rotating the digits in x
  var xstr = x.toString();
  var xlen = xstr.length;
  var rotations = [];
  for(var i=0; i<xlen; i++){
    var left = xstr.substring(0,i);
    var right = xstr.substring(i, xlen);
    var rotation =  parseInt(right + left)
    rotations.push(rotation);
  }
  return rotations;
}
//console.log(digit_rotations(197));  // [ 197, 971, 719 ]


function all_primes(numarr){
  // returns true if all of the numbers in numarr are prime, false otherwise
  for(var i=0; i<numarr.length; i++){
    if(!is_prime(numarr[i])){
      return false;
    }
  }
  return true;
}


function is_circular_prime(x){
  // returns true if x is a circular prime, false otherwise
  var rotations = digit_rotations(x);
  return all_primes(rotations);
}
//console.log(is_circular_prime(197))  // true


var counter = 0;
for(var x=1; x<1e6; x++){
  if(is_prime(x)){
    if(is_circular_prime(x)){
      counter++;
    }
  }
}

console.log(counter);  // 55
