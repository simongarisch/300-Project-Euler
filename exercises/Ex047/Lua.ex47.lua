--[[
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 * 7
15 = 3 * 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2^2 * 7 * 23
645 = 3 * 5 * 43
646 = 2 * 17 * 19.

Find the first four consecutive integers to have four distinct prime factors each.
What is the first of these numbers?
--]]

TARGET_FACTORS = 4
MAXPRIME = 1e3


function isprime(x)
  -- will return true if x is prime, false otherwise
  if x < 2 then
    return false
  end
  if x==2 then
    return true
  end
  for i= 2, math.floor(math.pow(x, 0.5)) do
    if x % i == 0 then
      return false
    end
  end
  return true
end


function mult_factors(prime_factors)
  local results = {}
  local result = 1
  -- straight multiplication
  for key,prime in pairs(prime_factors) do
    result = result * prime
  end
  results[#results+1] = result

  -- where we have a ^2
  for key,prime in pairs(prime_factors) do
    results[#results+1] = result * prime
  end
  return results
end


function has_value(tbl, val)
  for k,v in ipairs(tbl) do
    if v == val then
      return true
    end
  end
  return false
end


primes = {}
for i=1,MAXPRIME do
  if isprime(i) then
    primes[#primes+1] = i
  end
end
--for k,v in pairs(primes) do print(v) end


sequence = 0
n = 0
while true do
  n = n + 1
  factors = 0
  prime_factors = {}
  for k,prime in pairs(primes) do
    if n % prime == 0 then
      factors = factors + 1
      prime_factors[#prime_factors+1] = prime
    end
    if prime > n then
      break
    end
  end

  if factors == TARGET_FACTORS then
    multiples = mult_factors(prime_factors)
    if has_value(multiples, n) then
      sequence = sequence + 1
    else
      sequence = 0
    end
  else
    sequence = 0
  end

  if sequence == TARGET_FACTORS then
    break
  end
end

first = n - TARGET_FACTORS + 1
print(first)  -- 134,043
