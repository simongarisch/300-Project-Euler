--[[
A permutation is an ordered arrangement of objects.
For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
If all of the permutations are listed numerically or alphabetically,
we call it lexicographic order.
The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits
0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
--]]

function factorial(x)
  -- return the factorial of a positive integer x
  if x == 1 then
    return 1
  else
    return x * factorial(x-1)
  end
end


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


numbers = {}
perms = {}
numcount = 0
for i = 0, 9 do
  numcount = numcount + 1
  numbers[#numbers+1] = tostring(i)
end
--for k,v in pairs(numbers) do print(k,v) end

permgen(numbers, numcount)
table.sort(perms, function(a, b) return a < b end)

--[[
permscount = 0
for k,v in pairs(perms) do permscount = permscount + 1 end
print("Expecting", factorial(numcount), "permutations")
print("Collected", permscount, "permutations")
print("------------")
count = 0
for k,v in pairs(perms) do
  print(v)
  count = count + 1
  if count > 10 then
    break
  end
end
print("------------")
--]]
print(perms[1e6])  -- 2,783,915,460
