%{
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
%}

function pnum = pandigital(x, n)
  # returns pandigital value if ispandigital
  # 0 otherwise
  result = "";
  for i = 1:n
    result = strcat(result, num2str(x * i));
  endfor
  pnum = str2num(result);
  concat = sort(result);
  if strcmp(concat, "123456789")
    return;
  else  
    pnum = 0;
  endif
endfunction
#pandigital(192, 3)  # 192384576


function pnum = maxpandigitaln(x)
  # check if x is pandigital for any value of n
  # where n > 1
  # because we are doing a concat, n < 10
  pnum = 0;
  for n = 2:10
    pnum = max(pnum, pandigital(x,n));
  endfor
endfunction
#maxpandigitaln(192)  # 192384576


x = 98765;
maxpan = 0;
while x > 0
  maxpan = max(maxpan, maxpandigitaln(x));
  x -= 1;
endwhile

disp(maxpan)