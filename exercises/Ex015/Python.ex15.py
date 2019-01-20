'''
Starting at the top left corner of a 2 x 2 grid, and only being able to move
to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20 x 20 grid?
'''

'''
We have 2 options: go either right or down, unless at a boundary.
Given that this grid is square, we always need to take an equal number of
moves down as we do right to get from top left to bottom right.
The total moves we need to make are 2 * SIZE.
For these moves there are SIZE right and SIZE down moves.
If we know the spots for our right moves then the down moves are given.
In short, how many ways can we choose SIZE right moves from 2 * SIZE turns.
https://math.stackexchange.com/questions/565228/proof-of-binomial-coefficient-formula
'''

import scipy.special

SIZE = 20

print(scipy.special.binom(2*SIZE, SIZE))  # 137,846,528,820
