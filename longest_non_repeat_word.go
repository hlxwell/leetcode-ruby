package main

import "fmt"

func lengthOfLongestSubstring(s string) int {
	if len(s) <= 1 {
		return len(s)
	}

	var currentLength int
	maxLength := 1
	wordSize := len(s)
	var cache map[byte]bool
	for i := 0; i < wordSize; i++ {
		cache = make(map[byte]bool)
		cache[s[i]] = true
		for j := i + 1; j < wordSize; j++ {
			if cache[s[j]] {
				break
			}
			cache[s[j]] = true
			currentLength = j - i + 1
			if currentLength > maxLength {
				maxLength = currentLength
			}
		}
	}
	return maxLength
}

func lengthOfLongestSubstring2(s string) int {
	if len(s) <= 1 {
		return len(s)
	}

	result := 0
	cache := make(map[byte]int)
	startIndex := 0
	for i := 0; i < len(s); i++ {
		cache[s[i]]++
		if hasDupValue(cache) {
			cache[s[startIndex]]--
			startIndex++
		}

		newLen := countUniqMap(cache)
		if newLen > result {
			result = newLen
		}
	}

	return result
}

func hasDupValue(m map[byte]int) bool {
	for _, v := range m {
		if v > 1 {
			return true
		}
	}
	return false
}

func countUniqMap(m map[byte]int) int {
	count := 0
	for _, v := range m {
		if v == 1 {
			count++
		}
	}
	return count
}

func main() {
	// fmt.Println(lengthOfLongestSubstring("bbbbb"))
	// fmt.Println(lengthOfLongestSubstring("aabcdabc"))

	fmt.Println(lengthOfLongestSubstring2("aab"))      // => 2
	fmt.Println(lengthOfLongestSubstring2("abcdef"))   // => 6
	fmt.Println(lengthOfLongestSubstring2("bbbbb"))    // => 1
	fmt.Println(lengthOfLongestSubstring2("jbpnbwwd")) // => 4
	fmt.Println(lengthOfLongestSubstring2("aabcdabc")) // => 4
	fmt.Println(lengthOfLongestSubstring2("pwwkew"))   // => 3
}
