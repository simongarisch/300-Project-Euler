
sum = 0;

for i = 1:999
  if(mod(i,3) == 0 || mod(i,5) == 0)
    sum += i;
  end
end

disp(sum) # 233,168