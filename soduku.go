package main

import "fmt"

func solveSudoku(board [][]byte) {
	var line, column [9][9]bool
	var block [3][3][9]bool
	var spaces [][2]int

	for i, row := range board {
		for j, b := range row {
			if b == '.' {
				spaces = append(spaces, [2]int{i, j})
			} else {
				digit := b - '1'
				line[i][digit] = true
				column[j][digit] = true
				block[i/3][j/3][digit] = true
			}
		}
	}

	var dfs func(int) bool
	dfs = func(pos int) bool {
		if pos == len(spaces) {
			return true
		}
		i, j := spaces[pos][0], spaces[pos][1]
		for digit := byte(0); digit < 9; digit++ {
			if !line[i][digit] && !column[j][digit] && !block[i/3][j/3][digit] {
				line[i][digit] = true
				column[j][digit] = true
				block[i/3][j/3][digit] = true
				board[i][j] = digit + '1'
				if dfs(pos + 1) {
					return true
				}
				line[i][digit] = false
				column[j][digit] = false
				block[i/3][j/3][digit] = false
			}
		}
		return false
	}
	dfs(0)
}

func main() {
	board := [][]byte{
		{'.', '.', '.', '.', '.', '.', '.', '.', '.'},
		{'.', '.', '.', '.', '9', '5', '.', '.', '.'},
		{'.', '9', '8', '.', '.', '.', '.', '6', '.'},
		{'.', '5', '9', '7', '6', '1', '.', '2', '3'},
		{'.', '2', '.', '.', '5', '3', '.', '9', '1'},
		{'7', '1', '3', '9', '2', '4', '8', '5', '6'},
		{'9', '6', '1', '5', '3', '7', '2', '8', '4'},
		{'2', '.', '7', '4', '1', '9', '6', '3', '5'},
		{'.', '.', '.', '.', '8', '.', '.', '7', '9'},
	}
	solveSudoku(board)
	for _, v := range board {
		fmt.Println(string(v))
	}
}
