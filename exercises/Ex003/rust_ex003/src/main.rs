
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

fn main() {
    let mut sum: i64 = 0;
    for x in 1..2_000_000 {
        if is_prime(x) {
            sum += x
        }
    }

    println!("{}", sum); // 142,913,828,922
}
