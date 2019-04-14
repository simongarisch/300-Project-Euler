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

#include <iostream>
#include <cstdlib>
#include <cstring>

#define MAXCHAR 50000
#define MAXTNUMS 100

using namespace std;

int file_exists(const char *file_path);
void read_file(const char *file_path, char *contents);
long get_word_score(char *word);
bool is_triangle_word(char *word, long *tnums);


int compare_function(const void *x, const void *y){
  return(strcmp(*((char**)x),*((char**)y)));
}


int main(){
  const char *file_name = "words.txt";
  char contents[MAXCHAR];
  char contentscopy[MAXCHAR];
  read_file(file_name, contents);

  // find how many words we want to store
  strcpy(contentscopy, contents);
  long wordscount = 0;
  char *pch = strtok(contentscopy, ",");
  while (pch != NULL){
    wordscount++;
    pch = strtok (NULL, ",");
  }

  // and collect these
  char **words = (char **)malloc(wordscount * sizeof(char *));
  strcpy(contentscopy, contents);
  wordscount = 0;
  pch = strtok(contentscopy, ",");
  while (pch != NULL){
    words[wordscount] = (char *)malloc(sizeof(pch) + 1);
    strcpy(words[wordscount], pch);
    wordscount++;
    pch = strtok (NULL, ",");
  }

  // sort these words
  qsort(words, wordscount, sizeof(char *), compare_function);

  // we have all of the words we need.
  // generate some triangle numbers
  long cumsum = 0;
  long tnums[MAXTNUMS];
  for(int i=1; i<=MAXTNUMS; i++){
    cumsum = cumsum + i;
    tnums[i-1] = cumsum;
  }

  long total_words = 0;
  char *word;
  for(long i=0; i<wordscount; i++){
    word = words[i];
    if(is_triangle_word(word, tnums)){
      total_words++;
    }
  }

  cout << total_words << endl;  // 162
  return 0;
}


bool is_triangle_word(char *word, long *tnums){
  long score = get_word_score(word);
  for(int i=0; i<MAXTNUMS; i++){
    if(tnums[i] == score){
      return true;
    }
  }
  return false;
}


long get_word_score(char *word){
  const char *alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  long word_score = 0;
  for(int i=0; i<strlen(word); i++){
    for(int j=0; j<strlen(alphabet); j++){
      if(word[i] == alphabet[j]){
        word_score += (j + 1);
        break;
      }
    }
  }
  return word_score;
}


int file_exists(const char *file_path){
  FILE *file;
  if ((file = fopen(file_path, "r"))){
    fclose(file);
    return 1;
  }
  return 0;
}


void read_file(const char *file_path, char *contents){
  FILE *fp;
  char str[MAXCHAR];
  strcpy(contents, "");  // initialize as blank

  fp = fopen(file_path, "r");
  if (fp == NULL){
    cout << "Could not open file " <<  file_path << endl;
    return;
  }

  while (fgets(str, MAXCHAR, fp) != NULL){
    strcat(contents, str);
  }
  fclose(fp);
}
