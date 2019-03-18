--[[
The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
--]]

function tobin(x)
  local t = {}
  while x > 0 do
    rem = x % 2
    t[#t+1] = rem
    x = (x - rem) / 2
  end
  return table.concat(t)
end
--print(tobin(585)) -- 1001001001


function is_both_bases_palindromic(x)
  -- returns true if x is palindromic in base 10 and base 2, false otherwise.
  local xstr10 = tostring(x)
  local xstr2 = tobin(x)
  if xstr10 == string.reverse(xstr10) then
    if xstr2 == string.reverse(xstr2) then
      return true
    end
  end
  return false
end
--print(is_both_bases_palindromic(585))  -- true


totsum = 0
for x = 1,1e6 do
  if is_both_bases_palindromic(x) then
    totsum = totsum + x
  end
end

print(totsum)  -- 872,187
