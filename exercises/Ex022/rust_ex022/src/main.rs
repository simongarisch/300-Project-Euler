use std::fs::File;
use std::io::Read;
use std::path::Path;

fn get_names_txt() -> String {
    let mut data = String::new();
    let path = Path::new("..").join("names.txt");
    let mut f = File::open(path).expect("Unable to open file names.txt");
    f.read_to_string(&mut data).expect("Unable to read names.txt");
    return data
}


fn get_names_vec() -> Vec<String> {
    let mut txt = get_names_txt();
    txt = str::replace(&txt, "\"", "");
    let mut names: Vec<String> = txt.split(",").map(|s| s.to_string()).collect();
    names.sort();
    return names;
}

fn get_name_score(name: String) -> i64 {
    let name_lower = name.to_lowercase();
    let alphabet: Vec<char> = "abcdefghijklmnopqrstuvwxyz".chars().collect();
    let mut total_score: i64 = 0;
    for name_char in name_lower.chars() {
        let mut score: i64 = 0;
        for (index, alphabet_char) in alphabet.iter().enumerate() {
            if *alphabet_char == name_char {
                score = (index as i64) + 1;
                break;
            }
        }
        total_score += score;
    }

    return total_score;
}

fn get_total_name_score() -> i64 {
    let names = get_names_vec();
    let mut total_score: i64 = 0;
    for (index, name) in names.iter().enumerate() {
        let name_copy: String = name.clone();
        total_score += (get_name_score(name_copy)) * (index as i64 + 1)
    }
    return total_score;
}

fn main() {
    println!("{}", get_total_name_score()); // 871,198,282
}
