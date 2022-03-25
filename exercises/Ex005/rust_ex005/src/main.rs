
fn main() {
    let mut x: i64 = 1;
    while !is_divisible_to_20(x) {
        x += 1;
    }
    println!("{}", x); // 232,792,560
}

fn is_divisible_to_20(x: i64) -> bool {
    for i in 1..21 {
        if x % i != 0 {
            return false
        }
    }
    return true
}

