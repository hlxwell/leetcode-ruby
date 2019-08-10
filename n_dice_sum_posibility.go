package main

import (
	"fmt"
	"math/rand"
)

func combinationDice(n int, target int) { // [][]int
	results := []int{}
	dfs(n, target, results)
}

func dfs(n int, target int, results []int) {
	// If it is the last dice
	if n == 1 {
		if target >= 1 && target <= 6 {
			results = append(results, target)
			fmt.Println(results)
			results = results[:len(results)-1]
		}
		return
	}

	// If the rest of dice is not enough for the num.
	if n > target || target > 6*n {
		return
	}

	// Loop the solution.
	for i := 1; i <= 6; i++ {
		results = append(results, i)
		dfs(n-1, target-i, results)
		results = results[:len(results)-1]
	}
}

func main() {
	r := rand.New(rand.NewSource(1000))

	for n := 1; n <= 3; n++ {
		sum := r.Intn(6 * n)
		if sum <= 0 {
			continue
		}

		fmt.Println("----------- n, sum is ", n, sum)
		combinationDice(n, sum)
	}
}
