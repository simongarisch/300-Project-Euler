
fn main() {
    let mut largest: i64 = 0;
    for i in 100..1000 {
        for j in 100..1000 {
            let result: i64 = i * j;
            if is_palindromic_number(result) {
                if result > largest {
                    largest = result;
                }
            } 
        }
    }

    println!("{}", largest); // 906,609
}

fn is_palindromic_number(x: i64) -> bool {
    let xstring: &str = &x.to_string();
    let xstring_reversed: &str = &xstring.chars().rev().collect::<String>();
    return xstring.eq(xstring_reversed)
}
