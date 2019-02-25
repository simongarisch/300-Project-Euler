
function is_prime(x)
  -- returns true if x is prime, false otherwise
  if x <= 1 then
    return false
  end
  if x == 2 then
    return true
  end
  for i = 3,(x-1) do
    if x % i == 0 then
      return false
    end
  end
  return true
end


function quadratic_formula(n, a, b)
  -- returns the result of n^2 + a*n + b
  return n^2 + a*n + b
end


maxprimes = 0
product = 0
for a = -999,999 do
  for b = -1000,1000 do
    n = 0
    isprime = true
    while isprime do
      qfresult = quadratic_formula(n, a, b)
      isprime = is_prime(qfresult)
      if isprime then
        n = n + 1
        if n > maxprimes then
          maxprimes = n
          product = a * b
        end
      end
    end
  end
end

print(product)  -- -59,231
