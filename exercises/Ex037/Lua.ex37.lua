--[[
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
--]]

STOP = 11

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


function istruncatable(n)
  -- returns true for primes that are both truncatable
  -- from left to right and right to left.
  local nstr = tostring(n)
  local nlen = string.len(nstr)
  for i = 1,nlen do
    local left = string.sub(nstr, 0, i-1)
    local right = string.sub(nstr, i, nlen)
    if string.len(left) ~= 0 then
      if not isprime(tonumber(left)) then
        return false
      end
    end
    if not isprime(tonumber(right)) then
      return false
    end
  end
  return true
end
--print(istruncatable(3797))  -- true


found = 0
totsum = 0
n = 8
while found < STOP do
  if isprime(n) then
    if istruncatable(n) then
      found = found + 1
      totsum = totsum + n
    end
  end
  n = n + 1
end

print(totsum)  -- 748,317
