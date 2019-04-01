/*
If p is the perimeter of a right angle triangle with integral length sides, {a,b,c},
there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p <= 1000, is the number of solutions maximised?
*/

using System;
using System.Collections.Generic;
using System.Linq;

class Ex39{

  static void Main(){
    var perimeters = Enumerable.Repeat<long>(0, 1001).ToArray();
    long perimeter;
    for(int a=1; a<=1000; a++){
      for(int b=(a+1); b<=(1000-a); b++){
        for(int c=(b+1); c<=(1000-a-b); c++){
          if(Math.Pow(a,2) + Math.Pow(b,2) == Math.Pow(c,2)){
            perimeter = a + b + c;
            perimeters[perimeter] = perimeters[perimeter] + 1;
          }
        }
      }
    }

    long v, maxp=0, maxn=0;
    for(int i=1; i<=1000; i++){
      v = perimeters[i];
      if(v > maxn){
        maxn = v;
        maxp = i;
      }
    }
    Console.WriteLine(maxp);  // 840
  }

}
