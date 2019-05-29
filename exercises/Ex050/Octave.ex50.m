%{
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
%}
MAXPRIME = 1e6;

primes = (1:MAXPRIME)(find(isprime(1:MAXPRIME)));
primes_cumsum = [0, cumsum(primes)];

primeslen = length(primes);
found = false;
which_prime = 0;
which_len = primeslen;

while !found
  for i = 1:(primeslen - which_len + 1)
    diff = primes_cumsum(i + which_len) - primes_cumsum(i);
    if diff > MAXPRIME
      break;
    endif
    if ismember(diff, primes)
      found = true;
      which_prime = diff;
      break;
    endif
  endfor
  
  if found
    break;
  endif
  
  which_len -= 1;
  if which_len <= 0
    break;
  endif
endwhile

disp(which_prime)  # 997,651