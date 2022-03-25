
fn main() {
    let mut number: i64 = 0;
    let mut counter: i64 = 0;

    while counter < 10_001 {
        number += 1;
        if is_prime(number) {
            counter += 1;
        }
    }

    println!("{}", number); // 104,743
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
