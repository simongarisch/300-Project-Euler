/*
The nth term of the sequence of triangle numbers is given by,
tn = 0.5n(n+1); so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its
alphabetical position and adding these values we form a word value.
For example, the word value for SKY is 19 + 11 + 25 = 55 = t10.
If the word value is a triangle number then we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'),
a 16K text file containing nearly two-thousand common English words,
how many are triangle words?
*/
var path = require("path");
var fs = require("fs");

var dire_path = __dirname;
var file_path = path.join(dire_path, "Ex042", "words.txt");
//console.log(file_path);

try {
  var content = fs.readFileSync(file_path, "utf8");
  content = content.toString();
} catch(e) {
  console.log("Error: ", e.stack);
}
//console.log(content);

content = content.split('"').join('');
var words = content.split(",");
//console.log(words)

// generate some of the triangle numbers
var cumsum = 0;
var tnums = [];
for(var i=1; i<=100; i++){
  cumsum += i;
  tnums.push(cumsum);
}

var alphabet = "abcdefghijklmnopqrstuvwxyz".toUpperCase().split("");
var scores_mapping = {};
for(var i=0; i<alphabet.length; i++){
  scores_mapping[alphabet[i]] = i+1;
}
//console.log(scores_mapping);


function get_word_score(word){
  var word_score = 0;
  for (var i=0; i<word.length; i++){
    word_score += scores_mapping[word.charAt(i)];
  }
  return word_score;
}

function is_triangle_word(word){
  var score = get_word_score(word);
  for(var i=0; i<tnums.length; i++){
    if(tnums[i] == score){
      return true;
    }
  }
  return false;
}

var total_words = 0;
for(var i=0; i<words.length; i++){
  var word = words[i];
  if(is_triangle_word(word)){
    total_words++;
  }
}

console.log(total_words)  // 162
