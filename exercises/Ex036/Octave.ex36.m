%{
The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
%}

#dec2bin(585)  # 1001001001

function retval = is_both_bases_palindromic(x)
  # returns true if x is palindromic in base 10 and base 2, false otherwise.
  xstr10 = num2str(x);
  xstr2 = dec2bin(x);
  if strcmp(xstr10, fliplr(xstr10))
    if strcmp(xstr2, fliplr(xstr2))
      retval = true;
      return;
    endif
  endif
  retval = false;
endfunction
#is_both_bases_palindromic(585)  # true

totsum = 0;
for x = 1:1e6
  if is_both_bases_palindromic(x)
    totsum += x;
  endif
endfor

disp(totsum)  # 872,187