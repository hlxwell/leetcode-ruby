package main

import (
	"fmt"
	"math"
	"strings"
)

// http://www.ruanyifeng.com/blog/2013/03/cosine_similarity.html

func getClosestSentence(target string, sentences []string) string {
	var words map[string]int
	targetWords := make(map[string]int)
	var closestWord string
	var closestWordScore float64

	for _, word := range strings.Split(target, " ") {
		targetWords[word]++
	}

	for _, sentence := range sentences {
		words = make(map[string]int)
		for _, word := range strings.Split(sentence, " ") {
			words[word]++
		}

		fmt.Println(getScore(targetWords, words), sentence)
		if score := getScore(targetWords, words); score > closestWordScore {
			closestWord = sentence
			closestWordScore = score
		}
	}

	return closestWord
}

func getScore(word1 map[string]int, word2 map[string]int) float64 {
	var w string
	var a, b, c int = 0, 0, 0
	mergedWord := make(map[string]int)

	for w = range word1 {
		mergedWord[w] = 0
	}

	for w = range word2 {
		mergedWord[w] = 0
	}

	for w = range mergedWord {
		a += word1[w] * word2[w]
		b += word1[w] * word1[w]
		c += word2[w] * word2[w]
	}

	return float64(a) / math.Sqrt(float64(b)) * math.Sqrt(float64(c))
}

func main() {
	result := getClosestSentence("I am the best", []string{
		"you are the best",
		"are you ok with this",
		"I would like to help you",
		"the best",
		"she is the best",
	})
	fmt.Println(result)
}
