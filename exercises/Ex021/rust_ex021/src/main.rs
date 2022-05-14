
fn sum_divisors(x: i64) -> i64 {
    let mut sum: i64 = 0;
    for i in 1..x {
        if (x % i) == 0 {
            sum += i;
        }
    }
    return sum;
}

fn is_amicable(x: i64) -> bool {
    let sum_divx: i64 = sum_divisors(x);
    if sum_divx == x {
        return false;
    }
    if sum_divisors(sum_divx) == x {
        return true;
    }
    return false;
}

fn main() {
    let mut sum: i64 = 0;
    for x in 1..10_001 {
        if is_amicable(x) {
            sum += x;
        }
    }

    println!("{}", sum); // 31,626
}
