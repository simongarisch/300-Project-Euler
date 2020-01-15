package main

import (
	"fmt"
	"io/ioutil"
	"sort"
	"strings"
)

func getNames() ([]string, error) {
	var names []string

	data, err := ioutil.ReadFile("names.txt")
	if err != nil {
		return names, err
	}

	cleanNames := strings.Replace(string(data), "\"", "", -1)
	cleanNames = strings.ToLower(cleanNames)
	names = strings.Split(cleanNames, ",")
	sort.Strings(names)
	return names, nil
}

func createNameScoreLookup() func(string) int {
	alphabet := "abcdefghijklmnopqrstuvwxyz"
	scores := make(map[string]int)
	for index, char := range alphabet {
		scores[string(char)] = index + 1
	}

	return func(name string) int {
		score := 0
		for _, char := range name {
			score += scores[string(char)]
		}
		return score
	}
}

func main() {
	names, err := getNames()
	if err != nil {
		panic(err)
	}
	//fmt.Println(names)

	alphabet := "abcdefghijklmnopqrstuvwxyz"
	scores := make(map[string]int)
	for index, char := range alphabet {
		scores[string(char)] = index + 1
	}

	nameScoreLookup := createNameScoreLookup()
	totalScore := 0
	for index, name := range names {
		nameScore := nameScoreLookup(name)
		totalScore += (index + 1) * nameScore
	}

	fmt.Println(totalScore) // 871,198,282
}
