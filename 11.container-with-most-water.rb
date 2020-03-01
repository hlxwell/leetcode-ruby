#
# @lc app=leetcode id=11 lang=ruby
#
# [11] Container With Most Water
#

# @lc code=start
# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  max = 0
  left = 0
  right = height.size - 1
  while left != right
    result = [height[left], height[right]].min * (right - left)
    max = result if result > max
    if height[left] < height[right]
      left += 1
    else
      right -= 1
    end
  end
  max
end

def brutal_force_max_area(height)
  max = 0
  0.upto(height.size - 2) do |i|
    i.upto(height.size - 1) do |j|
      min_edge = [height[i], height[j]].min
      result = min_edge * (j - i)
      max = result if result > max
    end
  end
  max
end

# @lc code=end

puts max_area [1, 8, 6, 2, 5, 4, 8, 3, 7]
