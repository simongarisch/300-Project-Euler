/*
The fraction 49/98 is a curious fraction, as an inexperienced mathematician
in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction,
less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
*/

var numerators = [];
var denominators = [];
for(var denominator=10; denominator<100; denominator++){
  // less than one in value, so numerator < denominator
  for(var numerator=10; numerator<denominator; numerator++){
    // remove non-trivial examples such as 30/50 = 3/5
    if((numerator % 10 == 0) & (denominator % 10 == 0)){
      continue;
    }
    var result = numerator / denominator;
    var denstr = denominator.toString();
    var numstr = numerator.toString();
    for(const c of numstr){
      if(denstr.includes(c)){
        var short_num = numstr.replace(c, "");
        var short_den = denstr.replace(c, "");
        if(short_den == "0"){
          // dodge the zero division error
          continue;
        }
        var new_result = parseInt(short_num) / parseInt(short_den);
        if(new_result == result){
          numerators.push(numerator);
          denominators.push(denominator);
        }
      }
    }
  }
}

// we have the four examples
//console.log(numerators);    // [ 16, 26, 19, 49 ]
//console.log(denominators);  // [ 64, 65, 95, 98 ]
var productnum = numerators.reduce((a, b) => a * b );
var productden = denominators.reduce((a, b) => a * b );
var minimum_product = Math.min(productnum, productden);
for(var divisor=minimum_product; divisor>1; divisor--){
  if(productnum % divisor == 0){
    if(productden % divisor == 0){
      productden /= divisor;
      productnum /= divisor;
      break;
    }
  }
}

console.log(productden);  // 100
