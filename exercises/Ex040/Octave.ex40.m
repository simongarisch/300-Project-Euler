%{
An irrational decimal fraction is created by concatenating the positive integers:

0.12345678910 1 112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.
d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000
%}

num = 0;
digit_counter = 0;
mult = 1;
result = 1;

while mult <= 1e6
  found = false;
  while !found
    num += 1;
    numstr = num2str(num);
    for i = 1:length(numstr)
      digit = str2num(numstr(i));
      digit_counter += 1;
      if mult == digit_counter
        result *= digit;
        found = true;
      endif
    endfor
  endwhile
  mult *= 10;
endwhile

disp(result)  # 210
