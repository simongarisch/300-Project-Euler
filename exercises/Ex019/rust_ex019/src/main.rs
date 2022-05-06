use chrono::{Datelike, DateTime, Duration, NaiveDate, Utc, Weekday};

fn main() {
    let mut count_sundays: i64 = 0;
    let start_naive_date = NaiveDate::parse_from_str("1901-01-01", "%Y-%m-%d").unwrap();
    let end_naive_date = NaiveDate::parse_from_str("2000-12-31", "%Y-%m-%d").unwrap();

    let mut start_datetime = DateTime::<Utc>::from_utc(start_naive_date.and_hms(0,0,0), Utc);
    let end_datetime = DateTime::<Utc>::from_utc(end_naive_date.and_hms(0,0,0), Utc);
    // println!("{}", start_datetime);
    // println!("{}", end_datetime);

    while start_datetime <= end_datetime {
        if start_datetime.day() == 1 {
            if start_datetime.date().weekday() == Weekday::Sun {
                count_sundays += 1;
            }
        }
        start_datetime = start_datetime + Duration::days(1);
    }

    println!("{}", count_sundays); // 171
}
