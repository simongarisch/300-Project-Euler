use std::collections::HashSet;

fn get_sum_proper_divisors(x: i64) -> i64 {
    let mut divisors: Vec<i64> = Vec::new();
    for i in 1..((x/2) as i64 +1) {
        if x % i == 0 {
            divisors.push(i)
        }
    }

    return divisors.iter().sum()
}

fn main() {
    let limit = 28123;
    let mut abundant_numbers: Vec<i64> = Vec::new();
    for x in 1..(limit+1) {
        if get_sum_proper_divisors(x) > x {
            abundant_numbers.push(x)
        }
    }
    let abundant_numbers_len: i64 = abundant_numbers.len() as i64; 

    let mut combinations: HashSet<i64> = HashSet::new();
    for i in 0..abundant_numbers_len {
        for j in 0..abundant_numbers_len {
            combinations.insert(abundant_numbers[i as usize] + abundant_numbers[j as usize]);
        }
    }

    let mut sumc: i64 = 0;
    for x in 1..limit {
        if combinations.contains(&x) {
            continue
        }
        sumc += x;
    }

    println!("{}", sumc); // 4,179,871
}
