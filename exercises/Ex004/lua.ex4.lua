--[[
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 * 99.
Find the largest palindrome made from the product of two 3-digit numbers.
--]]

function is_palindromic_number(x)
    -- returns true if x is a palindromic number, false otherwise
    strx = tostring(x)
    if strx == string.reverse(strx) then
      return true
    else
      return false
    end
end

largest = 0
-- go through pairs of three digit numbers
-- these are all numbers from 100 -> 999
for i = 100,999 do
  for j = 100,999 do
    result = i * j
    if is_palindromic_number(result) then
      if result > largest then
        largest = result
      end
    end
  end
end

print(largest)  -- 906609
