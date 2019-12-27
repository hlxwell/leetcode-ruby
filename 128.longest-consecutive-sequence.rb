#
# @lc app=leetcode id=128 lang=ruby
#
# [128] Longest Consecutive Sequence
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  return 0 if nums.empty?
  return 1 if nums.size == 1
  nums_cache = Hash[nums.map { |n| [n, {}] }]
  nums.each do |n|
    if !nums_cache[n + 1].nil?
      nums_cache[n] = n + 1
    elsif nums_cache[n - 1].nil?
      nums_cache.delete(n)
    end
  end

  result = 1
  while nums_cache.size > 0
    n = nums_cache.keys.min
    count = 0
    while nums_cache[n] != {}
      n = nums_cache.delete(n)
      count += 1
    end
    nums_cache.delete(n)
    result = [result, count + 1].max
  end

  result
end

# @lc code=end

puts longest_consecutive [100, 3, 200, 1, 2, 8, 9, 6, 7]
