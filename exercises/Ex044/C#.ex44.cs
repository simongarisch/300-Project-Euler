/*
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
*/
using System;
using System.Collections.Generic;


class Ex44{

  static void Main(){
    long D = 0;
    long n = 0;
    long p, penta;
    List<long> pentas = new List<long>();

    while(D == 0){
      n++;
      penta = pentagonal_number(n);
      for(int i=0; i<pentas.Count; i++){
        p = pentas[i];
        if(pentas.Contains(penta-p)){
          if(pentas.Contains(penta-2*p)){
            D = penta - 2*p;
            break;
          }
        }
      }
      pentas.Add(penta);
    }

    Console.WriteLine(D);  // 5,482,660
  }


  static long pentagonal_number(long n){
    return n*(3*n-1)/2;
  }

}
