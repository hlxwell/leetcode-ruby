#
# @lc app=leetcode id=189 lang=ruby
#
# [189] Rotate Array
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  k.times do
    n = nums.pop
    nums.unshift n
  end
  nums
end

# @lc code=end

puts rotate [1, 2, 3, 4, 5, 6, 7], 3
