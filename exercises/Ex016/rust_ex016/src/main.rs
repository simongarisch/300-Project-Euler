use num::bigint::BigInt;

fn main() {
    let mut result: i64 = 0;
    let mut big_int = BigInt::parse_bytes(b"2", 10).unwrap();
    big_int = big_int.pow(1000);
    for c in big_int.to_string().chars() {
        let i: i64 = c as i64 - 0x30;
        result += i;
    }
    println!("{}", result); // 1,366
}
