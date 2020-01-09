package main

import "fmt"

const finish = 1e6

func main() {
	longestChain := 0
	starting := 0

	for i := 1; i < finish; i++ {
		terms := 1
		num := i
		for {
			if num == 1 {
				break
			}
			if num%2 == 0 {
				num = num / 2
			} else {
				num = 3*num + 1
			}
			terms++
		}
		if terms > longestChain {
			longestChain = terms
			starting = i
		}
	}

	fmt.Println(starting) // 837,799
}
