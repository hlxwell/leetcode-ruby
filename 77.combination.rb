# Notes
# [1,2,3]的子问题是

# 递归过程 查看 recursive-analyse 图

# def combine n, k
#   (0..n).to_a.combination(k).to_a
# end

def combine(n, k)
  @result = []
  @nums = (1..n).to_a
  @comb_size = k
  dfs [], 0
  @result
end

# (base arr) combine all elements in [index..end]
def dfs(sub_arr, index)
  # 结束条件
  if sub_arr.size == @comb_size
    return @result << sub_arr
  end

  # 找出子问题继续循环
  index.upto(@nums.size - 1) do |i|
    j = i + 1
    dfs sub_arr + [@nums[i]], j
  end
end

p combine 3, 2
