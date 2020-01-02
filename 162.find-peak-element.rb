#
# @lc app=leetcode id=162 lang=ruby
#
# [162] Find Peak Element
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  len = nums.size
  return 0 if len == 1

  s, e = 0, len - 1
  while e > s
    mid = s + ((e - s) / 2.0).ceil

    if nums[mid] > nums[mid - 1]
      s = mid
    else
      e = mid - 1
    end
  end
  e
end

# @lc code=end

# puts find_peak_element([1, 2, 3, 5, 4]) == 3
# puts find_peak_element([1, 2, 3, 5, 6]) == 4
# puts find_peak_element([5, 4, 3, 2, 1]) == 0
# puts find_peak_element([1, 2, 1]) == 1
# puts [0, 2].include? find_peak_element([2, 1, 2])
# puts find_peak_element([3]) == 0
# puts find_peak_element([3, 2]) == 0
# puts find_peak_element([]) == -1
