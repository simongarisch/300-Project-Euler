%{
If p is the perimeter of a right angle triangle with integral length sides, {a,b,c},
there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p <= 1000, is the number of solutions maximised?
%}

perimeters = zeros(1, 1000);
for a = 1:1000
  for b = (a+1):(1000-a)
    for c = (b+1):(1000-a-b)
      if a^2 + b^2 == c^2
        perimeter = a + b + c;
        perimeters(perimeter) += 1;
      endif
    endfor
  endfor
endfor

maxp = 0;
maxn = 0;
for i = 1:1000
  v = perimeters(i);
  if v > maxn
    maxn = v;
    maxp = i;  
  endif
endfor

disp(maxp)  # 840
