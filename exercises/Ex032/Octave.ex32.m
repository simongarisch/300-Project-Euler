%{
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
%}

function retval = is_pandigital(multiplicand, multiplier, product)
  numbers = strcat(num2str(multiplicand), num2str(multiplier), num2str(product));
  if length(numbers) != 9
    retval = false;
    return;
  end
  numbers = str2num(sort(numbers));
  if numbers == 123456789
    retval = true;
  else
    retval = false;
  end
end
#is_pandigital(39, 186, 7254)  # true

products = [];
for multiplicand = 1:2000
  for multiplier = 1:100
    product = multiplicand * multiplier;
    if is_pandigital(multiplicand, multiplier, product)
      products = [products; product];
    end
  end
end

disp(sum(unique(products)))  # 45,228
