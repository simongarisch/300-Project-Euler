--[[
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
--]]

function strsplitall(s)
  local t={}
  for i = 1, #s do
    local c = s:sub(i,i)
    table.insert(t, c)
  end
  return t
end
--for k,v in pairs(strsplitall("abcd")) do print(k,v) end
-- {'a', 'b', 'c', 'd'}


function strsort(s)
  local t = strsplitall(s)
  table.sort(t)
  return table.concat(t)
end
--print(strsort("dcba")) -- "abcd"


function pandigital(x, n)
  -- returns pandigital value if ispandigital
  -- 0 otherwise
  local results = {}
  for i=1,n do
    results[#results+1] = tostring(x * i)
  end
  local pnum = tonumber(table.concat(results));
  local concat = strsort(tostring(pnum))
  if concat == "123456789" then
    return pnum
  else
    return 0
  end
end
--print(pandigital(192, 3))  -- 192384576


function maxpandigitaln(x)
  -- check if x is pandigital for any value of n
  -- where n > 1
  -- because we are doing a concat, n < 10
  local pan = 0
  for n=2,10 do
    pan = math.max(pan, pandigital(x, n))
  end
  return pan
end
--print(maxpandigitaln(192))  -- 192384576

x = 98765
maxpan = 0
while x > 0 do
  maxpan = math.max(maxpan, maxpandigitaln(x))
  x = x - 1
end

print(maxpan)  -- 932,718,654
