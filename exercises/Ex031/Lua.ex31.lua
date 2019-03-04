--[[
In England the currency is made up of pound and pence, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, 1 pound (100p) and 2 pound (200p).
It is possible to make 2 pound in the following way:

1*1 pound + 1*50p + 2*20p + 1*5p + 1*2p + 3*1p
How many different ways can 2 pound be made using any number of coins?

NOTES:
Search between 0-1 two pound coins, 0-2 one pound coins... up to 200 1p coins.
We can look at the cumulative total of value as we add more coins,
subject to a 2 pound value cap.
--]]
TARGET_VALUE = 200

count_sum_target = 0

for v200 = 0,TARGET_VALUE,200 do
  for v100 = v200,TARGET_VALUE,100 do
    for v50 = v100,TARGET_VALUE,50 do
      for v20 = v50,TARGET_VALUE,20 do
        for v10 = v20,TARGET_VALUE,10 do
          for v5 = v10,TARGET_VALUE,5 do
            for v2 = v5,TARGET_VALUE,2 do
              for v1 = v2,TARGET_VALUE do
                if v1 == TARGET_VALUE then
                  count_sum_target = count_sum_target + 1
                end
              end
            end
          end
        end
      end
    end
  end
end

print(count_sum_target)  -- 73,682
