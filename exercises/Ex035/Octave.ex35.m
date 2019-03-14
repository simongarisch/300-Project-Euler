%{
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
%}

function rotations = digit_rotations(x)
  # returns a vector of results from rotating the digits in x
  xstr = num2str(x);
  xlen = length(xstr);
  rotations = [];
  for i = 1:xlen
    left = substr(xstr, 1, i-1);
    right = substr(xstr, i, xlen-i+1);
    rotation = str2num(strcat(right, left));
    rotations = [rotations, rotation];
  endfor
endfunction
#disp(digit_rotations(197))  # 197   971   719


function retval = all_primes(numvec)
  # returns true if all of the numbers in numvec are prime, false otherwise
  for i=1:length(numvec);
    if !isprime(numvec(i))
      retval = false;
      return;
    endif
  endfor
  retval = true;
endfunction


function retval = is_circular_prime(x)
  # returns true if x is a circular prime, false otherwise
  rotations = digit_rotations(x);
  retval = all_primes(rotations);
endfunction
#disp(is_circular_prime(197))  # 1

counter = 0;
for x=1:(1e6-1)
  if isprime(x)
    if is_circular_prime(x)
      counter += 1;
    endif
  endif
endfor

disp(counter)  # 55
