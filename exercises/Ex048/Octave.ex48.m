%{
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
pkg install -forge symbolic
%}

pkg load symbolic

START = 1;
STOP = 1000;
vec = vpa(START:STOP);
res = strsplit(char(sum(vec.^vec)), "."){1};

disp(res(end-9:end))