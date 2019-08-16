package main

import "fmt"

func wordBreak(s string, wordDict []string) bool {
	var tmpWord string
	checkPoints := []int{0}
	dict := make(map[string]int)
	for _, word := range wordDict {
		dict[word] = 1
	}

	for i := 1; i <= len(s); i++ {
		for _, checkPoint := range checkPoints {
			tmpWord = s[checkPoint:i]

			if dict[tmpWord] > 0 {
				checkPoints = append(checkPoints, i)
				break
			}
		}
	}

	return checkPoints[len(checkPoints)-1] == len(s)
}

func main() {
	fmt.Println(wordBreak("leetcode", []string{"leet", "code"}))
	fmt.Println(wordBreak("aaaaaaa", []string{"aaaa", "aaa"}))
	fmt.Println(wordBreak("catssanddog", []string{"cats", "dog", "sand", "and", "cat"}))
}
