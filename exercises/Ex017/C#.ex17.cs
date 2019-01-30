/*
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
The use of "and" when writing out numbers is in compliance with British usage.
*/

using System;
using System.Collections.Generic;

class Ex17{

  private static Dictionary<int, string> num2words = new Dictionary<int, string>(){
    {1, "One"},
    {2, "Two"},
    {3, "Three"},
    {4, "Four"},
    {5, "Five"},
    {6, "Six"},
    {7, "Seven"},
    {8, "Eight"},
    {9, "Nine"},
    {10, "Ten"},
    {11, "Eleven"},
    {12, "Twelve"},
    {13, "Thirteen"},
    {14, "Fourteen"},
    {15, "Fifteen"},
    {16, "Sixteen"},
    {17, "Seventeen"},
    {18, "Eighteen"},
    {19, "Nineteen"},
    {20, "Twenty"},
    {30, "Thirty"},
    {40, "Forty"},
    {50, "Fifty"},
    {60, "Sixty"},
    {70, "Seventy"},
    {80, "Eighty"},
    {90, "Ninety"}
  };

  static void Main(){
    //Console.WriteLine(num2words);    // System.Collections.Generic.Dictionary`2[System.Int32,System.String]
    //Console.WriteLine(num2words[1]); // One
    //Console.WriteLine(get_number_text(1000));

    int num_chars = 0;
    string txt;
    for(int num=1; num<=1000; num++){
      txt = get_number_text(num);
      //Console.WriteLine(txt);
      num_chars += txt.Length;
    }
    Console.WriteLine(num_chars);  // 21,124
  }


  static string get_number_text(int num){
    string numstr = Convert.ToString(num);
    string txt = "";

    if(numstr.Length == 4){  // get the thousands
      txt += num2words[int.Parse(numstr[0].ToString())];
      txt += "Thousand";
      numstr = numstr.Substring(1);
      if(numstr == "000"){
        return txt;
      }
    }

    if(numstr.Length == 3){  // the hundreds
      txt += num2words[int.Parse(numstr[0].ToString())];
      txt += "Hundred";
      numstr = numstr.Substring(1);
      if(numstr == "00"){
        return txt;
      }
    }

    if(txt.Length > 0){
      txt += "And";
    }

    if(numstr.Length == 2){
      int first_digit = int.Parse(numstr[0].ToString());
      int second_digit = int.Parse(numstr[1].ToString());
      if(first_digit > 1){
        txt += num2words[first_digit * 10];
        numstr = numstr.Substring(1);
      }else{
        txt += num2words[int.Parse(numstr)];
        numstr = "";
      }
      if(second_digit == 0){
        numstr = "";
      }
    }

    if(numstr.Length == 1){
      txt += num2words[int.Parse(numstr)];
    }

    return txt;
  }
}
