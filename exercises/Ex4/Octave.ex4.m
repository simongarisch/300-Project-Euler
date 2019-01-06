%{
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 * 99.
Find the largest palindrome made from the product of two 3-digit numbers.
%}

function retval = is_palindromic_number(x)
  # returns true if x is a palindromic number, false otherwise
  strx = num2str(x);
  if(strx == fliplr(strx))
    retval = true;  
  else
    retval = false;
  end
end

largest = 0;
# go through pairs of three digit numbers
# these are all numbers from 100 -> 999

disp(sum) # 233,168
