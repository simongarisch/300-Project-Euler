%{
The arithmetic sequence, 1487, 4817, 8147,
in which each of the terms increases by 3330, is unusual in two ways:
(i) each of the three terms are prime, and,
(ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
%}

START = 1488;  # look for the next one
STOP = 1e4;
INCREMENT = 3330;


function retval = ispermutation(a, b)
  retval = strcmp(sort(num2str(a)), sort(num2str(b)));
endfunction

primes = (START:STOP)(find(isprime(START:STOP)));
numprimes = length(primes);

# the first condition is the increment
cond1 = primes(find(ismember(primes+INCREMENT, primes) & ismember(primes+2*INCREMENT, primes)));
for i = cond1
  if ispermutation(i, i+INCREMENT)
    if ispermutation(i, i+2*INCREMENT)
      p1 = i;
      break;
    endif
  endif
endfor

result = strcat(num2str(p1), num2str(p1+INCREMENT), num2str(p1+2*INCREMENT));
result = str2num(result);
disp(result)  # 296,962,999,629