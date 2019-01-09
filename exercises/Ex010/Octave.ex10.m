%{
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
%}

sum = 0;
for i = 1:(2000000-1)
  if isprime(i)
    sum += i;
  end
end

disp(sum)  # 142,913,828,922
