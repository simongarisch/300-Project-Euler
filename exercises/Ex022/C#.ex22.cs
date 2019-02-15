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

using System;
using System.Collections;
using System.Collections.Generic;

class Ex22{

  private static char[] alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
  private static Dictionary<string, int> scores_mapping = new Dictionary<string, int>();

  static void Main(){
    string content = System.IO.File.ReadAllText(@"names.txt");
    content = content.Replace("\"", "");
    string[] names = content.Split(',');
    Array.Sort(names);
    /*
    foreach (string name in names){
      Console.WriteLine(name);
    }
    */

    for (int i=0; i<alphabet.Length; i++){
      scores_mapping.Add(alphabet[i].ToString(), i+1);
    }
    //Console.WriteLine(get_name_score("COLIN"));  // 53

    string name;
    int name_score;
    long total_score = 0;
    for(int i=0; i<names.Length; i++){
      name = names[i];
      name_score = get_name_score(name);
      total_score += (i + 1) * name_score;
    }
    Console.WriteLine(total_score);  // 871,198,282
  }

  static int get_name_score(string name){
    int name_score = 0;
    foreach(char c in name){
      name_score += scores_mapping[c.ToString()];
    }
    return name_score;
  }

}
