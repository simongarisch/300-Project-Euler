/*
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
*/

function is_prime(x){
  // will return true if number is prime, false otherwise
  if(x==0 || x==1){
    return false;
  }

  if(x==2){
    return true;
  }

  for(var i=2; i<parseInt(Math.pow(x, 0.5))+1; i++){
    if(x % i == 0){
      return false;
    }
  }
  return true;
}

var sum = 0;
for(var i=2; i<2000000; i++){
  if(is_prime(i)){
    sum += i;
  }
}

console.log(sum); // 142,913,828,922
