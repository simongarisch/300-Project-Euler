/*
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
*/
const math = require("mathjs")

function is_curious(x){
  // returns True if x is equal to the sum its digit factorials, False otherwise
  var digits = x.toString().split("");
  var sumfact = 0;
  for(var i=0; i<digits.length; i++){
    var digit = digits[i];
    sumfact += math.factorial(parseInt(digit));
  }
  if(x == sumfact){
    return true;
  }else{
    return false;
  }
}
//console.log(is_curious(145));  // true


function get_max_digits(){
  var digit = 1;
  while(math.factorial(9) * digit > Math.pow(digit-1, 10)){
    digit += 1;
  }
  return digit;
}


var digits = get_max_digits();
var curious_numbers = [];
//  as 1! = 1 and 2! = 2 are not sums they are not included
for(var x=3; x <= Math.pow(10, digits); x++){
  if(is_curious(x)){
    curious_numbers.push(x);
  }
}

var arrsum = curious_numbers.reduce(function(x, y){return x + y});
console.log(arrsum)  // 40,730
