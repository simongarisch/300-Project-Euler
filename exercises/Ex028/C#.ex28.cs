
using System;

class Ex28{

  static void Main(){
    Console.WriteLine(get_diagsum(1001));  // 669,171,001
  }

  static long get_diagsum(long rows){
    // get the diagonal sum for a given number of layers
    long layers = (rows + 1) / 2;
    long diagsum = 1;
    long layerend_value = 1;
    long layer = 1;
    long numbers_in_layer;
    long diag_steps, top_right, top_left, bot_left, bot_right;

    while(layer <= layers){
      numbers_in_layer = ((layer-1) * 2 - 1) * 4 + 4;
      layerend_value += numbers_in_layer;  // 1, 9, 25, ...
      diag_steps = (layer * 2) - 2;        // 0, 2, 4, ...
      top_right = layerend_value;                   // 1, 9, 25, ...
      top_left = layerend_value - diag_steps;       // 1, 7, 21, ...
      bot_left = layerend_value - diag_steps * 2;   // 1, 5, 17, ...
      bot_right = layerend_value - diag_steps * 3;  // 1, 3, 13
      diagsum += (top_right + top_left + bot_left + bot_right);
      layer += 1;
    }
    // remove the 1 at the middle of the spiral which we have added 4 times
    return diagsum - 4;
  }

}
