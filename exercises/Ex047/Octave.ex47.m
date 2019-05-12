%{
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 * 7
15 = 3 * 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2^2 * 7 * 23
645 = 3 * 5 * 43
646 = 2 * 17 * 19.

Find the first four consecutive integers to have four distinct prime factors each.
What is the first of these numbers?
%}

TARGET_FACTORS = 4;
MAXPRIME = 1e3;

primes = (1:MAXPRIME)(find(isprime(1:MAXPRIME)));

sequence = 0;
n = 0;

while true
   n = n + 1;
   prime_factors = primes(find(mod(n, primes) == 0));
   if length(prime_factors) == TARGET_FACTORS
     multiples = prod(prime_factors) * [1, prime_factors];
     if any(multiples == n)
       sequence += 1;
     else
       sequence = 0;
     endif
   else
     sequence = 0;
   endif
   
   if sequence == TARGET_FACTORS
     break;
   endif   
endwhile

first = n - TARGET_FACTORS + 1;
disp(first)  # 134,043
