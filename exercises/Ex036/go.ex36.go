package main

import (
	"fmt"
	"strconv"
)

func reverse(s string) string {
	runes := []rune(s)
	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		runes[i], runes[j] = runes[j], runes[i]
	}
	return string(runes)
}

func isBothBasesPalindromic(x int) bool {
	xstr10 := strconv.Itoa(x)
	xstr02 := strconv.FormatInt(int64(x), 2)
	if xstr10 == reverse(xstr10) {
		if xstr02 == reverse(xstr02) {
			return true
		}
	}
	return false
}

func main() {
	totsum := 0
	for x := 0; x < 1e6; x++ {
		if isBothBasesPalindromic(x) {
			totsum += x
		}
	}
	fmt.Println(totsum) // 872,187
}
