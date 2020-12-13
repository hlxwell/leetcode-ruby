package main

import (
	"fmt"
)

func permutation(arr []int, size int) {
	dfs(arr, []int{}, size)
}

func dfs(remain []int, current []int, size int) {
	if len(current) == size {
		fmt.Println(current)
	}
	newRemain := []int{}
	newCurrent := current

	for i, v := range remain {
		newRemain = []int{}
		newRemain = append(newRemain, remain[:i]...)
		newRemain = append(newRemain, remain[i+1:]...)
		dfs(newRemain, append(newCurrent, v), size)
	}
}

func main() {
	arr := []int{1, 2, 3, 4}
	permutation(arr, 4)
}
