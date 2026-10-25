// https://leetcode.com/problems/binary-tree-paths/
package main

import (
	"fmt"
)

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func reverse(arr []int) []int {
	var result []int
	for i := len(arr) - 1; i >= 0; i-- {
		result = append(result, arr[i])
	}
	return result
}

func zigzagLevelOrder(root *TreeNode) [][]int {
	if root == nil {
		return [][]int{}
	}

	// bfs => 1, 2, 3, 4, 5
	stack := [][]*TreeNode{}
	stack = append(stack, []*TreeNode{root})
	result := [][]int{}
	var layer []*TreeNode

	for len(stack) > 0 {
		layer, stack = stack[0], stack[1:]
		if layer == nil || len(layer) == 0 {
			continue
		}
		result = append(result, []int{}) // add a new blank layer
		tmpStack := []*TreeNode{}

		for _, node := range layer {
			// fmt.Print(node.Val, ",")
			// add all values of nodes in this layer to this layer's result
			result[len(result)-1] = append(result[len(result)-1], node.Val)
			// 0, 2, 4 will add child to 1, 3, 5
			if node.Left != nil {
				tmpStack = append(tmpStack, node.Left)
			}
			if node.Right != nil {
				tmpStack = append(tmpStack, node.Right)
			}
		}
		stack = append(stack, tmpStack)
	}

	for i, layer := range result {
		if i%2 != 0 {
			result[i] = reverse(layer)
		}
	}

	return result
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
	fmt.Println(zigzagLevelOrder(root))

	root = &TreeNode{
		Val:   1,
		Left:  &TreeNode{Val: 2, Left: &TreeNode{Val: 4}},
		Right: &TreeNode{Val: 3, Right: &TreeNode{Val: 5}},
	}
	fmt.Println(zigzagLevelOrder(root))
}
