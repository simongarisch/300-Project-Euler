--[[
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
--]]

DIGITS = "123456789"


function isprime(n)
  -- will return true if n is prime, false otherwise
  if n < 2 then
    return false
  end
  if n==2 then
    return true
  end
  for i= 2, math.floor(math.pow(n, 0.5)) do
    if n % i == 0 then
      return false
    end
  end
  return true
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


n = string.len(DIGITS)
largest = 0

while n>=1 and largest==0 do
  digits = string.sub(DIGITS, 1, n)
  numbers = {}
  for i=1, #digits do
    numbers[i] = string.sub(digits, i, i)
  end
  perms = {}
  permgen(numbers, n)
  table.sort(perms, function(a, b) return a > b end)
  for k,v in pairs(perms) do
    --print(v)
    val = tonumber(v)
    if isprime(val) then
      largest = val
      break
    end
  end
  n = n - 1
end

print(largest)  -- 7,652,413
