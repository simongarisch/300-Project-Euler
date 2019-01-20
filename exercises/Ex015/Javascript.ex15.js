/*
Starting at the top left corner of a 2 x 2 grid, and only being able to move
to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20 x 20 grid?
*/

const math = require('mathjs')

var SIZE = 20;

var choices = math.combinations(2*SIZE, SIZE);

console.log(choices);  // 137,846,528,820
