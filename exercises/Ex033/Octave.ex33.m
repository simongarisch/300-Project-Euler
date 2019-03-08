%{
The fraction 49/98 is a curious fraction, as an inexperienced mathematician
in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction,
less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
%}

numerators = [];
denominators = [];
for denominator = 10:99
  for numerator = 10:(denominator-1)
    if mod(numerator,10) == 0 || mod(denominator,10) == 0
      continue;
    end
    result = numerator / denominator;
    denstr = num2str(denominator);
    numstr = num2str(numerator);
    for i = 1:length(numstr)
      c = numstr(i);
      idx = strfind(denstr, c);
      if !isempty(idx)
        short_num = numstr;
        short_num(i) = "";
        short_den = denstr;
        short_den(idx(1)) = "";
        if short_den == "0"
          continue;
        end
        new_result = str2num(short_num) / str2num(short_den);
        if new_result == result
          numerators = [numerators; numerator];
          denominators = [denominators; denominator];
          break;
        end
      end
    end
  end
end

# we have the four examples
#numerators    # 16, 26, 19, 49
#denominators  # 64, 65, 95, 98
productnum = prod(numerators);
productden = prod(denominators);
minimum_product = min(productnum, productden);
for divisor = minimum_product:-1:2
  if mod(productnum, divisor) == 0
    if mod(productden, divisor) == 0
      productnum /= divisor;
      productden /= divisor;
    end
  end
end

disp(productden)  # 100
