
fn main() {
    println!("{}", get_product()); // 31,875,000
}

fn get_product() -> i64 {
    for a in 1..1000 {
        for b in (a+1)..1000 {
            for c in (b+1)..1000 {
                if (a+b+c == 1000) && (a*a + b*b == c*c) {
                    return a * b * c;
                }
            }
        } 
    }
    return -1;
}