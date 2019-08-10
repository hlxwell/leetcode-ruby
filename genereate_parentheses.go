package main

import (
	"fmt"
	"strings"
)

func generateParenthesis(n int) []string {
	return dfs(n, n, []string{}, []string{})
}

func dfs(left int, right int, solution []string, result []string) []string {
	// Ending Condition
	if left == 0 && right == 0 {
		result = append(result, strings.Join(solution, ""))
	}

	// Branchs
	if left > 0 {
		result = dfs(left-1, right, append(solution, "("), result)
	}

	if right > 0 && right > left {
		result = dfs(left, right-1, append(solution, ")"), result)
	}

	return result
}

func main() {
	fmt.Println(generateParenthesis(0))
	fmt.Println(generateParenthesis(3))
}
