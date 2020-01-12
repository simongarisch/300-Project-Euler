package main

import (
	"fmt"
	"time"
)

func main() {
	startDate := time.Date(1901, 01, 01, 0, 0, 0, 0, time.UTC)
	endDate := time.Date(2000, 12, 31, 0, 0, 0, 0, time.UTC)
	//fmt.Println(startDate, endDate)

	countSundays := 0
	for {
		if startDate.Equal(endDate) {
			break
		}
		if startDate.Day() == 1 {
			if startDate.Weekday() == time.Sunday {
				countSundays++
			}
		}
		startDate = startDate.AddDate(0, 0, 1)
	}
	fmt.Println(countSundays) // 171
}
