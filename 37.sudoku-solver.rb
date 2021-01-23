require 'byebug'
require 'benchmark'
#
# @lc app=leetcode id=37 lang=ruby
#
# [37] Sudoku Solver
#

# @lc code=start
# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.

FULL_ARRAY = (1..9).map &:to_s

def solve_sudoku(board)
  # 1. find all possible nums for each field.
  new_board = fill_memo board
  # 2. backtracing iterate all the possiblities.
  new_board = iterate_solution new_board
  0.upto(8) do |r|
    0.upto(8) do |c|
      board[r][c] = new_board[r][c]
    end
  end
  new_board
end

def fill_memo new_board
  # 1. check row
  new_board.each do |row|
    row.each_with_index do |n, i|
      row[i] = (FULL_ARRAY - row.select {|c| c != '.'}) if n == '.'
    end
  end

  # 2. check column
  new_board = new_board.transpose # exchange row with col
  new_board.each_with_index do |row, r|
    row.each_with_index do |n, c|
      if n.is_a? Array
        result = (n - row.select {|col| col.is_a? String })
        if row[c].size == 1
          row[c] = result[0]
          new_board = remove_num_from_all_memo new_board, result[0], r, c
        else
          row[c] = result
        end
      end
    end
  end
  new_board = new_board.transpose # transpose back

  # 3. check 3x3 square [[[0,1,2], [0,1,2]], [[0,1,2], [3,4,5]], ...]
  square_ranges.each do |rows, cols|
    nums = []
    rows.each do |y|
      nums += new_board[y][cols[0]..cols[-1]].select {|i| i.is_a? String }
    end

    rows.each do |y|
      cols.each do |x|
        n = new_board[y][x]
        if n.is_a? Array
          result = n - nums
          if result.size == 1
            new_board[y][x] = result[0]
            new_board = remove_num_from_all_memo new_board, result[0], y, x
          else
            new_board[y][x] = result
          end
        end
      end
    end
  end

  new_board
end

@area = [
  [%w{1 1 1 2 2 2 3 3 3}] * 3,
  [%w{4 4 4 5 5 5 6 6 6}] * 3,
  [%w{7 7 7 8 8 8 9 9 9}] * 3,
].flatten(1)

@ranges = {
  '1': [[0,1,2], [0,1,2]],
  '2': [[0,1,2], [3,4,5]],
  '3': [[0,1,2], [6,7,8]],
  '4': [[3,4,5], [0,1,2]],
  '5': [[3,4,5], [3,4,5]],
  '6': [[3,4,5], [6,7,8]],
  '7': [[6,7,8], [0,1,2]],
  '8': [[6,7,8], [3,4,5]],
  '9': [[6,7,8], [6,7,8]],
}

def get_area_by_coord row, col
  @ranges[@area[row][col].to_sym]
end

# when choose 1 num, has to remove it from memo
def remove_num_from_all_memo new_board, n, delete_row, delete_col
  new_board.each_with_index do |row, r|
    if delete_row == r
      # remove num from the row
      row.each_with_index do |col, c|
        if col.is_a? Array
          new_value = col - [n]
          if new_value.size == 1
            new_board[r][c] = new_value.first
            new_board = remove_num_from_all_memo new_board, new_value.first, r, c
          else
            new_board[r][c] = new_value
          end
        end
      end
    else
      # remove num from the col
      if row[delete_col].is_a? Array
        new_value = row[delete_col] - [n]
        if new_value.size == 1
          new_board[r][delete_col] = new_value.first
          new_board = remove_num_from_all_memo new_board, new_value.first, r, delete_col
        else
          new_board[r][delete_col] = new_value
        end
      end
    end
  end

  rows, cols = get_area_by_coord(delete_row, delete_col)
  rows.each do |row|
    cols.each do |col|
      cell = new_board[row][col]
      if cell.is_a? Array
        new_value = cell - [n]
        if new_value.size == 1
          new_board[row][col] = new_value.first
          new_board = remove_num_from_all_memo new_board, new_value.first, row, col
        else
          new_board[row][col] = new_value
        end
      end
    end
  end
  new_board
end

