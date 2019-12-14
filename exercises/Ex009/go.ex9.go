package main

import "fmt"

func main() {
	var product = 0
	for a := 0; a < 1000; a++ {
		for b := a + 1; b < 1000; b++ {
			for c := b + 1; c < 1000; c++ {
				var isSum1000, isPythag bool
				isSum1000 = (a+b+c == 1000)
				isPythag = (a*a+b*b == c*c)
				if isSum1000 && isPythag {
					product = a * b * c
					break
				}
			}
		}
	}

	fmt.Println(product) // 31,875,000
}
