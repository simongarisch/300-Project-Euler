%{
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
%}

function retval = is_curious(x)
  # returns True if x is equal to the sum its digit factorials, False otherwise
  sumfact = 0;
  xstr = num2str(x);
  for n = 1:length(xstr)
    digit = str2num(xstr(n));
    sumfact += factorial(digit);
  end
  if x == sumfact
    retval = true;
  else
    retval = false;
  end
endfunction
#is_curious(145)  # true


function digit = get_max_digits(x)
  digit = 1;
  while factorial(9) * digit > (digit - 1) ^ 10
    digit += 1;
  endwhile
endfunction

num_digits = get_max_digits();
curious_numbers = [];
# as 1! = 1 and 2! = 2 are not sums they are not included
for x = 3:(10 ^ num_digits)
  if is_curious(x)
    curious_numbers = [curious_numbers; x];
  endif
endfor

disp(sum(curious_numbers))  # 40,730
