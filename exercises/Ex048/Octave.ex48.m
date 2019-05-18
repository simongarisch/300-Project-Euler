%{
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
%}
START = 1;
STOP = 1000;

function retval = powerof(n)
  retval = n;
  for i = 2:n
    retval *= n;
    # only keep the last digits
    retval = mod(retval, 1e12);
  endfor
endfunction

x = START:STOP;
powers = arrayfun(@(x) powerof(x), x);
res = num2str(sum(powers))(end-9:end);

disp(res)  # 9,110,846,700
