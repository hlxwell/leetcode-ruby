#
# @lc app=leetcode id=1 lang=ruby
#
# [1] Two Sum
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  num_with_index = {}
  nums.each_with_index do |num, i|
    matched_num_index = num_with_index[target - num]
    if !matched_num_index.nil?
      return [matched_num_index, i]
    end
    num_with_index[num] = i
  end
end

# @lc code=end
