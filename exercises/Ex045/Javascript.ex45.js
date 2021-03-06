/*
Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:

Triangle	 	Tn=n(n+1)/2	 	1, 3, 6, 10, 15, ...
Pentagonal	 	Pn=n(3n-1)/2	1, 5, 12, 22, 35, ...
Hexagonal	 	Hn=n(2n-1)	 	1, 6, 15, 28, 45, ...

It can be verified that T285 = P165 = H143 = 40755.

Find the next triangle number that is also pentagonal and hexagonal.
*/

var MAXN = 1e5;
var FIND_AFTER = 40755;

var triangle = (n) => n*(n+1)/2;
var pentagonal = (n) => n*(3*n-1)/2;
var hexagonal = (n) => n*(2*n-1);

function populate(func){
  var arrayn = [];
  var n = 0;
  while(n <= MAXN){
    n++;
    arrayn.push(func(n));
  }
  return arrayn;
}


var tn = populate(triangle);
var pn = populate(pentagonal);
var hn = populate(hexagonal);

var result = 0;
for(var i=0; i<hn.length; i++){
  var h = hn[i];
  if(pn.includes(h)){
    if(tn.includes(h)){
      if(h > FIND_AFTER){
        result = h;
        break;
      }
    }
  }
}

console.log(result);  // 1,533,776,805
