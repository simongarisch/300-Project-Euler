%{
2520 is the smallest number that can be divided by each of the numbers
from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of
the numbers from 1 to 20?
%}

counter = 0;

while(true)
  counter += 1;
  solution = true;
  
  for i = 2:20
    if mod(counter, i) != 0
      solution = false;
      break;
    end
  end
  
  if solution
    break;    
  end
end

disp(counter)  # 232,792,560
