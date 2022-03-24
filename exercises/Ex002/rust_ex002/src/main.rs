
fn main() {
    let mut fib = vec![1i64, 2];
    let mut sum: i64 = 2;
    let mut next_value: i64  = 0;
    // println!("{:?}", fib);
    // println!("{}", sum);

    while next_value < 4_000_000 {
        let len = fib.len();
        next_value = fib[len-1] + fib[len-2];
        fib.push(next_value);
        if next_value % 2 == 0 {
            sum += next_value
        }
    }

    println!("{}", sum); // 4,613,732
}
