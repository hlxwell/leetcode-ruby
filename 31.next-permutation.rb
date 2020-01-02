#
# @lc app=leetcode id=31 lang=ruby
#
# [31] Next Permutation
#

# TLE
def next_permutation_1(nums)
  total_p = nums.sort.permutation().to_a.uniq
  index_of_num = total_p.index(nums)
  total_p[(index_of_num + 1) % total_p.size].each_with_index do |n, i|
    nums[i] = n
  end
end

# @lc code=start
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

# 1. 从右往左找升序的谷点(i)
# 2. 从右往左找比i大的点，与i对换
# 3. reverse(i + 1, nums.size - 1)
def next_permutation(nums)
  len = nums.size
  return nums if len < 2
  return nums.reverse! if len == 2

  x, y = 0, 0
  (len - 1).downto(1) do |i|
    former, latter = nums[i - 1], nums[i]
    if former < latter
      x = i - 1
      break
    end
  end

  (len - 1).downto(x + 1) do |j|
    if nums[j] > nums[x]
      y = j
      break
    end
  end

  return nums.reverse! if x == 0 && y == 0
  nums[x], nums[y] = nums[y], nums[x]

  i = x + 1
  j = len - 1
  while i < j
    nums[i], nums[j] = nums[j], nums[i]
    i += 1
    j -= 1
  end
end

# @lc code=end

nums = [5, 4, 7, 5, 3, 2] # => [5,5,2,3,4,7]
next_permutation(nums)
puts nums.inspect