@range_cache = []
def square_ranges
  return @range_cache if @range_cache.size > 0
  @range_cache = []
  data = [
    (0..2).to_a,
    (3..5).to_a,
    (6..8).to_a,
  ]
  data.each do |x|
    data.each do |y|
      @range_cache << [x, y]
    end
  end
  @range_cache
end

def is_valid_sudoku(board)
  rowHash = {}
  colHash = {}
  squareHash = {}

  # 1. check row
  board.each do |row|
    row.each {|i|
      next if i.is_a? Array
      rowHash[i] ||= 0
      rowHash[i] += 1
    }
    if rowHash.values.detect {|i| i > 1}
      return false
    end
    rowHash = {}
  end

  # 2. check column
  0.upto(8) do |n|
    board.each do |row|
      next if row[n].is_a? Array
      colHash[row[n]] ||= 0
      colHash[row[n]] += 1
    end
    if colHash.values.detect {|i| i > 1}
      return false
    end
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
        next if n.is_a? Array
        squareHash[n] ||= 0
        squareHash[n] += 1
      end
    end
    if squareHash.values.detect {|i| i > 1}
      return false
    end
    squareHash = {}
  end

  return true
end

def iterate_solution board
  return nil if !is_valid_sudoku(board)
  return board if is_finished?(board)

  board.each_with_index do |row, r|
    row.each_with_index do |col, c|
      if col.is_a? Array
        col.each do |n|
          new_board = deep_copy(board)
          new_board[r][c] = n
          new_board = remove_num_from_all_memo(new_board, n, r, c)

          if is_finished?(new_board)
            if is_valid_sudoku(new_board)
              return new_board
            else
              next
            end
          else
            result = iterate_solution(new_board)
            return result if result
          end
        end
      end
    end
  end
  nil
end

def is_finished? board
  !board.any? { |row| row.any? { |col| col.is_a? Array }}
end

def deep_copy obj
  obj.map { |it| it.is_a?(Array) ? deep_copy(it) : it }
end

# @lc code=end

# board = [
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

# board = [
#   [".", ".", "9", "7", "4", "8", ".", ".", "."],
#   ["7", ".", ".", ".", ".", ".", ".", ".", "."],
#   [".", "2", ".", "1", ".", "9", ".", ".", "."],
#   [".", ".", "7", ".", ".", ".", "2", "4", "."],
#   [".", "6", "4", ".", "1", ".", "5", "9", "."],
#   [".", "9", "8", ".", ".", ".", "3", ".", "."],
#   [".", ".", ".", "8", ".", "3", ".", "2", "."],
#   [".", ".", ".", ".", ".", ".", ".", ".", "6"],
#   [".", ".", ".", "2", "7", "5", "9", ".", "."]
# ]

# board = [
#   [".", ".", ".", "2", ".", ".", ".", "6", "3"],
#   ["3", ".", ".", ".", ".", "5", "4", ".", "1"],
#   [".", ".", "1", ".", ".", "3", "9", "8", "."],
#   [".", ".", ".", ".", ".", ".", ".", "9", "."],
#   [".", ".", ".", "5", "3", "8", ".", ".", "."],
#   [".", "3", ".", ".", ".", ".", ".", ".", "."],
#   [".", "2", "6", "3", ".", ".", "5", ".", "."],
#   ["5", ".", "3", "7", ".", ".", ".", ".", "8"],
#   ["4", "7", ".", ".", ".", "1", ".", ".", "."]
# ]

# board = [
#   ["1", ".", ".", "8", "7", ".", ".", "3", "."],
#   ["8", "3", ".", "6", ".", ".", ".", ".", "."],
#   [".", ".", "2", "9", ".", ".", "6", ".", "8"],
#   ["6", ".", ".", ".", ".", "4", "9", ".", "7"],
#   [".", "9", ".", ".", ".", ".", ".", "5", "."],
#   ["3", ".", "7", "5", ".", ".", ".", ".", "4"],
#   ["2", ".", "3", ".", ".", "9", "1", ".", "."],
#   [".", ".", ".", ".", ".", "2", ".", "4", "3"],
#   [".", "4", ".", ".", "8", ".", ".", ".", "9"]
# ]
# solve_sudoku board
# pp board
