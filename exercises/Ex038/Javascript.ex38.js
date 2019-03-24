/*
Take the number 192 and multiply it by each of 1, 2, and 3:

192 * 1 = 192
192 * 2 = 384
192 * 3 = 576
By concatenating each product we get the 1 to 9 pandigital, 192384576.
We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5,
giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
concatenated product of an integer with (1,2, ... , n) where n > 1?
*/
function pandigital(x, n){
  // returns pandigital value if ispandigital
  // 0 otherwise
  var results = [];
  for(var i=0; i<=n; i++){
    results.push((x * i).toString());
  }
  var pnum = parseInt(results.join(""));
  var concat = pnum.toString().split("").sort().join("");
  if(concat == "123456789"){
    return pnum;
  }else{
    return 0;
  }
}
//console.log(pandigital(192, 3));  // 192384576


function maxpandigitaln(x){
  // check if x is pandigital for any value of n
  // where n > 1
  // because we are doing a concat, n < 10
  var pan = 0;
  for(var n=2; n<=10; n++){
    pan = Math.max(pan, pandigital(x, n));
  }
  return pan;
}
//console.log(maxpandigitaln(192));  // 192384576


var x = 98765;
var maxpan = 0;
while(x > 0){
  maxpan = Math.max(maxpan, maxpandigitaln(x));
  x--;
}

console.log(maxpan);  // 932,718,654
