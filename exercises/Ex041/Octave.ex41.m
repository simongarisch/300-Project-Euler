%{
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
%}

DIGITS = "123456789";

n = length(DIGITS);
largest = 0;

while n>=1 && largest==0
  digits = substr(DIGITS, 1, n);
  p = str2num(perms(digits));
  check_primes = isprime(p);
  allprimes = p(check_primes);
  if length(allprimes) > 0
    largest = allprimes(1);
  endif
  n -= 1;
endwhile

disp(largest)  # 7,652,413
