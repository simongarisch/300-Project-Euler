%{
A composite number is a positive integer that can be formed by multiplying
two smaller positive integers.
It was proposed by Christian Goldbach that every odd composite number
can be written as the sum of a prime and twice a square.

9 = 7 + 2 * 1^2
15 = 7 + 2 * 2^2
21 = 3 + 2 * 3^2
25 = 7 + 2 * 3^2
27 = 19 + 2 * 2^2
33 = 31 + 2 * 1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as
the sum of a prime and twice a square?
%}

MAXN = 1e4;

# collect the composite numbers
rng = 2:MAXN;
[x, y] = meshgrid(rng, rng);
prod = unique(x .* y);
compos = prod(find(mod(prod,2)==1));

# collect the primes and squares
rng = 1:MAXN;
primes = rng(find(isprime(rng)));
small_rng = 1:(floor(MAXN^0.5));
squares = small_rng .* small_rng;

# find the smallest composite number
# that cannot be written as the sum of a prime and twice a square
[x, y] = meshgrid(primes, 2*squares);
search_vec = unique(x + y);

members = ismember(compos, search_vec);
not_members = find(members == 0);
smallest = compos(not_members(1));

disp(smallest)  # 5,777