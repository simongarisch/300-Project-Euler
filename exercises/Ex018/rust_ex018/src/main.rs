use std::cmp;
use std::fs::File;
use std::io::Read;
use std::path::Path;

fn read_triangle_txt() -> String {
    let mut data = String::new();
    let path = Path::new("..").join("triangle.txt");
    let mut f = File::open(path).expect("Unable to open file triangle.txt");
    f.read_to_string(&mut data).expect("Unable to read triangle.txt");
    return data
}

fn read_triangle_arr() -> Vec<Vec<i64>>{
    let txt = read_triangle_txt();
    let mut arr = Vec::new();
    for row in txt.split("\n") {
        let mut row_arr = Vec::new();
        for num_str in row.split(" ") {
            let num: i64 = num_str.parse().unwrap();
            row_arr.push(num);
        }
        arr.push(row_arr);
    }

    return arr;
}

fn main() {
    let mut triangle = read_triangle_arr();
    // println!("{:?}", triangle);

    let nrows = triangle.len();
    let (mut value, mut godown, mut goright) : (i64, i64, i64);
    for irow in (0..nrows-1).rev() {
        for icol in 0..irow+1 {
            value = triangle[irow][icol];
            godown = value + triangle[irow+1][icol];
            goright = value + triangle[irow+1][icol+1];
            triangle[irow][icol] = cmp::max(godown, goright);
        }
    }

    println!("{}", triangle[0][0]); // 1,074
}
