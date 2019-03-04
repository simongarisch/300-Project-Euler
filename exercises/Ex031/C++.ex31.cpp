/*
In England the currency is made up of pound and pence, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, 1 pound (100p) and 2 pound (200p).
It is possible to make 2 pound in the following way:

1*1 pound + 1*50p + 2*20p + 1*5p + 1*2p + 3*1p
How many different ways can 2 pound be made using any number of coins?

NOTES:
Search between 0-1 two pound coins, 0-2 one pound coins... up to 200 1p coins.
We can look at the cumulative total of value as we add more coins,
subject to a 2 pound value cap.
*/

#include <iostream>

#define TARGET_VALUE 200

using namespace std;

int main(){
  long count_sum_target = 0;

  for(int v200=0; v200<=TARGET_VALUE; v200=v200+200){
    for(int v100=v200; v100<=TARGET_VALUE; v100=v100+100){
      for(int v50=v100; v50<=TARGET_VALUE; v50=v50+50){
        for(int v20=v50; v20<=TARGET_VALUE; v20=v20+20){
          for(int v10=v20; v10<=TARGET_VALUE; v10=v10+10){
            for(int v5=v10; v5<=TARGET_VALUE; v5=v5+5){
              for(int v2=v5; v2<=TARGET_VALUE; v2=v2+2){
                for(int v1=v2; v1<=TARGET_VALUE; v1++){
                  if(v1 == TARGET_VALUE){
                    count_sum_target++;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  cout << count_sum_target << endl;  // 73,682
  return 0;
}
