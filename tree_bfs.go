package main

import "fmt"

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func bfs(root *TreeNode) []int {
	result := []int{}
	if root == nil {
		return result
	}

	var node *TreeNode
	stack := []*TreeNode{}
	stack = append(stack, root)
	for len(stack) > 0 {
		node, stack = stack[0], stack[1:] // pop from first element

		if node.Left != nil {
			stack = append(stack, node.Left) // push left, right to stack
		}

		if node.Right != nil {
			stack = append(stack, node.Right)
		}

		result = append(result, node.Val)
	}
	return result
}

func main() {
	root := &TreeNode{
		Val: 1,
		Left: &TreeNode{
			Val:   2,
			Left:  &TreeNode{Val: 4},
			Right: nil,
		},
		Right: &TreeNode{
			Val:   3,
			Left:  &TreeNode{Val: 6},
			Right: &TreeNode{Val: 7},
		},
	}
	fmt.Println(bfs(root))
}
