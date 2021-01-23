#
# @lc app=leetcode id=36 lang=ruby
#
# [36] Valid Sudoku
#

# @lc code=start
# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  rowHash = {}
  colHash = {}
  squareHash = {}

  # 1. check row
  board.each do |row|
    row.each {|i|
      next if i == '.'
      rowHash[i] ||= 0
      rowHash[i] += 1
    }
    return false if rowHash.values.detect {|i| i > 1}
    rowHash = {}
  end

  # 2. check column
  0.upto(8) do |n|
    board.each do |row|
      next if row[n] == '.'
      colHash[row[n]] ||= 0
      colHash[row[n]] += 1
    end
    return false if colHash.values.detect {|i| i > 1}
    colHash = {}
  end

  # 3. check 3x3 square
  square_ranges = []
  data = [
    (0..2).to_a,
    (3..5).to_a,
    (6..8).to_a,
  ]
  data.each_with_index do |x, i|
    data.each_with_index do |y, j|
      square_ranges << [x, y]
    end
  end

  square_ranges.each do |a, b|
    a.each do |col|
      b.each do |row|
        n = board[row][col]
        next if n == '.'
        squareHash[n] ||= 0
        squareHash[n] += 1
      end
    end
    return false if squareHash.values.detect {|i| i > 1}
    squareHash = {}
  end

  return true
end
# @lc code=end

# puts is_valid_sudoku [
#   ["5","3",".",".","7",".",".",".","."],
#   ["6",".",".","1","9","5",".",".","."],
#   [".","9","8",".",".",".",".","6","."],
#   ["8",".",".",".","6",".",".",".","3"],
#   ["4",".",".","8",".","3",".",".","1"],
#   ["7",".",".",".","2",".",".",".","6"],
#   [".","6",".",".",".",".","2","8","."],
#   [".",".",".","4","1","9",".",".","5"],
#   [".",".",".",".","8",".",".","7","9"]
# ]

# puts is_valid_sudoku [
#   [".",".","4",".",".",".","6","3","."],
#   [".",".",".",".",".",".",".",".","."],
#   ["5",".",".",".",".",".",".","9","."],
#   [".",".",".","5","6",".",".",".","."],
#   ["4",".","3",".",".",".",".",".","1"],
#   [".",".",".","7",".",".",".",".","."],
#   [".",".",".","5",".",".",".",".","."],
#   [".",".",".",".",".",".",".",".","."],
#   [".",".",".",".",".",".",".",".","."]
# ]

# puts is_valid_sudoku [
#   [".", "4", ".", ".", ".", ".", ".", ".", "."],
#   [".", ".", "4", ".", ".", ".", ".", ".", "."],
#   [".", ".", ".", "1", ".", ".", "7", ".", "."],
#   [".", ".", ".", ".", ".", ".", ".", ".", "."],
#   [".", ".", ".", "3", ".", ".", ".", "6", "."],
#   [".", ".", ".", ".", ".", "6", ".", "9", "."],
#   [".", ".", ".", ".", "1", ".", ".", ".", "."],
#   [".", ".", ".", ".", ".", ".", "2", ".", "."],
#   [".", ".", ".", "8", ".", ".", ".", ".", "."]
# ]
