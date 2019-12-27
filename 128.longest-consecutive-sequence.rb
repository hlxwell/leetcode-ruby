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

  result = 0
  nums.each do |n|
    count = 0
    if nums_cache[n - 1].nil?
      num = n
      while !nums_cache[num].nil? && nums_cache[num] != {}
        count += 1
        num += 1
      end
      result = [result, count + 1].max
    end
  end

  result
end

# @lc code=end

puts longest_consecutive [100, 3, 200, 1, 2, 8, 9, 6, 7]
