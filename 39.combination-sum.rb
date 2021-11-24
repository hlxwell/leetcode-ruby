#
# @lc app=leetcode id=39 lang=ruby
#
# [39] Combination Sum
#

# @lc code=start
# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
@result = {}
def combination_sum(candidates, target)
  @result = {}
  dfs [], candidates.uniq, target
  @result.keys
end

def dfs(result, arr, target)
  return if target < 0

  if target == 0
    @result[result.sort] = true
  end

  arr.each do |i|
    dfs result + [i], arr, target - i
  end
end
# @lc code=end
