%{
2^15= 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
%}

sum = 0;
numstr = num2str(2 ** 1000);

for i = 1:length(numstr)
  sum += str2num(substr(numstr, i, 1));
end

disp(sum)  # 1,366
