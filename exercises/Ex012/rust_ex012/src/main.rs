
fn main() {
    let target_factors: i64 = 500;
    let mut triangle_number: i64 = 1;
    let mut num_factors: i64 = 1;
    let mut counter: i64 = 1;
    
    while num_factors < target_factors {
        counter += 1;
        triangle_number += counter;
        num_factors = 2; // divisible by itself and one
        for i in 2..((triangle_number as f64).sqrt() as i64 + 1) {
            if triangle_number % i == 0 {
                if (i * i) == triangle_number {
                    num_factors += 1;
                } else {
                    num_factors += 2;
                }
            }
        } 
    }

    println!("{}", triangle_number); // 76,576,500
}
