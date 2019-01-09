%{
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
%}

product = 0;

a = 1:1000;
b = a + 1;
c = b + 1;

for i = a
  for j = b
    for k = c
      if i + j + k == 1000 && i^2 + j^2 == k^2
        product = i * j * k;
        break;
      end
    end
  end
end

disp(product)  # 31,875,000
