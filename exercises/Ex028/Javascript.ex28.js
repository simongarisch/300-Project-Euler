
function get_diagsum(rows){
  // get the diagonal sum for a given number of layers
  var layers = (rows + 1) / 2;
  var diagsum = 1;
  var layerend_value = 1;
  var layer = 1;

  while(layer <= layers){
    var numbers_in_layer = ((layer-1) * 2 - 1) * 4 + 4;
    layerend_value += numbers_in_layer;      // 1, 9, 25, ...
    var diag_steps = (layer * 2) - 2;        // 0, 2, 4, ...
    var top_right = layerend_value;                   // 1, 9, 25, ...
    var top_left = layerend_value - diag_steps;       // 1, 7, 21, ...
    var bot_left = layerend_value - diag_steps * 2;   // 1, 5, 17, ...
    var bot_right = layerend_value - diag_steps * 3;  // 1, 3, 13
    diagsum += (top_right + top_left + bot_left + bot_right);
    layer += 1;
  }
  // remove the 1 at the middle of the spiral which we have added 4 times
  return diagsum - 4;
}

// in a 5 by 5 spiral there are 3 layers with a diagsum of 101
//console.log(get_diagsum(5));  // 101

// for the 1001 by 1001 spiral
console.log(get_diagsum(1001))  // 669,171,001
