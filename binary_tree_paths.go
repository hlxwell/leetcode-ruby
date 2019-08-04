// https://leetcode.com/problems/binary-tree-paths/
package main

import (
	"fmt"
	"strconv"
	"strings"
)

var stack []string
var result [][]string

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func binaryTreePaths(root *TreeNode) []string {
	stack = []string{}
	result = [][]string{}

	if root == nil {
		return nil
	}

	dfs(root)
	paths := []string{}

	for _, arr := range result {
		paths = append(paths, strings.Join(arr, "->"))
	}
	return paths
}

func dfs(node *TreeNode) {
	stack = append(stack, strconv.Itoa(node.Val))

	if node.Left != nil {
		dfs(node.Left)
	}

	if node.Right != nil {
		dfs(node.Right)
	}

	// End Leaf
	if node.Left == nil && node.Right == nil {
		var stackSnapshot = make([]string, len(stack))
		copy(stackSnapshot, stack)
		result = append(result, stackSnapshot)
	}

	stack = stack[:len(stack)-1]
}

func main() {
	root := &TreeNode{
		Val:  1,
		Left: &TreeNode{Val: 2},
		Right: &TreeNode{
			Val:   3,
			Left:  &TreeNode{Val: 4},
			Right: &TreeNode{Val: 5},
		},
	}
	fmt.Println(binaryTreePaths(root))
}
