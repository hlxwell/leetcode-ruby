package main

import (
	"fmt"
	"strings"
)

func main() {
	result := uncommonFromSentences("this apple is sweet", "this apple is sour")
	fmt.Println(result)
}

func uncommonFromSentences(a string, b string) []string {
	strsA := strings.Split(a, " ")
	strsB := strings.Split(b, " ")

	wordOccurence := make(map[string]int)
	var result []string

	for _, s := range strsA {
		wordOccurence[s] += 1
	}

	for _, s := range strsB {
		wordOccurence[s] += 1
	}

	for word, count := range wordOccurence {
		if count == 1 {
			result = append(result, word)
		}
	}

	return result
}
