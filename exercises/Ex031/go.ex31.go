package main

import "fmt"

func main() {
	targetValue := 200
	countSumTarget := 0
	for v200 := 0; v200 <= targetValue; v200 += 200 {
		for v100 := v200; v100 <= targetValue; v100 += 100 {
			for v50 := v100; v50 <= targetValue; v50 += 50 {
				for v20 := v50; v20 <= targetValue; v20 += 20 {
					for v10 := v20; v10 <= targetValue; v10 += 10 {
						for v5 := v10; v5 <= targetValue; v5 += 5 {
							for v2 := v5; v2 <= targetValue; v2 += 2 {
								for v1 := v2; v1 <= targetValue; v1++ {
									if v1 == targetValue {
										countSumTarget++
									}
								}
							}
						}
					}
				}
			}
		}
	}

	fmt.Println(countSumTarget) // 73,682
}
