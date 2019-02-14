/*
Using names.txt (right click and 'Save Link/Target As...'),
a 46K text file containing over five-thousand first names,
begin by sorting it into alphabetical order.

Then working out the alphabetical value for each name,
multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order,
COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
So, COLIN would obtain a score of 938 * 53 = 49714.

What is the total of all the name scores in the file?
*/

var path = require("path");
var fs = require("fs");

var dire_path = __dirname;
var file_path = path.join(dire_path, "Ex022", "names.txt");
//console.log(file_path);

try {
  var content = fs.readFileSync(file_path, "utf8");
  content = content.toString();
} catch(e) {
    console.log("Error: ", e.stack);
}
//console.log(content);

var names = content.split(",").sort();
//console.log(names);

var alphabet = "abcdefghijklmnopqrstuvwxyz".toUpperCase().split("");
var scores_mapping = {};
for(var i=0; i<alphabet.length; i++){
  scores_mapping[alphabet[i]] = i+1;
}
//console.log(scores_mapping);


function get_name_score(name){
  var name_score = 0;
  for (var i=0; i<name.length; i++){
    name_score += scores_mapping[name.charAt(i)];
  }
  return name_score;
}
//console.log(get_name_score("COLIN"));  // 53

var total_score = 0;
var counter = 0;
for(var i=0; i<names.length; i++){
  counter++;
  var name = names[i].replace(/"/g, '');
  var name_score = get_name_score(name);
  total_score += (counter * name_score);
}
console.log(total_score);  // 871,198,282
