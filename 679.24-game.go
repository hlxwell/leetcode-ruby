package main

import "fmt"

func judgePoint24(nums []float32) bool {
	return dfs(nums, []float32{}, []string{}, len(nums))
}

func dfs(remain []float32, current []float32, ops []string, size int) bool {
	if len(current) == size {
		result := calculate(current, ops)
		// fmt.Println(current, ops, result)
		return result == 24
	}

	newRemain := []float32{}
	newCurrent := []float32{}
	newOps := []string{}

	for i, num := range remain {
		newCurrent = current
		newCurrent = append(newCurrent, num)

		newRemain = []float32{}
		newRemain = append(newRemain, remain[:i]...)
		newRemain = append(newRemain, remain[i+1:]...)

		for _, op := range []string{"+", "-", "*", "/"} {
			newOps = ops
			if len(newRemain) != 0 {
				newOps = append(newOps, op)
			}
			if dfs(newRemain, newCurrent, newOps, size) {
				return true
			}
		}
	}
	return false
}

var funcs = map[string]func(float32, float32) float32{
	"+": func(a, b float32) float32 { return a + b },
	"-": func(a, b float32) float32 { return a - b },
	"*": func(a, b float32) float32 { return a * b },
	"/": func(a, b float32) float32 { return a / b },
}

func calculate(nums []float32, ops []string) float32 {
	if len(nums) == 0 {
		return 0
	} else if len(nums) == 1 {
		return float32(nums[0])
	} else if len(nums) == 2 {
		return funcs[ops[0]](float32(nums[0]), float32(nums[1]))
	}

	result := calculate(nums[:2], ops[:2])
	return calculate(append([]float32{result}, nums[2:]...), ops[1:])
}

func main() {
	testCases := [][]float32{
		[]float32{1, 2, 3, 4},
		[]float32{8, 4, 6, 6},
		[]float32{9, 7, 5, 2},
	}

	for _, arr := range testCases {
		fmt.Println(judgePoint24(arr))
	}
}
