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
import java.time.LocalDate;
import java.time.DayOfWeek;


public class JavaEx19 {

    public static void main(String[] args) {
      int count_sundays = 0;
      LocalDate start_date = LocalDate.parse("1901-01-01");
      LocalDate end_date = LocalDate.parse("2000-12-31");

      while(start_date.compareTo(end_date) != 0){
        if(start_date.getDayOfWeek() == DayOfWeek.SUNDAY){
          if(start_date.getDayOfMonth() == 1){
            count_sundays++;
          }
        }
        start_date = start_date.plusDays(1);
      }

      System.out.println(count_sundays);  // 171
    }

}
