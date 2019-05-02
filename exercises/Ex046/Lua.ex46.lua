--[[
A composite number is a positive integer that can be formed by multiplying
two smaller positive integers.
It was proposed by Christian Goldbach that every odd composite number
can be written as the sum of a prime and twice a square.

9 = 7 + 2 * 1^2
15 = 7 + 2 * 2^2
21 = 3 + 2 * 3^2
25 = 7 + 2 * 3^2
27 = 19 + 2 * 2^2
33 = 31 + 2 * 1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as
the sum of a prime and twice a square?
--]]

MAXN = 1e4

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


function generate_odd_compos(n)
  local compos = {}
  for i=2,n do
    for j=2,n do
      local mult = i * j
      if mult % 2 == 1 then
        compos[mult] = mult
      end
    end
  end
  return compos
end


function generate_primes(n)
  local primes = {}
  for i=1,n do
    if isprime(i) then
      primes[#primes+1] = i
    end
  end
  return primes
end


function generate_squares(n)
  local squares = {}
  for i=1,math.floor(n^0.5) do
    squares[#squares+1] = i^2
  end
  return squares
end


function find_smallest(n)
  -- find the smallest odd composite that cannot be written as
  -- the sum of a prime and twice a square
  local compos = generate_odd_compos(n)
  local primes = generate_primes(n)
  local squares = generate_squares(n)
  local search_tbl = {}

  for i=1,#primes do
    for j=1,#squares do
      local comb = primes[i] + 2*squares[j]
      search_tbl[comb] = comb
    end
  end

  local smallest = 0
  for k,compo in pairs(compos) do
    if search_tbl[compo] == nil then
      smallest = compo
      break
    end
  end

  return smallest
end


smallest = find_smallest(MAXN)
print(smallest)  -- 5,777
