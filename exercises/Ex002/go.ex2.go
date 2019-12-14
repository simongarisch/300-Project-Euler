package main

import "fmt"

func main() {
	fib := []int{1, 2}
	var sum int = 2
	var nextValue int

	for {
		var lenFib int = len(fib)
		nextValue = fib[lenFib-1] + fib[lenFib-2]
		fib = append(fib, nextValue)
		if nextValue < 4e6 {
			if (nextValue % 2) == 0 {
				sum += nextValue
			}
		} else {
			break
		}
	}

	fmt.Println(sum) // 4,613,732
}
