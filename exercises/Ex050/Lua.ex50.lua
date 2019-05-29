--[[
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
--]]
MAXPRIME = 1e6


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


function collect_primes(maxprime)
  local tbl = {};
  for i=1,maxprime do
    if isprime(i) then
      tbl[#tbl+1] = i
    end
  end
  return tbl
end


function hasvalue(tbl, value)
  for k,v in pairs(tbl) do
    if v == value then
      return true
    end
  end
  return false
end


function which_prime()
  -- Which prime, below one-million,
  -- can be written as the sum of the most consecutive primes?
  local primes = collect_primes(MAXPRIME)
  local primes_cumsum = {0}
  local primeslen = #primes

  local total = 0
  for i=1,primeslen do
    total = total + primes[i]
    primes_cumsum[#primes_cumsum + 1] = total
  end

  local found = false
  local which_prime = 0
  local which_len = primeslen

  while not found do
    for i=1,(primeslen - which_len + 1) do
      local diff = primes_cumsum[i+which_len] - primes_cumsum[i]
      if diff > MAXPRIME then
        break
      end
      if hasvalue(primes, diff) then
        found = true
        which_prime = diff
        break
      end
    end
    if found then
      break
    end
    which_len = which_len - 1
    if which_len <= 0 then
      break
    end
  end

  return which_prime
end


print(which_prime())  -- 997,651
