
fn main() {
    let finish: i64 = 1_000_000;
    let mut longest_chain: i64 = 0;
    let mut starting: i64 = 0;

    for i in 1..finish {
        let mut terms: i64 = 1;
        let mut num: i64 = i;
        while num != 1 {
            if num % 2 == 0 {
                num = num / 2;
            } else {
                num = 3 * num + 1;
            }
            terms += 1;
        }

        if terms > longest_chain {
            longest_chain = terms;
            starting = i;
        }
    }

    println!("{}", starting); // 837,799
}
