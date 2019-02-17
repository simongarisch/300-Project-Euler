--[[
A perfect number is a number for which the sum of its proper divisors is
exactly equal to the number.
For example, the sum of the proper divisors of 28 would be
1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n
and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
the smallest number that can be written as the sum of two abundant numbers is 24.
By mathematical analysis, it can be shown that all integers greater than 28123
can be written as the sum of two abundant numbers. However, this upper limit cannot
be reduced any further by analysis even though it is known that the greatest number
that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
--]]

LIMIT = 28123

function get_table_sum(tbl)
  local table_sum = 0
  for k, v in pairs(tbl) do
    table_sum = table_sum + v
  end
  return table_sum
end


function get_sum_proper_divisors(x)
  -- returns the sum of all proper divisors for x
  local divisors = {}
  if x == 1 then
    return 0
  end
  for i = 1,math.floor(x/2) do
    if x % i == 0 then
      divisors[#divisors+1] = i
    end
  end
  --for k,v in pairs(divisors) do print(v) end
  return get_table_sum(divisors)
end
--print(get_sum_proper_divisors(12))  -- 16

abundant_numbers = {}
for x = 1,LIMIT do
  if get_sum_proper_divisors(x) > x then
    abundant_numbers[#abundant_numbers+1] = x
  end
end
--for k,v in pairs(abundant_numbers) do print(v) end
--print(#abundant_numbers)  -- 6,965


function sum_unique_combinations(tbl)
  -- get all of the unique combination sums (of 2 elements) with replacement
  -- see Lua Sets and Bags: https://www.lua.org/pil/11.5.html
  local combinations = {}
  for k1,v1 in pairs(tbl) do
    for k2,v2 in pairs(tbl) do
      -- indices hold unique sums
      combinations[v1+v2] = true
    end
  end
  return combinations
end


combinations = sum_unique_combinations(abundant_numbers)
sumc = 0
for x = 1,LIMIT do
  -- value is not in index
  if combinations[x] == nil then
    sumc = sumc + x
  end
end

print(sumc)  -- 4,179,871
