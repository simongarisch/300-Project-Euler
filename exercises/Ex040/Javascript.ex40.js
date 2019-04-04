/*
An irrational decimal fraction is created by concatenating the positive integers:

0.12345678910 1 112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.
d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000
*/

var num = 0;
var digit_counter = 0;
var mult = 1;
var result = 1;

while(mult <= 1e6){
  var found = false;
  while(!found){
    num++;
    var numstr = num.toString();
    var numspl = numstr.split("");
    for(var i=0; i<numspl.length; i++){
      var digit = parseInt(numspl[i]);
      digit_counter++;
      if(mult == digit_counter){
        result *= digit;
        found = true;
        //console.log(digit_counter, digit);
      }
    }
  }
  mult *= 10;
}

console.log(result);  // 210
