--[[
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
--]]
DIGITS = "0123456789"


function has_property(n)
  -- returns True if n has the properties defined for problem, False otherwise
  local nstr = tostring(n)
  local tbl = {}
  for i=1, string.len(nstr) do
    tbl[#tbl+1] = string.sub(nstr, i, i)
  end

  if #tbl ~= 10 then
    -- we need all of the numbers from 0-9
    return false
  end

  if tonumber(tbl[2] .. tbl[3] .. tbl[4]) % 2 ~= 0 then
    return false
  end
  if tonumber(tbl[3] .. tbl[4] .. tbl[5]) % 3 ~= 0 then
    return false
  end
  if tonumber(tbl[4] .. tbl[5] .. tbl[6]) % 5 ~= 0 then
    return false
  end
  if tonumber(tbl[5] .. tbl[6] .. tbl[7]) % 7 ~= 0 then
    return false
  end
  if tonumber(tbl[6] .. tbl[7] .. tbl[8]) % 11 ~= 0 then
    return false
  end
  if tonumber(tbl[7] .. tbl[8] .. tbl[9]) % 13 ~= 0 then
    return false
  end
  if tonumber(tbl[8] .. tbl[9] .. tbl[10]) % 17 ~= 0 then
    return false
  end
  return true
end
--print(has_property(1406357289))  -- true


function collect_characters(tbl)
  -- concatenate and return the characters from a given table
  -- for example, {'1', '2', '3'} -> '123'
  local numstr = ""
  for k,v in pairs(tbl) do
    numstr = numstr .. tostring(v)
  end
  return numstr
end


function permgen(a, n)
  -- collect permutations from a given table a
  -- this is borrowed from https://www.lua.org/pil/9.3.html
  if n == 0 then
    perms[#perms+1] = tonumber(collect_characters(a))
  end
  for i=1,n do
    -- put i-th element as the last one
    a[n], a[i] = a[i], a[n]

    -- generate all permutations of the other elements
    permgen(a, n - 1)

    -- restore i-th element
    a[n], a[i] = a[i], a[n]
  end
end


sumpan = 0
numbers = {}
for i=1, #DIGITS do
  numbers[i] = string.sub(DIGITS, i, i)
end
perms = {}
permgen(numbers, #numbers)
for k,v in pairs(perms) do
  if has_property(v) then
    sumpan = sumpan + v
  end
end

print(sumpan)  -- 16,695,334,890
