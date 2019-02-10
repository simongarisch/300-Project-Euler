%{
n! means n * (n - 1) * ... * 3 * 2 * 1

For example, 10! = 10 * 9 * ... * 3 * 2 * 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
%}

sum = 0;
num = 1;
for i=1:100
  num *= i;
end

numstr = num2str(num);

for i = 1:length(numstr)
  sum += str2num(substr(numstr, i, 1));
end

# check the value here
disp(sum)
