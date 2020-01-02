#
# @lc app=leetcode id=46 lang=ruby
#
# [46] Permutations
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  @result, @nums = [], nums
  dfs []
  @result
end

def dfs(arr)
  @result << arr if arr.size == @nums.size
  (@nums - arr).each { |n| dfs arr + [n] }
end

# @lc code=end

puts permute([1, 3, 2]).inspect
