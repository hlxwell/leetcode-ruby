package main

import "fmt"

// 1, 2, 3, 4, 5 当一直涨，只卖在数组结束
// 9, 4, 1 一直跌就没有卖出，没有盈利
// 1, 3, 2, 1, 8 买后，跌了就卖， 没买，涨了才买
func maxProfit(prices []int) int {
	maxProfit := 0
	for i := 0; i < len(prices)-2; i++ {
		diff := prices[i+1] - prices[i]
		if diff > 0 {
			maxProfit += diff
		}
	}
	return maxProfit
}

func main() {
	prices := []int{9, 1, 10, 2, 4, 1, 5, 10, 2} // 4 + 3 => 7
	fmt.Println(maxProfit(prices))
}
