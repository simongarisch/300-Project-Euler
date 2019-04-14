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

using System;
using System.Collections;
using System.Collections.Generic;


class Ex42{

  private static char[] alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
  private static Dictionary<string, int> scores_mapping = new Dictionary<string, int>();
  private static long[] tnums = new long[100];

  static void Main(){
    string content = System.IO.File.ReadAllText(@"words.txt");
    content = content.Replace("\"", "");
    string[] words = content.Split(',');
    //for(long i=0; i<words.Length; i++){
    //  Console.WriteLine(words[i]);
    //}
    long cumsum = 0;
    for(int i=1; i<=100; i++){
      cumsum += i;
      tnums[i-1] = cumsum;
    }

    for (int i=0; i<alphabet.Length; i++){
      scores_mapping.Add(alphabet[i].ToString(), i+1);
    }

    long total_words = 0;
    for(long i=0; i<words.Length; i++){
      if(is_triangle_word(words[i])){
        total_words++;
      }
    }

    Console.WriteLine(total_words);  // 162
  }


  static int get_word_score(string word){
    int word_score = 0;
    foreach(char c in word){
      word_score += scores_mapping[c.ToString()];
    }
    return word_score;
  }


  static bool is_triangle_word(string word){
    int score = get_word_score(word);
    for(int i=0; i<tnums.Length; i++){
      if(score == tnums[i]){
        return true;
      }
    }
    return false;
  }

}
