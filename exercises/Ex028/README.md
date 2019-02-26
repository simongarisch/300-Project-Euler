## Project Euler Exercise 28

Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

  --- | --- | --- | --- | ---
  21_ | 22  | 23  | 24  | 25_
  20  | 7_  | 8   | 9_  | 10  
  19  | 6   | 1_  | 2   | 11  
  18  | 5_  | 4   | 3_  | 12  
  17_ | 16  | 15  | 14  | 13_ 

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

NOTES:
- Suppose that we are working with layer x.
- The number of rows for each layer = 1, 3, 5, ... (goes up in twos) <br/>
  This is equal to (x * 2) - 1
- At each layer we have n numbers: 1, 8, 16, ... <br/>
  We can express this as: (rows in previous layer) * 4 + 4 edges <br/>
  e.g.  x=2: 1 * 4 + 4 = 8   =  [(x-1) * 2 - 1] * 4 + 4 <br/>
        x=3: 3 * 4 + 4 = 16  =  [(x-1) * 2 - 1] * 4 + 4
- At each layer the the diagonal numbers go up in steps of layer rows - 1 <br/>
  = (x * 2) - 2 <br/>
  On layer 2 they go up in steps of (2 * 2) - 2 = 2 <br/>
  On layer 3 they go up in steps of (3 * 2) - 2 = 4

```python
def get_diagsum(rows):
    # get the diagonal sum for a given number of layers
    layers = (rows + 1) / 2
    diagsum = 1
    layerend_value = 1
    layer = 1

    while layer <= layers:
        numbers_in_layer = ((layer-1) * 2 - 1) * 4 + 4
        layerend_value += numbers_in_layer  # 1, 9, 25, ...
        diag_steps = (layer * 2) - 2        # 0, 2, 4, ...
        top_right = layerend_value                   # 1, 9, 25, ...
        top_left = layerend_value - diag_steps       # 1, 7, 21, ...
        bot_left = layerend_value - diag_steps * 2   # 1, 5, 17, ...
        bot_right = layerend_value - diag_steps * 3  # 1, 3, 13
        diagsum += (top_right + top_left + bot_left + bot_right)
        layer += 1

    # remove the 1 at the middle of the spiral which we have added 4 times
    return diagsum - 4

# in a 5 by 5 spiral there are 3 layers with a diagsum of 101
#print(get_diagsum(5))  # 101

# for the 1001 by 1001 spiral
print(get_diagsum(1001))  # 669,171,001
```
