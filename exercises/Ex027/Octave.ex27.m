

function qfresult = quadratic_formula(n, a, b)
  # returns the result of n^2 + a*n + b
  qfresult = n^2 + a*n + b;
end


asearch_range = -999:999;
bsearch_range = -1000:1000;

maxprimes = 0;
product = 0;

for a = asearch_range
  for b = bsearch_range
    n = 0;
    prime = true;
    while prime
      qfresult = quadratic_formula(n, a, b);
      prime = isprime(qfresult);
      if prime
        n += 1;
        if n > maxprimes
          maxprimes = n;
          product = a * b;
        end
      end
    end
  end
end

disp(product)  # -59,231
