%{
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
%}

function retval = is_prime(x)
  # will return true if x is prime, false otherwise
  if(x == 2 || x ==3)
    retval = true;
    return;
  end
  
  for i = 2:x-1
    if mod(x,i) == 0
      retval = false;
      return;
    end
  end
  
  retval = true;
end

largest = NA;           # the largest prime factor
target = 600851475143;  # for a target number

%{
Every composite number has a factor less than or equal
to its square root.
%}
for i = 2:floor(target ^ 0.5)
  if mod(target, i) == 0
    if is_prime(i)
      largest = i;      
    end
  end
end

disp(largest)  # 6,857
