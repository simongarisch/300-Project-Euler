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
import java.util.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.io.*;
import java.text.CharacterIterator;
import java.text.StringCharacterIterator;


public class JavaEx22 {

  private static char[] alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
  private static Map<String, Integer> scores_mapping = new HashMap<String, Integer>();

  public static List<String> readFile(String fileName){
    List<String> lines = Collections.emptyList();
    try{
      lines = Files.readAllLines(Paths.get(fileName), StandardCharsets.UTF_8);
    }catch (IOException e){
      e.printStackTrace();
    }
    return lines;
  }


  public static void main(String[] args){
    List<String> stringlist = readFile("names.txt");
    String contents = String.join("", stringlist).replace("\"", "");;
    //System.out.println(contents);

    String[] names = contents.split(",");
    Arrays.sort(names);
    /*
    for(int i=0; i<names.length; i++){
      System.out.println(names[i]);
    }
    */
    for(int i=0; i<alphabet.length; i++){
      scores_mapping.put(String.valueOf(alphabet[i]), i+1);
    }
    //System.out.println(scores_mapping.values().toString());
    System.out.println(get_name_score("COLIN"));

  }


  static int get_name_score(String name){
    int name_score = 0;
    CharacterIterator it = new StringCharacterIterator(name);
    while(it.current() != CharacterIterator.DONE){
      System.out.println(it.current());
      name_score += scores_mapping.get(it.current());
    }
    return name_score;
  }

}
