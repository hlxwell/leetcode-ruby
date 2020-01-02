#
# @lc app=leetcode id=47 lang=ruby
#
# [47] Permutations II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
  @result, @nums = {}, nums
  @num_indices = (0..nums.size - 1).to_a
  dfs []
  @result.keys
end

def dfs(arr)
  @result[arr.map { |i| @nums[i] }] = nil if arr.size == @nums.size
  (@num_indices - arr).each { |i| dfs arr + [i] }
end

# @lc code=end

puts permute_unique([1, 1, 2]).inspect
