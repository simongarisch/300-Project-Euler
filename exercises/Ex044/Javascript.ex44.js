/*
Pentagonal numbers are generated by the formula, P(n) = n(3n-1)/2
The first ten pentagonal numbers are:
1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

It can be seen that P4 + P7 = 22 + 70 = 92 = P8.
However, their difference, 70 - 22 = 48, is not pentagonal.

Find the pair of pentagonal numbers, Pj and Pk, for which their
sum and difference are pentagonal and D = abs(Pk - Pj) is minimised
what is the value of D?
*/

function pentagonal_number(n){
  return(n*(3*n-1)/2)
}


var n = 0;
var pentas = [];
for(var i=1; i<=10; i++){
  pentas.push(pentagonal_number(i));
  n++;
}
//console.log(pentas);  // [ 1, 5, 12, 22, 35, 51, 70, 92, 117, 145 ]

var D = 0;
while(D == 0){
  n++;
  var penta = pentagonal_number(n);
  for(var i=0; i<pentas.length; i++){
    var p = pentas[i];
    if(pentas.includes(penta - p)){
      if(pentas.includes(penta - 2*p)){
        D = penta - 2*p;
        break;
      }
    }
  }
  pentas.push(penta);
}

console.log(D);  // 5,482,660
