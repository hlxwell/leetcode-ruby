#
# @lc app=leetcode id=200 lang=ruby
#
# [200] Number of Islands
#

# @lc code=start
# @param {Character[][]} grid
# @return {Integer}
@tmp_grid = nil

def num_islands(grid)
  @tmp_grid = grid.clone

  row_count = grid.size
  return 0 if row_count == 0

  col_count = grid[0].size
  return 0 if col_count == 0

  count = 0

  0.upto(row_count - 1) do |row_i|
    0.upto(col_count - 1) do |col_i|
      next if ["0", "2"].include? @tmp_grid[row_i][col_i]
      dfs row_i, col_i
      count += 1
    end
  end

  count
end

def dfs(row, col)
  return if @tmp_grid[row][col] == "0"

  @tmp_grid[row][col] = "2" # set 2

  is_last_row = row == (@tmp_grid.size - 1)
  is_last_col = col == (@tmp_grid[0].size - 1)
  is_first_row = row == 0
  is_first_col = col == 0

  dfs(row, col + 1) if !is_last_col && @tmp_grid[row][col + 1] == "1"
  dfs(row + 1, col) if !is_last_row && @tmp_grid[row + 1][col] == "1"

  dfs(row, col - 1) if !is_first_col && @tmp_grid[row][col - 1] == "1"
  dfs(row - 1, col) if !is_first_row && @tmp_grid[row - 1][col] == "1"
end

# @lc code=end

grid = [
  ["1", "1", "1"],
  ["0", "1", "0"],
  ["1", "1", "1"],
]

puts num_islands(grid)
