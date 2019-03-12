--[[
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
--]]

function factorial(n)
  if (n == 0) then
    return 1
  else
    return n * factorial(n - 1)
  end
end


function is_curious(x)
  -- returns True if x is equal to the sum its digit factorials, False otherwise
  local sumfact = 0
  local xstr = tostring(x)
  for i=1,string.len(xstr) do
    c = string.sub(xstr, i, i)
    sumfact = sumfact + factorial(tonumber(c))
  end
  if x == sumfact then
    return true
  else
    return false
  end
end
--print(is_curious(145))  -- true


function get_max_digits()
  local digit = 1
  while factorial(9) * digit > (digit - 1) ^ 10 do
    digit = digit + 1
  end
  return digit
end


digits = get_max_digits()
curious_numbers = {}
-- as 1! = 1 and 2! = 2 are not sums they are not included
for x = 3, (10 ^ digits) do
  if is_curious(x) then
    curious_numbers[#curious_numbers+1] = x
  end
end

tblsum = 0
for k,v in pairs(curious_numbers) do
  tblsum = tblsum + v
end

print(tblsum)  -- 40,730
