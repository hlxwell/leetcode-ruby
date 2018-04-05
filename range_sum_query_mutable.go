package main

type FenwickTree struct {
	nums []int
	sums []int
}

func (f FenwickTree) update(i int, delta int) {
	if i < 0 {
		return
	}

	for i <= len(f.nums) {
		f.sums[i-1] += delta
		i += f.lowBit(i)
	}
}

func (f FenwickTree) calcuateSums() {
	for index, num := range f.nums {
		f.update(index+1, num)
	}
}

func (f FenwickTree) query(i int) int {
	total := 0
	for i > 0 {
		total += f.sums[i-1]
		i -= f.lowBit(i)
	}
	return total
}

func (f FenwickTree) queryRange(i int, j int) int {
	return f.query(j) - f.query(i-1)
}

func (f FenwickTree) lowBit(x int) int {
	return x & (-x)
}

func main() {
	tree := FenwickTree{}
	tree.nums = []int{1, 2, 3, 4, 5, 6, 7, 8}
	tree.sums = make([]int, 8, 8)
	tree.calcuateSums()
	println(tree.query(8))
	println(tree.queryRange(5, 7))
}
