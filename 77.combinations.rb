#
# @lc app=leetcode id=77 lang=ruby
#
# [77] Combinations
#

# === Cheating Solution ===============
def combine_cheat(n, k)
  (1..n).to_a.combination(k).to_a
end

# === Solution 1 ==============================
# @lc code=start
# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine1(n, k)
  @result = []
  dfs1 0, n, 1, k, []
  @result
end

def dfs1(s, n, level, k, arr)
  if level > k
    @result << arr
    return
  end

  (s + 1).upto(n) do |i|
    dfs1 i, n, level + 1, k, arr + [i]
  end
end

# === Solution 2 ==============================

def combine(n, k)
  @result, @k, @n = [], k, n
  dfs 1, []
  @result
end

def dfs(s, arr)
  return @result << arr if arr.size == @k
  s.upto(@n) { |i| dfs i + 1, arr + [i] }
end

# @lc code=end

puts combine(4, 2).inspect
