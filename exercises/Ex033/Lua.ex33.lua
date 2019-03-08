--[[
The fraction 49/98 is a curious fraction, as an inexperienced mathematician
in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction,
less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
--]]

numerators = {}
denominators = {}
for denominator = 10,99 do
  -- less than one in value, so numerator < denominator
  for numerator = 10,(denominator-1) do
    -- remove non-trivial examples such as 30/50 = 3/5
    trivial_example = false;
    if (numerator % 10) == 0 or (denominator % 10) == 0 then
      trivial_example = true
    end
    if not trivial_example then
      result = numerator / denominator
      numstr = tostring(numerator)
      denstr = tostring(denominator)
      for c in numstr:gmatch"." do
        if string.find(denstr, c) then
          short_num = string.gsub(numerator, c, "", 1)
          short_den = string.gsub(denominator, c, "", 1)
          new_result = tonumber(short_num) / tonumber(short_den)
          if new_result == result then
            numerators[#numerators+1] = numerator
            denominators[#denominators+1] = denominator
            break
          end
        end
      end
    end
  end
end

-- we have the four examples
--for k,v in pairs(numerators) do print(v) end
--for k,v in pairs(denominators) do print(v) end
productnum = 1
productden = 1
for k,v in pairs(numerators) do
  productnum = productnum * v
end
for k,v in pairs(denominators) do
  productden = productden * v
end
minimum_product = math.min(productnum, productden)
for divisor = minimum_product, 2, -1 do
  if productnum % divisor == 0 then
    if productden % divisor == 0 then
      productnum = productnum / divisor
      productden = productden / divisor
      break
    end
  end
end

print(productden)  -- 100
