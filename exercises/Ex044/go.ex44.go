package main

import "fmt"

func pentagonalNumber(n int) int {
	return n * (3*n - 1) / 2
}

func contains(slice []int, n int) bool {
	for _, value := range slice {
		if value == n {
			return true
		}
	}
	return false
}

func main() {
	d := 0
	n := 0
	var pentas []int
	for {
		if d != 0 {
			break
		}
		n++
		penta := pentagonalNumber(n)
		for _, p := range pentas {
			if contains(pentas, penta-p) {
				if contains(pentas, penta-2*p) {
					d = penta - 2*p
				}
			}
		}
		pentas = append(pentas, penta)
	}

	fmt.Println(d) // 5,482,660
}
