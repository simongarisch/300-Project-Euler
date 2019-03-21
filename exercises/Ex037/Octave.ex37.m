%{
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
%}

STOP = 11;

function truncatable = istruncatable(n)
  # returns true for primes that are both truncatable
  # from left to right and right to left.
  nstr = num2str(n);
  nlen = length(nstr);
  for i = 1:nlen
    left = substr(nstr, 1, i-1);
    right = substr(nstr, i, nlen-i+1);
    if length(left) != 0
      if !isprime(str2num(left))
        truncatable = false;
        return;
      endif
    endif
    if !isprime(str2num(right))
      truncatable = false;
      return;
    endif
  endfor
  truncatable = true;
endfunction
#istruncatable(3797)  # 1


found = 0;
totsum = 0;
n = 8;
while found < STOP
  if isprime(n)
    if istruncatable(n)
      found += 1;
      totsum += n;
    endif
  endif
  n += 1;
endwhile

disp(totsum)  # 748,317