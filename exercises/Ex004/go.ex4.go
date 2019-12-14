package main

import (
	"fmt"
	"strconv"
)

func reverse(s string) string {
	chars := []rune(s)
	for i, j := 0, len(chars)-1; i < j; i, j = i+1, j-1 {
		chars[i], chars[j] = chars[j], chars[i]
	}
	return string(chars)
}

func isPalindromicNumber(x int) bool {
	var s string = strconv.Itoa(x)
	if s == reverse(s) {
		return true
	}
	return false
}

func main() {

	var largest int = 0
	for i := 100; i < 1000; i++ {
		for j := 100; j < 1000; j++ {
			var result int = i * j
			if isPalindromicNumber(result) {
				if result > largest {
					largest = result
				}
			}
		}
	}
	fmt.Println(largest) // 906609
}
