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

#include <iostream>
#include <cstdlib>
#include <cstring>

#define MAXCHAR 50000

using namespace std;

int file_exists(char *file_path);
void read_file(char *file_path, char *contents);
int get_name_score(char *name);

int compare_function(const void *x, const void *y){
  return(strcmp(*((char**)x),*((char**)y)));
}


int main(){
  char *file_name = (char *)"names.txt";
  char contents[MAXCHAR];
  char contentscopy[MAXCHAR];
  read_file(file_name, contents);

  // find how many names we want to store
  strcpy(contentscopy, contents);
  long namescount = 0;
  char *pch = strtok(contentscopy, ",");
  while (pch != NULL){
    namescount++;
    pch = strtok (NULL, ",");
  }

  // and collect these
  char **names = (char **)malloc(namescount * sizeof(char *));
  strcpy(contentscopy, contents);
  namescount = 0;
  pch = strtok(contentscopy, ",");
  while (pch != NULL){
    names[namescount] = (char *)malloc(sizeof(pch) + 1);
    strcpy(names[namescount], pch);
    namescount++;
    pch = strtok (NULL, ",");
  }

  // sort these names
  qsort(names, namescount, sizeof(char *), compare_function);

  long total_score=0;
  char *name;
  int name_score;
  for(int i=0; i<namescount; i++){
    name = names[i];
    name_score = get_name_score(name);
    total_score = total_score + name_score * (i + 1);
  }
  cout << total_score << endl;  // 871,198,282

  // free our array
  for (int i=0; i<namescount; i++){
    free(names[i]);
  }
  free(names);

  return 0;
}


int get_name_score(char *name){
  char *alphabet = (char *)"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  int name_score = 0;
  for(int i=0; i<strlen(name); i++){
    for(int j=0; j<strlen(alphabet); j++){
      if(name[i] == alphabet[j]){
        name_score += (j + 1);
        break;
      }
    }
  }
  return name_score;
}


int file_exists(char *file_path){
  FILE *file;
  if ((file = fopen(file_path, "r"))){
    fclose(file);
    return 1;
  }
  return 0;
}


void read_file(char *file_path, char *contents){
  FILE *fp;
  char str[MAXCHAR];
  strcpy(contents, "");  // initialize as blank

  fp = fopen(file_path, "r");
  if (fp == NULL){
    printf("Could not open file %s", file_path);
    return;
  }

  while (fgets(str, MAXCHAR, fp) != NULL){
    strcat(contents, str);
  }
  fclose(fp);
}
