package main

import (
	"fmt"
	"strconv"
	"strings"
)

func getExamples() ([][]int, error) {
	var examples [][]int

	for denominator := 10; denominator < 100; denominator++ {
		for numerator := 10; numerator < denominator; numerator++ {
			if (numerator%10) == 0 || (denominator%10) == 0 {
				continue
			}

			result := float64(numerator) / float64(denominator)
			denstr := strconv.Itoa(denominator)
			numstr := strconv.Itoa(numerator)

			for _, char := range numstr {
				schar := string(char)
				if strings.Contains(denstr, schar) {
					shortNum := strings.Replace(numstr, schar, "", 1)
					shortDen := strings.Replace(denstr, schar, "", 1)
					if strings.Compare(shortDen, "0") == 0 {
						continue // avoid a zero division error
					}

					shortNumInt, err := strconv.Atoi(shortNum)
					if err != nil {
						return examples, err
					}

					shortDenInt, err := strconv.Atoi(shortDen)
					if err != nil {
						return examples, err
					}

					newResult := float64(shortNumInt) / float64(shortDenInt)
					if newResult == result {
						examples = append(examples, []int{numerator, denominator})
					}
				}
			}

		}
	}

	return examples, nil
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func main() {
	//fmt.Println(getExamples()) // [[16 64] [26 65] [19 95] [49 98]] <nil>

	examples, err := getExamples()
	if err != nil {
		panic(err)
	}

	productnum := 1
	productden := 1
	for _, example := range examples {
		productnum *= example[0]
		productden *= example[1]
	}
	//fmt.Println(productnum, productden) // 387296 38729600
	minimumProduct := min(productnum, productden)
	for divisor := minimumProduct; divisor > 1; divisor-- {
		if productnum%divisor == 0 {
			if productden%divisor == 0 {
				productnum /= divisor
				productden /= divisor
				break
			}
		}
	}

	fmt.Println(productden) // 100
}
