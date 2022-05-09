use num::bigint::BigInt;

fn main() {
    let mut sum: i64 = 0;
    let mut num = BigInt::parse_bytes(b"1", 10).unwrap();
    for i in 1..101 {
        num *= i;
    }

    for c in num.to_string().chars() {
        sum += c as i64 - 0x30;
    }

    println!("{}", sum); // 648
}
