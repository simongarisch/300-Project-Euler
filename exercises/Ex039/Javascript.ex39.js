/*
If p is the perimeter of a right angle triangle with integral length sides, {a,b,c},
there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p <= 1000, is the number of solutions maximised?
*/

var perimeters = {};
for(var a=1; a<1000; a++){
  for(var b=a+1; b<(1000-a); b++){
    for(var c=b+1; c<(1000-a-b); c++){
      if(Math.pow(a,2) + Math.pow(b,2) == Math.pow(c,2)){
        var perimeter = (a + b + c).toString();
        if(perimeter in perimeters){
          perimeters[perimeter] += 1;
        }else{
          perimeters[perimeter] = 1;
        }
      }
    }
  }
}

var maxp = 0;
var maxn = 0;
for (const [k, v] of Object.entries(perimeters)) {
  if(v > maxn){
    maxn = v;
    maxp = parseInt(k);
  }
}

console.log(maxp);  // 840
