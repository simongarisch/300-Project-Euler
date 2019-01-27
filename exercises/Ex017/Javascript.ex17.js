/*
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
The use of "and" when writing out numbers is in compliance with British usage.
*/

var num2words =  {"1": "One",
                 "2": "Two",
                 "3": "Three",
                 "4": "Four",
                 "5": "Five",
                 "6": "Six",
                 "7": "Seven",
                 "8": "Eight",
                 "9": "Nine",
                 "10": "Ten",
                 "11": "Eleven",
                 "12": "Twelve",
                 "13": "Thirteen",
                 "14": "Fourteen",
                 "15": "Fifteen",
                 "16": "Sixteen",
                 "17": "Seventeen",
                 "18": "Eighteen",
                 "19": "Nineteen",
                 "20": "Twenty",
                 "30": "Thirty",
                 "40": "Forty",
                 "50": "Fifty",
                 "60": "Sixty",
                 "70": "Seventy",
                 "80": "Eighty",
                 "90": "Ninety"
};
//console.log(num2words);


function get_number_text(num) {
  // returns the text representing a given integer (up to 1000)
  var numstr = num.toString();
  var txt = "";

  if(numstr.length == 4){  // get the thousands
    txt += num2words[numstr[0]];
    txt += "Thousand";
    numstr = numstr.substring(1, numstr.length);
    if(numstr == "000"){
      return txt;
    }
  }

  if(numstr.length == 3){
    txt += num2words[numstr[0]];
    txt += "Hundred";
    numstr = numstr.substring(1, numstr.length);
    if(numstr == "00"){
      return txt;
    }
  }

  if(txt.length > 0){
    txt += "And";
  }

  if(numstr.length == 2){
    first_digit = parseInt(numstr[0]);
    second_digit = parseInt(numstr[1]);
    if(first_digit > 1){
      txt += num2words[first_digit * 10];
      numstr = numstr.substring(1, numstr.length);
    }else{
      txt += num2words[parseInt(numstr)];
      numstr = "";
    }
    if(second_digit == 0){
      numstr = "";
    }
  }

  if(numstr.length == 1){
    txt += num2words[parseInt(numstr)];
  }

  return txt;
}


//console.log(get_number_text(1000));
var num_chars = 0;
for(var num=1; num<=1000; num++){
  var txt = get_number_text(num);
  num_chars += txt.length;
}
console.log(num_chars);  // 21,124
