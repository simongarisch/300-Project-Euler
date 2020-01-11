package main

import (
	"errors"
	"fmt"
	"strconv"
)

func getNum2Words() map[int]string {
	num2words := map[int]string{
		0:  "Zero",
		1:  "One",
		2:  "Two",
		3:  "Three",
		4:  "Four",
		5:  "Five",
		6:  "Six",
		7:  "Seven",
		8:  "Eight",
		9:  "Nine",
		10: "Ten",
		11: "Eleven",
		12: "Twelve",
		13: "Thirteen",
		14: "Fourteen",
		15: "Fifteen",
		16: "Sixteen",
		17: "Seventeen",
		18: "Eighteen",
		19: "Nineteen",
		20: "Twenty",
		30: "Thirty",
		40: "Forty",
		50: "Fifty",
		60: "Sixty",
		70: "Seventy",
		80: "Eighty",
		90: "Ninety",
	}
	return num2words
}

func stripFirstDigit(num int) (int, string, error) {
	var err error
	numstr := strconv.Itoa(num)
	if len(numstr) == 1 {
		return num, numstr, errors.New("Cannot strip with single digits")
	}

	numstr = numstr[1:]
	num, err = strconv.Atoi(numstr)
	if err != nil {
		return num, numstr, err
	}
	return num, numstr, nil
}

// returns the text representing a given integer (up to 1000)
func getNumberText(num int) (string, error) {
	var err error
	err = nil

	num2words := getNum2Words()
	numstr := strconv.Itoa(num)

	txt := ""

	if len(numstr) == 4 { // get the thousands
		txt += num2words[num/1000]
		txt += "Thousand"
		num, numstr, err = stripFirstDigit(num)
		if err != nil {
			return txt, err
		}
		if numstr == "000" {
			return txt, nil
		}
	}

	if len(numstr) == 3 { // hundreds
		txt += num2words[num/100]
		txt += "Hundred"
		num, numstr, err = stripFirstDigit(num)
		if err != nil {
			return txt, err
		}
		if numstr == "00" {
			return txt, nil
		}
	}

	if len(txt) > 0 {
		txt += "And"
	}

	if len(numstr) == 2 {
		firstDigit := num / 10
		secondDigit := num - firstDigit*10
		if firstDigit > 1 {
			txt += num2words[firstDigit*10]
			num, numstr, err = stripFirstDigit(num)
			if err != nil {
				return txt, err
			}
		} else {
			txt += num2words[num]
			numstr = ""
		}
		if secondDigit == 0 {
			numstr = ""
		}
	}

	if len(numstr) == 1 {
		txt += num2words[num]
	}

	return txt, err
}

func main() {
	//fmt.Println(getNum2Words())
	//fmt.Println(getNumberText(1000)) // OneThousand, nil
	//fmt.Println(getNumberText(1100)) // OneThousandOneHundred <nil>
	//fmt.Println(getNumberText(1119)) // OneThousandOneHundredAndNineteen <nil>
	numChars := 0
	for num := 1; num <= 1e3; num++ {
		txt, err := getNumberText(num)
		if err != nil {
			panic(err)
		}
		numChars += len(txt)
	}
	fmt.Println(numChars) // 21,124
}
