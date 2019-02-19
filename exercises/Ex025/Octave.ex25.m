%{
The Fibonacci sequence is defined by the recurrence relation:
F(n) = F(n-1) + F(n-2), where F(1) = 1 and F(2) = 1

Hence the first 12 terms will be:

F1 = 1
F2 = 1
F3 = 2
F4 = 3
F5 = 5
F6 = 8
F7 = 13
F8 = 21
F9 = 34
F10 = 55
F11 = 89
F12 = 144
The 12th term, F12, is the first term to contain three digits.

What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
%}

fibindex = 3;
fib1 = 1;
fib2 = 1;
fibvalue = fib1 + fib2;

# rather than use a bigint library in this case we'll
# divide fibvalue by 10 each time it gets sufficiently large
# and track the number of digits removed.
digits_removed = 0;

while (length(num2str(fibvalue)) + digits_removed) < 1000
  fibindex += 1;
  fib1 = fib2;
  fib2 = fibvalue;
  fibvalue = fib1 + fib2;
  if fibvalue > 1e9
    fib1 = floor(fib1 / 10);
    fib2 = floor(fib2 / 10);
    fibvalue = floor(fibvalue / 10);
    digits_removed += 1;
  end
  #fibindex, fibvalue
end

disp(fibindex)  # 4,782
