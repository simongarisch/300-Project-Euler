%{
  Starting at the top left corner of a 2 x 2 grid, and only being able to move
  to the right and down, there are exactly 6 routes to the bottom right corner.
  How many such routes are there through a 20 x 20 grid?
%}

SIZE = 20;

choices = nchoosek(2*SIZE, SIZE);
disp(choices)  # 137,846,528,820
