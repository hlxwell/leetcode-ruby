#
# @lc app=leetcode id=283 lang=ruby
#
# [283] Move Zeroes
#

# @lc code=start
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes_slow(nums)
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

def move_zeroes(nums)
  return nums if nums.size <= 1
  i, j = 0, 1
  while j < nums.size and i < nums.size
    if nums[i] == 0 and nums[j] != 0
      nums[i], nums[j] = nums[j], nums[i]
      i += 1
      j += 1
    end
    i += 1 if nums[i] != 0
    j += 1 if nums[j] == 0 or i >= j
  end
  nums
end

# @lc code=end

# puts move_zeroes [0, 1, 0, 3, 12]
# puts move_zeroes [2, 1]
# puts move_zeroes [4, 2, 4, 0, 0, 3, 0, 5, 1, 0]
