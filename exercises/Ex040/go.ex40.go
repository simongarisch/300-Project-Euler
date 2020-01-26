package main

import (
	"fmt"
	"strconv"
)

func main() {
	num := 0
	digitCounter := 0
	mult := 1
	result := 1

	for {
		if mult > 1e6 {
			break
		}
		found := false
		for {
			if found {
				break
			}
			num++
			numstr := strconv.Itoa(num)
			for _, char := range numstr {
				schar := string(char)
				digit, _ := strconv.Atoi(schar)
				digitCounter++
				if mult == digitCounter {
					result *= digit
					found = true
				}
			}
		}
		mult *= 10
	}

	fmt.Println(result) // 210
}
