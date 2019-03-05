--[[
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
--]]

function is_pandigital(multiplicand, multiplier, product)
  numbers = tostring(multiplicand) .. tostring(multiplier) .. tostring(product)

  tbl = {}
  for i = 1, string.len(numbers) do
    tbl[i] = string.sub(numbers, i, i)
  end
  numbers = table.sort(tbl)

  if #tbl ~= 9 then
    return false
  end

  -- key 1 should have a value of 1
  -- key 9 should have a value of 9 ...
  ordered = true
  for k,v in pairs(tbl) do
    --print(k, v)
    if tostring(k) ~= v then
      ordered = false
      break
    end
  end
  return ordered
end
--print(is_pandigital(39, 186, 7254))  -- true

tblset = {}
for multiplicand = 1,10000 do
  for multiplier = 1, 100 do
    product = multiplicand * multiplier
    if is_pandigital(multiplicand, multiplier, product) then
      tblset[product] = true
    end
  end
end

-- now sum all of the products
productsum = 0
for k,v in pairs(tblset) do
  productsum = productsum + k
end

print(productsum)  -- 45,228
