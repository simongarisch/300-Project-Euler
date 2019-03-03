'''
In England the currency is made up of pound and pence, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, 1 pound (100p) and 2 pound (200p).
It is possible to make 2 pound in the following way:

1*1 pound + 1*50p + 2*20p + 1*5p + 1*2p + 3*1p
How many different ways can 2 pound be made using any number of coins?

NOTES:
We could just use one 200p coin or 200 1p coins
200p don't search for more than 1 coin
100p don't search for more than 2 coins
50p don't search for more than 4 coins ...
'''
import itertools

coins_list = [1, 2, 5, 10, 20, 50, 100]
max_coins = [200 / i for i in coins_list]
#print(dict(zip(coins_list, max_coins)))
count_sum_200 = 0  # keep track of the coin combinations that sum to 200p

# this below is far too slow, so don't use brute force in this way
for ncoins in range(1, 201):
    print(ncoins)
    combinations = itertools.combinations_with_replacement(coins_list, ncoins)
    for combination in combinations:
        coin_sum = sum(combination)
        if coin_sum == 200:
            #print(ncoins, combination, coin_sum)
            count_sum_200 += 1

print(count_sum_200)  #
