package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"
)

func readFile() ([]string, error) {
	var contents []string
	file, err := os.Open("words.txt")
	if err != nil {
		return contents, err
	}
	defer file.Close()

	contentArr, err := ioutil.ReadAll(file)
	if err != nil {
		return contents, err
	}
	contentStr := string(contentArr)
	contentStr = strings.Replace(contentStr, "\"", "", -1)
	contentStr = strings.ToLower(contentStr)

	contents = strings.Split(contentStr, ",")
	return contents, nil
}

func getTriangleNumbers() []int {
	var tnums []int
	cumsum := 0

	for i := 1; i <= 100; i++ {
		cumsum += i
		tnums = append(tnums, cumsum)
	}
	return tnums
}

func getAlphabet() map[string]int {
	alphabet := make(map[string]int)
	chars := "abcdefghijklmnopqrstuvwxyz"
	for index, value := range chars {
		alphabet[string(value)] = index + 1
	}
	return alphabet
}

func makeGetWordScore() func(string) int {
	alphabet := getAlphabet()

	return func(word string) int {
		score := 0
		for _, char := range word {
			score += alphabet[string(char)]
		}
		return score
	}
}

func makeIsTriangleNumber() func(int) bool {
	tnums := getTriangleNumbers()

	return func(n int) bool {
		for _, tnum := range tnums {
			if n == tnum {
				return true
			}
		}
		return false
	}
}

func main() {
	words, err := readFile()
	if err != nil {
		panic(err)
	}
	//fmt.Println(words)

	getWordScore := makeGetWordScore()
	isTriangleNumber := makeIsTriangleNumber()

	counter := 0
	for _, word := range words {
		score := getWordScore(word)
		if isTriangleNumber(score) {
			counter++
		}
	}
	fmt.Println(counter) // 162
}
