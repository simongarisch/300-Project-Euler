package main

import "fmt"

func isDivisibleTo20(x int) bool {
	for i := 1; i <= 20; i++ {
		if x%i != 0 {
			return false
		}
	}
	return true
}

func main() {
	var counter int = 1
	for {
		if isDivisibleTo20(counter) {
			break
		}
		counter++
	}
	fmt.Println(counter) // 232,792,560
}
