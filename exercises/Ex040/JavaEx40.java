/*
An irrational decimal fraction is created by concatenating the positive integers:

0.12345678910 1 112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.
d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000
*/

public class JavaEx40 {

    public static void main(String[] args) {
        long num = 0;
        long digit_counter = 0;
        long mult = 1;
        long result = 1;

        boolean found;
        int digit;
        String numstr;

        while(mult <= 1e6){
          found = false;
          while(!found){
            num++;
            numstr = Long.toString(num);
            for(int i=0; i<numstr.length(); i++){
              digit = numstr.charAt(i) - '0';
              digit_counter++;
              if(mult == digit_counter){
                result = result * digit;
                found = true;
              }
            }
          }
          mult *= 10;
        }

        System.out.println(result);  // 210
    }

}
