--[[
The arithmetic sequence, 1487, 4817, 8147,
in which each of the terms increases by 3330, is unusual in two ways:
(i) each of the three terms are prime, and,
(ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
--]]

START = 1488  -- look for the next one
STOP = 1e4
INCREMENT = 3330


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


function strsplitall(s)
  local t={}
  for i = 1, #s do
    local c = s:sub(i,i)
    table.insert(t, c)
  end
  return t
end


function strsort(s)
  local t = strsplitall(s)
  table.sort(t)
  return table.concat(t)
end


function ispermutation(a, b)
  return strsort(tostring(a)) == strsort(tostring(b))
end


function primeperms()
  local primes = {}
  for i=START,STOP do
    if isprime(i) then
      primes[#primes+1] = i
    end
  end

  local numprimes = #primes
  for idx1=1,numprimes do
    local prime1 = primes[idx1]
    for idx2=(idx1+1),numprimes do
      local prime2 = primes[idx2]
      for idx3=(idx2+1),numprimes do
        local prime3 = primes[idx3]
        -- check for a constant increment
        if prime1 + INCREMENT == prime2 then
          if prime2 + INCREMENT == prime3 then
            -- and those that are permutations
            if ispermutation(prime1, prime2) then
              if ispermutation(prime2, prime3) then
                local primestr1 = tostring(prime1)
                local primestr2 = tostring(prime2)
                local primestr3 = tostring(prime3)
                return tonumber(primestr1 .. primestr2 .. primestr3)
              end
            end
          end
        end
      end
    end
  end
end


print(primeperms())  -- 296,962,999,629
