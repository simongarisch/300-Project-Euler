--[[
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
--]]

function is_prime(x)
  -- will return true if x is prime, false otherwise
  if x==2 or x == 3 then
    return true
  end
  for i=2,x-1 do
    if x % i == 0 then
      return false
    end
  end
  return true
end

largest = nil          -- the largest prime factor
target = 600851475143  -- for a target number

--[[
Every composite number has a factor less than or equal
to its square root.
--]]
for i=2,math.floor(target ^ 0.5) do
  if target % i == 0 then
    if is_prime(i) then
      largest = i
    end
  end
end

print(largest)  -- 6,857
