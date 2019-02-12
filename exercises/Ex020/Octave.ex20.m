%{
n! means n * (n - 1) * ... * 3 * 2 * 1

For example, 10! = 10 * 9 * ... * 3 * 2 * 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!

In order to implement big int in Octave we've used
https://au.mathworks.com/matlabcentral/fileexchange/22725-variable-precision-integer-arithmeticss
%}

vpi_path = strcat(fileparts(mfilename('fullpath')), "/VariablePrecisionIntegers")
addpath(genpath(vpi_path))
sum = 0;
num = vpi(1);
for i=1:100
  num *= i;
end

numstr = strtrim(num2str(num));

for i = 1:length(numstr)
  column = str2num(substr(numstr, i, 1));
  for j = 1:length(column)
    sum += column(j);
  end
end

disp(sum)  # 648
