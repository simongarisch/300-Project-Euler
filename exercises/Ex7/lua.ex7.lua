--[[
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
that the 6th prime is 13.
What is the 10,001st prime number?
--]]

function is_prime(x)
  -- will return true if x is prime, false otherwise
  if x == 0 or x == 1 then
    return false
  end
  if x==2 then
    return true
  end
  for i=2,x-1 do
    if x % i == 0 then
      return false
    end
  end
  return true
end


number, counter = 0, 0
while counter < 10001 do
  number = number + 1
  if is_prime(number) then
    counter = counter + 1
  end
end

print(number)  -- 104,743
