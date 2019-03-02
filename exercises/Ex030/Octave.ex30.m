%{
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
%}
POWER = 5;
ubound = POWER * 9 ^ POWER;

function isequal = digit_powers_equal(num, power)
  sum_digit_powers = 0;
  numstr = num2str(num);
  for i = 1:length(numstr)
    sum_digit_powers += str2num(substr(numstr, i, 1)) ^ power;
  end
  isequal = num == sum_digit_powers;
end
#disp(digit_powers_equal(1634, 4))  # 1

total = 0;
num = 2;
while num <= ubound
  if digit_powers_equal(num, POWER)
    total += num;
  end
  num += 1;
end
disp(total)  # 443,839
