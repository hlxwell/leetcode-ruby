#
# @lc app=leetcode id=283 lang=ruby
#
# [283] Move Zeroes
#

# @lc code=start
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  0.upto(nums.size - 2) do |i|
    next if nums[i] != 0
    i.upto(nums.size - 1) do |j|
      if nums[j] != 0
        nums[i], nums[j] = nums[j], nums[i]
        break
      end
    end
  end
  nums
end

# @lc code=end
