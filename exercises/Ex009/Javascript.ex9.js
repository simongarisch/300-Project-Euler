/*
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/

var product = null;
for(var a=0; a<1000; a++){
  for(var b=(a+1); b<1000; b++){
    for(var c=(b+1); c<1000; c++){
      if(a+b+c == 1000 && Math.pow(a,2) + Math.pow(b,2) == Math.pow(c,2)){
        product = a * b * c;
        break;
      }
    }
  }
}

console.log(product); // 31,875,000
