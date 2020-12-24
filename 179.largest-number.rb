#
# @lc app=leetcode id=179 lang=ruby
#
# [179] Largest Number
#

# @lc code=start
# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
  result = nums.map(&:to_s).sort { |a, b| (b + a).to_i <=> (a + b).to_i }.join
  return result.to_i.to_s if result[0] == '0'
  result
end
# @lc code=end
