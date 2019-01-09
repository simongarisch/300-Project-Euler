--[[
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
--]]

function is_prime(x)
  -- will return true if x is prime, false otherwise
  if x == 0 or x == 1 then
    return false
  end
  if x==2 then
    return true
  end
  for i=2,math.floor(x^0.5+1) do
    if x % i == 0 then
      return false
    end
  end
  return true
end


sum = 0
for i = 1,(2000000-1) do
  if is_prime(i) then
    sum = sum + i
  end
end

print(sum)  -- 142,913,828,922
