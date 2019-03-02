--[[
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
--]]
POWER = 5;
ubound = POWER * 9 ^ POWER;

function digit_powers_equal(num, power)
  sum_digit_powers = 0
  numstr = tostring(num)
  for i = 1, string.len(numstr) do
    increment = tonumber(string.sub(numstr, i, i)) ^ power
    sum_digit_powers = sum_digit_powers + increment
  end
  return num == sum_digit_powers
end
--print(digit_powers_equal(1634, 4))  -- true

total = 0
num = 2
while num <= ubound do
  if digit_powers_equal(num, POWER) then
    total = total + num
  end
  num = num + 1
end
print(total)  -- 443,839
