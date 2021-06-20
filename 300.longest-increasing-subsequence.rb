require "pp"
#
# @lc app=leetcode id=300 lang=ruby
#
# [300] Longest Increasing Subsequence
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  return 1 if nums.uniq.size == 1
  max_len = 1
  max_lens = [1] * nums.size

  (nums.size - 2).downto(0) do |i|
    max_lens[i] = 1
    (i + 1).upto(nums.size - 1) do |j|
      if nums[i] < nums[j] && max_lens[j] + 1 > max_lens[i]
        max_lens[i] = max_lens[j] + 1
      end
    end
  end

  max_lens.max
end

# @lc code=end

# puts length_of_lis [10, 9, 2, 5, 3, 7, 101, 18]
# puts length_of_lis [4, 10, 4, 3, 8, 9]
# puts length_of_lis [7, 7, 7, 7, 7, 7, 7, 7]
