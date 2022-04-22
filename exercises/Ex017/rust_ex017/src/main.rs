use std::collections::HashMap;


fn main() {
    let num2words: HashMap<i64, &str> = HashMap::from([
        (1, "One"),
        (2, "Two"),
        (3, "Three"),
        (4, "Four"),
        (5, "Five"),
        (6, "Six"),
        (7, "Seven"),
        (8, "Eight"),
        (9, "Nine"),
        (10, "Ten"),
        (11, "Eleven"),
        (12, "Twelve"),
        (13, "Thirteen"),
        (14, "Fourteen"),
        (15, "Fifteen"),
        (16, "Sixteen"),
        (17, "Seventeen"),
        (18, "Eighteen"),
        (19, "Nineteen"),
        (20, "Twenty"),
        (30, "Thirty"),
        (40, "Forty"),
        (50, "Fifty"),
        (60, "Sixty"),
        (70, "Seventy"),
        (80, "Eighty"),
        (90, "Ninety"),
    ]);
    // println!("{:?}", num2words);

    let mut num_chars: i64 = 0;
    for num in 1..1001 {
        let txt: String = get_number_text(num, &num2words).to_string();
        let txt_len: i64 = txt.len() as i64;
        num_chars += txt_len;
        // println!("{} {}", num, txt);
    } 
    println!("{}", num_chars); // 21,124
}

fn char2int(numchar: char) -> i64 {
    return numchar as i64 - 0x30;
}

fn num2words_numchar_lookup<'a>(numchar: char, num2words: &'a HashMap<i64, &str>) -> &'a str {
    return num2words[&char2int(numchar)];
}

fn get_number_text<'a>(num: i64, num2words: &'a HashMap<i64, &str>) -> String {
    let mut numstr: String = num.to_string();
    let mut txt: String = String::new();

    if numstr.len() == 4 { // the thousands
        let first_char: char = numstr.chars().nth(0).unwrap();
        txt += num2words_numchar_lookup(first_char, &num2words);
        txt += "Thousand";
        numstr.remove(0);
        if numstr.eq("000") {
            return txt;
        }
    }

    if numstr.len() == 3 { // the hundreds
        let first_char: char = numstr.chars().nth(0).unwrap();
        txt += num2words_numchar_lookup(first_char, &num2words);
        txt += "Hundred";
        numstr.remove(0);
        if numstr.eq("00") {
            return txt;
        }

        if numstr.len() > 0 {
            txt += "And";
        }
    }

    if numstr.len() == 2 {
        let first_char: char = numstr.chars().nth(0).unwrap();
        let second_char: char = numstr.chars().nth(1).unwrap();
        let first_digit: i64 = char2int(first_char);
        let second_digit: i64 = char2int(second_char);

        if first_digit > 1 {
            txt += num2words[&(first_digit * 10)];
            numstr.remove(0);
        }
        else {
            txt += num2words[&(numstr.parse::<i64>().unwrap())];
            numstr = "".to_string();
        }
        if second_digit == 0 {
            numstr = "".to_string();
        }
    }

    if numstr.len() == 1 {
        txt += num2words_numchar_lookup(numstr.chars().nth(0).unwrap(), &num2words);
    }

    return txt;
}
