
# In England the currency is made up of pound and pence, and there are eight coins in general circulation:
#
# 1p, 2p, 5p, 10p, 20p, 50p, 1 pound (100p) and 2 pound (200p).
# It is possible to make 2 pound in the following way:
#
# 1*1 pound + 1*50p + 2*20p + 1*5p + 1*2p + 3*1p
# How many different ways can 2 pound be made using any number of coins?
#
# NOTES:
# Search between 0-1 two pound coins, 0-2 one pound coins... up to 200 1p coins.
# We can look at the cumulative total of value as we add more coins,
# subject to a 2 pound value cap.

TARGET_VALUE <- 200

count_sum_target <- 0

for(v200 in seq(0, TARGET_VALUE, by=200)){
  for(v100 in seq(v200, TARGET_VALUE, by=100)){
    for(v50 in seq(v100, TARGET_VALUE, by=50)){
      for(v20 in seq(v50, TARGET_VALUE, by=20)){
        for(v10 in seq(v20, TARGET_VALUE, by=10)){
          for(v5 in seq(v10, TARGET_VALUE, by=5)){
            for(v2 in seq(v5, TARGET_VALUE, by=2)){
              for(v1 in seq(v5, TARGET_VALUE, by=1)){
                if(v1 == TARGET_VALUE){
                  count_sum_target = count_sum_target + 1
                }
              }
            }
          }
        }
      }
    }
  }
}

print(count_sum_target)  # 73,682
