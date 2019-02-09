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

var count_sundays = 0;
var start_date = new Date("1901-1-1");
var end_date = new Date("2000-12-31");

while(start_date <= end_date){
  if(start_date.getDate() == 1){  // first of the month
    if(start_date.getDay() == 0){   // 0-6 starting on Sunday
      count_sundays++;
    }
  }
  start_date.setDate(start_date.getDate() + 1);
}

console.log(count_sundays);  // 171
