package main

import "fmt"

func findDuplicate(nums []int) int {
	counter := make(map[int]*int)

	for _, n := range nums {
		if counter[n] == nil {
			zero := 0
			counter[n] = &zero
		}

		*counter[n]++

		if *counter[n] >= 2 {
			return n
		}
	}

	panic("subject is wrong.")
}

func main() {
	fmt.Println(findDuplicate([]int{1, 3, 4, 2, 2}))
}
