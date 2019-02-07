/*
By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route.
However, Problem 67, is the same challenge with a triangle containing one-hundred rows;
it cannot be solved by brute force, and requires a clever method! ;o)
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXCHAR 1000

int file_exists(char *file_path);
void read_file(char *file_path, char *contents);


int main(){
  char *file_name = "triangle.txt";
  char contents[MAXCHAR];
  char contentscopy[MAXCHAR];
  char tempcopy[MAXCHAR];
  read_file(file_name, contents);

  // contents now holds a our data as a string
  strcpy(contentscopy, contents);
  int ncol, nrow = 0;
  for (char *pch = strtok(contentscopy,"\r\n"); pch != NULL; pch = strtok(NULL, "\r\n")){
    nrow++;
  }
  ncol = nrow;
  //printf("%s\n", contents);
  //printf("We have %d rows of data\n", nrow);
  int *arr = (int *)calloc(nrow * ncol, sizeof(int));
  int row=-1;
  strcpy(contentscopy, contents);
  for (char *pch = strtok(contentscopy,"\r\n"); pch != NULL; pch = strtok(NULL, "\r\n")){
    // for each row we can split by blank spaces are read as an int
    //printf("row: %s\n", pch);
    row++;
    strcpy(tempcopy, pch);
    char* token;
    char* rest = tempcopy;
    int col=-1;
    while(token = strtok_r(rest, " ", &rest)){
      col++;
      //printf("%d\n", atoi(token));
      printf("%d row, %d col\n", row, col);
      *(arr + row*ncol + col) = atoi(token);
    }
  }

  // print out the array to check
  /*
  for(int row=0; row<nrow; row++){
    for(int col=0; col<ncol; col++){
      printf("%d ", *(arr + row*ncol + col));
    }
    printf("\n");
  }
  */
  // move up the triangle to calculate maximums
  

  free(arr);
  return 0;
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
  //printf("%d: file exists\n", file_exists(file_path));
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
