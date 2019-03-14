--[[
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
--]]

function is_prime(x)
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


function digit_rotations(x)
  -- returns a table of results from rotating the digits in x
  local xstr = tostring(x)
  local xlen = string.len(xstr)
  local rotations = {}
  for i = 1, xlen do
    local left = string.sub(xstr, 0, i-1)
    local right = string.sub(xstr, i, xlen)
    local rotation = tonumber(right .. left)
    rotations[#rotations + 1] = rotation
  end
  return rotations
end
--for k,v in pairs(digit_rotations(197)) do print(v) end -- 197, 971, 719


function all_primes(numtbl)
  -- returns true if all of the numbers in numtbl are prime, false otherwise
  for k,v in pairs(numtbl) do
    if not is_prime(v) then
      return false
    end
  end
  return true
end


function is_circular_prime(x)
  -- returns true if x is a circular prime, false otherwise
  local rotations = digit_rotations(x)
  return all_primes(rotations)
end
--print(is_circular_prime(197))  -- true


counter = 0
for x = 1, (1e6-1) do
  if is_prime(x) then
    if is_circular_prime(x) then
      counter = counter + 1
    end
  end
end


print(counter)  -- 55
