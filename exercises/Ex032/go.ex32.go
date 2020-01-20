package main

import (
	"fmt"
	"sort"
	"strconv"
	"strings"
)

func sortString(w string) string {
	s := strings.Split(w, "")
	sort.Strings(s)
	return strings.Join(s, "")
}

// returns true is 1 through 9 pandigital, false otherwise
func isPandigital(multiplicand, multiplier, product int) bool {
	itoa := strconv.Itoa
	numbers := itoa(multiplicand) + itoa(multiplier) + itoa(product)
	numbers = sortString(numbers)

	if numbers == "123456789" {
		return true
	}
	return false
}

func main() {
	//fmt.Println(isPandigital(39, 186, 7254)) // true
	var product int
	products := make(map[int]bool)

	for multiplicand := 1; multiplicand < 1e4; multiplicand++ {
		for multiplier := 1; multiplier < 1e3; multiplier++ {
			product = multiplicand * multiplier
			if isPandigital(multiplicand, multiplier, product) {
				products[product] = true
			}
		}
	}

	productSum := 0
	for product := range products {
		productSum += product
	}

	fmt.Println(productSum) // 45,228
}
