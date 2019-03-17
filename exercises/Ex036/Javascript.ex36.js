/*
The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
*/

//console.log(Number(585).toString(2));  // 1001001001

function reverse_string(s){
  var strspl = s.split("");
  return strspl.reverse().join("");
}
//console.log(reverse_string("123"))  // 321


function is_both_bases_palindromic(x){
  var xstr10 = x.toString();
  var xstr2 = x.toString(2);
  if(xstr10 == reverse_string(xstr10)){
    if(xstr2 == reverse_string(xstr2)){
      return true;
    }
  }
  return false;
}
//console.log(is_both_bases_palindromic(585))  // true


var totsum = 0;
for(var x=1; x<1e6; x++){
  if(is_both_bases_palindromic(x)){
    totsum += x;
  }
}

console.log(totsum);  // 872,187
