
fn main() {
    let mut sum: i64 = 0;
    for i in 1..2_000_000 {
        if is_prime(i) {
            sum += i;
        }
    }
    println!("{}", sum); // 142,913,828,922
}

fn is_prime(x: i64) -> bool {
    if x == 0 || x == 1 {
        return false;
    }
    for i in 2..((x as f64).sqrt() as i64 + 1) {
        if x % i == 0 {
            return false;
        }
    }
    return true;
}
