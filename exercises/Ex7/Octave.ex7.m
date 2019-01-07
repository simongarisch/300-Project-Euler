%{
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
that the 6th prime is 13.
What is the 10,001st prime number?
%}

number = counter = 0;
while counter < 10001
  number += 1;
  if isprime(number)
    counter += 1;
  end
end

disp(number)  # 104,743
