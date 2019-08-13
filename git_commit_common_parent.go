package main

import "fmt"

type GraphNode struct {
	parents []*GraphNode
	value   int
}

func findCommonCommit(commit1 *GraphNode, commit2 *GraphNode) []int {
	commit1Parents := make(map[int]int)
	commit2Parents := make(map[int]int)
	result := []int{}
	dfs(commit1, &commit1Parents)
	dfs(commit2, &commit2Parents)

	for k, _ := range commit2Parents {
		if commit1Parents[k] > 0 {
			result = append(result, k)
		}
	}

	return result
}

func dfs(node *GraphNode, result *map[int]int) {
	(*result)[node.value]++

	if node.parents == nil {
		return
	}

	for _, parent := range node.parents {
		dfs(parent, result)
	}
}

func main() {
	commit1 := GraphNode{
		value: 11111,
	}
	commit2 := GraphNode{
		value:   22222,
		parents: []*GraphNode{&commit1},
	}
	commit3 := GraphNode{
		value:   33333,
		parents: []*GraphNode{&commit2},
	}
	commit4 := GraphNode{
		value:   44444,
		parents: []*GraphNode{&commit2},
	}

	fmt.Println(findCommonCommit(&commit3, &commit4))
}
