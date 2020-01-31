package main

import "fmt"

const (
	maxn      = 1e5
	findAfter = 40755
)

func triangle(n int) int {
	return n * (n + 1) / 2
}

func pentagonal(n int) int {
	return n * (3*n - 1) / 2
}

func hexagonal(n int) int {
	return n * (2*n - 1)
}

func populate(f func(int) int) []int {
	var values []int
	n := 0
	for {
		if n > maxn {
			break
		}
		n++
		values = append(values, f(n))
	}
	return values
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
	tn := populate(triangle)
	pn := populate(pentagonal)
	hn := populate(hexagonal)

	result := 0
	for _, h := range hn {
		if contains(pn, h) {
			if contains(tn, h) {
				if h > findAfter {
					result = h
					break
				}
			}
		}
	}

	fmt.Println(result) // 1,533,776,805
}
