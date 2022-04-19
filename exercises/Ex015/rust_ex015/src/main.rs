
fn main() {
    let size: i128 = 20;
    let mut choices: i128 = 1;
    for i in 1..(size+1) {
        choices *= (2*size) - (size-i);
        choices /= i;
    }

    println!("{}", choices); // 137,846,528,820
}
