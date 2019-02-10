/*
You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
*/
#define _XOPEN_SOURCE 700  // otherwise it grumbles about strptime
#include <iostream>
#include <time.h>

using namespace std;

int main(){
  int count_sundays = 0;
  struct tm tm_start = {0};
  struct tm tm_end = {0};

  char *s;
  s = strptime("1 Jan 1901", "%d %b %Y", &tm_start);
  if (s == NULL) {
    printf("Cannot parse start date");
    return 1;
  }

  s = strptime("31 Dec 2000", "%d %b %Y", &tm_end);
  if (s == NULL) {
    printf("Cannot parse end date");
    return 1;
  }

  time_t start, end;
  double diff = 1;
  while(diff != 0){
    tm_start.tm_mday += 1;
    start = mktime(&tm_start);
    end = mktime(&tm_end);
    diff = difftime(start, end);
    if(tm_start.tm_wday == 0){    // we are on a Sunday
      if(tm_start.tm_mday == 1){  // first of the month
        count_sundays++;
      }
    }
  }

  cout << count_sundays << endl;  // 171
}
