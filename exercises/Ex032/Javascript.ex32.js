/*
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
*/

function is_pandigital(multiplicand, multiplier, product){
  var numbers = multiplicand.toString() + multiplier.toString() + product.toString();
  numbers = numbers.split("").sort().join("");
  if(numbers == "123456789"){
    return true;
  }else{
    return false;
  }
}
//console.log(is_pandigital(39, 186, 7254));  // true

var products = new Set();
var product;
for(var multiplicand=0; multiplicand<=10000; multiplicand++){
  for(var multiplier=0; multiplier<=100; multiplier++){
    product = multiplicand * multiplier;
    if(is_pandigital(multiplicand, multiplier, product)){
      products.add(product);
    }
  }
}

var productsum = Array.from(products).reduce(function (a, b) {
    return a + b;
})

console.log(productsum);  // 45,228
