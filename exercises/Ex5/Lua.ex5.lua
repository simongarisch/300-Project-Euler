--[[
2520 is the smallest number that can be divided by each of the numbers
from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of
the numbers from 1 to 20?
--]]

function is_divisible_to_20(x)
  -- returns true if x is evenly divisible by all of the
  -- numbers from 1 to 20, false otherwise.
  for i = 1, 20 do
    if x % i ~= 0 then
      return false
    end
  end
  return true
end


counter = 1
while not is_divisible_to_20(counter) do
  counter = counter + 1
end

print(counter)  -- 232,792,560
