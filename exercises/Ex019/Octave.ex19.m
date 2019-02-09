%{
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
%}

count_sundays = 0;
start_date = datenum(1901, 1, 1);
end_date = datenum(2000, 12, 31);

dtrange = start_date:end_date;
for dt = dtrange
  [daynum,dayname] = weekday(dt);
  if dayname == "Sun"
    if datestr(dt, "DD") == "01"
      count_sundays += 1;
    endif
  endif
endfor

disp(count_sundays)  # 171