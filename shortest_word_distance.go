package main

import (
	"math"
)

func ShortestWordDistance1(strs []string, word1 string, word2 string) int {
	var wordsIndices = map[string][]int{}
	for i, str := range strs {
		if wordsIndices[str] == nil {
			wordsIndices[str] = []int{i}
		} else {
			wordsIndices[str] = append(wordsIndices[str], i)
		}
	}

	word1Indices, word2Indices := wordsIndices[word1], wordsIndices[word2]

	results := []float64{}
	var diff float64
	for _, index1 := range word1Indices {
		for _, index2 := range word2Indices {
			diff = math.Abs(float64(index1 - index2))
			if diff == 1 {
				return 1
			}
			results = append(results, diff)
		}
	}

	min := results[0]
	for _, element := range results {
		if element < min {
			min = element
		}
	}

	return int(min)
}

func ShortestWordDistance2(strs []string, word1 string, word2 string) int {
	var diff int
	word1LastPosition, word2LastPosition := math.MinInt32, math.MinInt32
	min := math.MaxInt32
	var positionUpdated bool

	for i, str := range strs {
		positionUpdated = false
		if str == word1 {
			word1LastPosition = i
			positionUpdated = true
		} else if str == word2 {
			word2LastPosition = i
			positionUpdated = true
		}

		if positionUpdated && word1LastPosition != math.MinInt32 && word2LastPosition != math.MinInt32 {
			diff = int(math.Abs(float64(word1LastPosition - word2LastPosition)))
			if diff < min {
				min = diff
				if min == 1 {
					return 1
				}
			}
		}
	}
	return min
}
