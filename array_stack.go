package main

import "fmt"

type ArrayStack struct {
	data []int
}

func (stack *ArrayStack) pop() int {
	result := stack.data[len(stack.data)-1]
	stack.data = stack.data[:len(stack.data)-1]
	return result
}

func (stack *ArrayStack) push(num int) {
	stack.data = append(stack.data, num)
}

func (stack *ArrayStack) remove(index int) int {
	result := stack.data[index]
	stack.data = append(stack.data[:index], stack.data[index+1:]...)
	return result
}

func (stack *ArrayStack) insert(index int, num int) {
	tmp := []int{}
	tmp = append(tmp, stack.data[:index+1]...)
	tmp = append(tmp, num)
	stack.data = append(tmp, stack.data[index+1:]...)
}

func main() {
	stack := ArrayStack{data: []int{1, 2, 3, 4}}
	fmt.Println(stack)
	stack.push(8)
	fmt.Println(stack)
	fmt.Println(stack.pop())
	fmt.Println(stack)
	fmt.Println(stack.remove(2))
	fmt.Println(stack)
	stack.insert(1, 9)
	fmt.Println(stack)
}
