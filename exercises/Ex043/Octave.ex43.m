%{
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.
%}

global DIGITS = "0123456789"

function retval = has_property(n)
  # returns True if n has the properties defined for problem, False otherwise
  global DIGITS
  n = num2str(n);
  if length(DIGITS) != 10
    retval = false;
    return;
  endif
  
  if mod(str2num(strcat(n(2) + n(3) + n(4))), 2) != 0
    retval = false;
    return;
  endif
  if mod(str2num(strcat(n(3) + n(4) + n(5))), 3) != 0
    retval = false;
    return;
  endif
  if mod(str2num(strcat(n(4) + n(5) + n(6))), 5) != 0
    retval = false;
    return;
  endif
  if mod(str2num(strcat(n(5) + n(6) + n(7))), 7) != 0
    retval = false;
    return;
  endif
  if mod(str2num(strcat(n(6) + n(7) + n(8))), 11) != 0
    retval = false;
    return;
  endif
  if mod(str2num(strcat(n(7) + n(8) + n(9))), 13) != 0
    retval = false;
    return;
  endif
  if mod(str2num(strcat(n(8) + n(9) + n(10))), 17) != 0
    retval = false;
    return;
  endif
  retval = true;
endfunction
#disp(has_property(1406357289))  # 1


sumpan = 0;
parr = str2num(perms(DIGITS));
for i=1:length(parr)
  if has_property(parr(i))
    sumpan += parr(i);
  endif
endfor

disp(sumpan)