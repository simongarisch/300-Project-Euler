
fn main() {
    let mut sum: i64 = 0;
    let mut sum_of_squares: i64 = 0;

    for i in 1..101 {
        sum += i;
        sum_of_squares += i * i;
    }

    let square_of_sum = sum * sum;
    println!("{}", square_of_sum - sum_of_squares); // 25,164,150
}
