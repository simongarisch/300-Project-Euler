package main

import "fmt"

const limit = 28123

func getSumProperDivisors(x int) int {
	sum := 0
	for i := 1; i <= (x / 2); i++ {
		if x%i == 0 {
			sum += i
		}
	}
	return sum
}

func getAbundantNumbers() []int {
	var abundantNumbers []int
	for x := 1; x <= limit; x++ {
		if getSumProperDivisors(x) > x {
			abundantNumbers = append(abundantNumbers, x)
		}
	}
	return abundantNumbers
}

func getSumUniqueCombinations() map[int]bool {
	abundantNumbers := getAbundantNumbers()
	combinations := make(map[int]bool)
	for _, v1 := range abundantNumbers {
		for _, v2 := range abundantNumbers {
			combinations[v1+v2] = true
		}
	}
	return combinations
}

func main() {
	uniqueCombinations := getSumUniqueCombinations()
	sumc := 0
	for x := 1; x <= limit; x++ {
		_, ok := uniqueCombinations[x]
		if !ok {
			sumc += x
		}
	}
	fmt.Println(sumc) // 4,179,871
}
