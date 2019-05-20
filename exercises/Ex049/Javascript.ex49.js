/*
The arithmetic sequence, 1487, 4817, 8147,
in which each of the terms increases by 3330, is unusual in two ways:
(i) each of the three terms are prime, and,
(ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
*/

let START = 1488  // look for the next one
let STOP = 1e4
let INCREMENT = 3330

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


function ispermutation(a, b){
  let astr = a.toString().split("").sort().join("")
  let bstr = b.toString().split("").sort().join("")
  return astr == bstr
}


function primeperms(){
  let primes = [];
  for(let i=START; i<=STOP; i++){
    if(isprime(i)){
      primes.push(i);
    }
  }

  let numprimes = primes.length;
  for(let idx1=0; idx1<numprimes; idx1++){
    let prime1 = primes[idx1];
    for(let idx2=idx1+1; idx2<numprimes; idx2++){
      let prime2 = primes[idx2];
      for(let idx3=idx2+1; idx3<numprimes; idx3++){
        let prime3 = primes[idx3];
        // check for a constant increment
        if(prime1 + INCREMENT == prime2){
          if(prime2 + INCREMENT == prime3){
            // and that these are permutations
            if(ispermutation(prime1, prime2)){
              if(ispermutation(prime2, prime3)){
                let primestr1 = prime1.toString();
                let primestr2 = prime2.toString();
                let primestr3 = prime3.toString();
                return [primestr1, primestr2, primestr3].join("");
              }
            }
          }
        }
      }
    }
  }
}


console.log(primeperms())  // 296,962,999,629
