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
import java.util.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.io.*;


public class JavaEx42{

    private static char[] alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
    private static Map<String, Integer> scores_mapping = new HashMap<String, Integer>();
    private static long[] tnums = new long[100];

    public static void main(String[] args) {
      List<String> stringlist = readFile("words.txt");
      String contents = String.join("", stringlist).replace("\"", "");
      String[] words = contents.split(",");
      Arrays.sort(words);
      //for(int i=0; i<words.length; i++){
      //  System.out.println(words[i]);
      //}

      long cumsum = 0;
      for(int i=1; i<=100; i++){
        cumsum += i;
        tnums[i-1] = cumsum;
      }

      for(int i=0; i<alphabet.length; i++){
        scores_mapping.put(String.valueOf(alphabet[i]), i+1);
      }

      long total_words = 0;
      for(int i=0; i<words.length; i++){
        if(is_triangle_word(words[i])){
          total_words++;
        }
      }

      System.out.println(total_words);  // 162
    }


    public static List<String> readFile(String fileName){
      List<String> lines = Collections.emptyList();
      try{
        lines = Files.readAllLines(Paths.get(fileName), StandardCharsets.UTF_8);
      }catch (IOException e){
        e.printStackTrace();
      }
      return lines;
    }


    static int get_word_score(String word){
      int word_score = 0;
      for(int i=0; i<word.length(); i++){
        word_score += scores_mapping.get(String.valueOf(word.charAt(i)));
      }
      return word_score;
    }


    static boolean is_triangle_word(String word){
      int score = get_word_score(word);
      for(int i=0; i<tnums.length; i++){
        if(score == tnums[i]){
          return true;
        }
      }
      return false;
    }

}
