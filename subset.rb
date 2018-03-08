nums1 = [1, 2, 3]
result1 = [
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]

# def subsets(nums)
#   (0..nums.size).map do |num|
#     nums.combination(num).to_a
#   end.flatten(1)
# end

# def subsets(nums)
#   result = []
#   (0..nums.size).each do |num|
#     nums.combination(num).to_a.each {|r| result << r }
#   end
#   result
# end

def subsets(nums)
  @res = []
  dfs nums, [], 0
  @res
end

# 理解递归:
# 问题结束条件： 成功或者失败条件
# 找到子问题：继续递归
def dfs nums, tmp, i
  @res << tmp.dup
  # 结束: 循环结束
  i.upto(nums.size - 1) do |index|
    # 子问题: [嵌套层数..-1]
    dfs(
      nums, 
      tmp + [nums[index]],
      index + 1 # 子set的起始index
    )
  end
end

p subsets(nums1)