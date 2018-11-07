package main

import (
	"bytes"
	"fmt"
)

var cache map[int]string

func calculateCache() {
	cache = make(map[int]string)
	cache[1] = "1"
	for index := 2; index <= 30; index++ {
		cache[index] = say(cache[index-1])
	}
}

// 121 => 111211
func say(num string) string {
	var counter [][]int
	var buffer bytes.Buffer

	for _, n := range num {
		nInInt := int(n)
		if len(counter) == 0 {
			counter = append(counter, []int{nInInt, 1})
			continue
		}
		lastWordCounter := counter[len(counter)-1]
		if lastWordCounter[0] == int(n) {
			lastWordCounter[1]++
		} else {
			counter = append(counter, []int{nInInt, 1})
		}
	}

	for _, val := range counter {
		buffer.WriteString(fmt.Sprint(val[1]))
		buffer.WriteString(fmt.Sprintf("%c", val[0]))
	}

	return buffer.String()
}

func count_and_say(n int) string {
	return cache[n]
}

func main() {
	calculateCache()
	fmt.Println("result:", count_and_say(4))
}
