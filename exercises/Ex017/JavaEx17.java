/*
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
The use of "and" when writing out numbers is in compliance with British usage.
*/
import java.util.*;


public class JavaEx17 {

  private static Map<Integer, String> num2words = new HashMap<Integer, String>() {{
    put(1, "One");
    put(2, "Two");
    put(3, "Three");
    put(4, "Four");
    put(5, "Five");
    put(6, "Six");
    put(7, "Seven");
    put(8, "Eight");
    put(9, "Nine");
    put(10, "Ten");
    put(11, "Eleven");
    put(12, "Twelve");
    put(13, "Thirteen");
    put(14, "Fourteen");
    put(15, "Fifteen");
    put(16, "Sixteen");
    put(17, "Seventeen");
    put(18, "Eighteen");
    put(19, "Nineteen");
    put(20, "Twenty");
    put(30, "Thirty");
    put(40, "Forty");
    put(50, "Fifty");
    put(60, "Sixty");
    put(70, "Seventy");
    put(80, "Eighty");
    put(90, "Ninety");
  }};


  public static void main(String[] args) {
    //System.out.println(num2words);
    //System.out.println(get_number_text(1000));
    int num_chars = 0;
    String txt;
    for(int num=1; num<=1000; num++){
      txt = get_number_text(num);
      //System.out.println(txt);
      num_chars += txt.length();
    }
    System.out.println(num_chars);  // 21,124
  }


  public static String get_number_text(int num){
    String numstr = Integer.toString(num);
    String txt = "";

    if(numstr.length() == 4){  // get the thousands
      txt += num2words.get(Integer.parseInt(numstr.substring(0, 1)));
      txt += "Thousand";
      numstr = numstr.substring(1, numstr.length());
      if(new String("000").equals(numstr)){
        return txt;
      }
    }

    if(numstr.length() == 3){  // the hundreds
      txt += num2words.get(Integer.parseInt(numstr.substring(0, 1)));
      txt += "Hundred";
      numstr = numstr.substring(1, numstr.length());
      if(new String("00").equals(numstr)){
        return txt;
      }
    }

    if(txt.length() > 0){
      txt += "And";
    }

    if(numstr.length() == 2){
      int first_digit = Integer.parseInt(numstr.substring(0, 1));
      int second_digit = Integer.parseInt(numstr.substring(1, 2));
      if(first_digit > 1){
        txt += num2words.get(first_digit * 10);
        numstr = numstr.substring(1, numstr.length());
      }else{
        txt += num2words.get(Integer.parseInt(numstr));
        numstr = "";
      }
      if(second_digit == 0){
        numstr = "";
      }
    }

    if(numstr.length() == 1){
      txt += num2words.get(Integer.parseInt(numstr));
    }

    return txt;
  }
}
