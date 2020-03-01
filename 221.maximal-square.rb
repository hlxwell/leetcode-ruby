#
# @lc app=leetcode id=221 lang=ruby
#
# [221] Maximal Square
#

# @lc code=start
# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(arr)
  return 0 if arr.empty?
  return 0 if arr[0].empty?

  rows = arr.size
  cols = arr[0].size
  result = 0
  0.upto(rows - 1) do |row|
    0.upto(cols - 1) do |col|
      max_width = cols - col
      max_height = rows - row
      s = [max_width, max_height].min
      break if s < result

      0.upto(s - 1) do |i|
        # puts "#{row}:#{rows}, #{col}:#{cols}, #{i}/#{s}, #{is_square.inspect}"
        is_square = row.upto(row + i).find { |x| arr[x][col..(col + i)].include?("0") } == nil
        if is_square
          result = i + 1 if (i + 1) > result
        else
          break
        end
      end
    end
  end
  result ** 2
end

# @lc code=end
