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

using System;

class Ex38{

  static void Main(){
    //Console.WriteLine(pandigital(192, 3));  // 192384576
    int x = 98765;
    long maxpan = 0;
    while(x > 0){
      maxpan = Math.Max(maxpan, maxpandigitaln(x));
      x--;
    }

    Console.WriteLine(maxpan);  // 932,718,654
  }


  static long pandigital(int x, int n){
    // returns pandigital value if ispandigital
    // 0 otherwise
    string results = "";
    int mult;
    for(int i=1; i<=n; i++){
      mult = x * i;
      results = String.Concat(results, mult.ToString());
    }

    if(results.Length != 9){
      return 0;
    }
    long pnum = long.Parse(results);
    char[] a = results.ToCharArray();
    Array.Sort(a);
    string concat = new string(a);
    if(concat.Equals("123456789")){
      return pnum;
    }else{
      return 0;
    }
  }


  static long maxpandigitaln(int x){
    // check if x is pandigital for any value of n
    // where n > 1
    // because we are doing a concat, n < 10
    long pan = 0;
    for(int n=2; n<=10; n++){
      pan = Math.Max(pan, pandigital(x, n));
    }
    return pan;
  }

}
