#
# @lc app=leetcode id=162 lang=ruby
#
# [162] Find Peak Element
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  return 0 if nums.size == 1

  s, e = 0, nums.size - 1
  while e > s
    mid = s + ((e - s) / 2.0).ceil

    if mid == 0
      return nums[mid] > nums[mid + 1] ? mid : mid + 1
    elsif mid == e
      return nums[mid] > nums[mid - 1] ? mid : mid - 1
    else
      if nums[mid] > nums[mid - 1] and nums[mid] > nums[mid + 1] # peak
        return mid
      elsif nums[mid - 1] < nums[mid] and nums[mid] < nums[mid + 1] # assent
        s = mid
      elsif nums[mid - 1] > nums[mid] and nums[mid] > nums[mid + 1] # decent
        e = mid
      else # valley
        s = mid # or e = mid
      end
    end
  end
end

# @lc code=end

puts find_peak_element([1, 2, 3, 5, 4]) == 3
puts find_peak_element([1, 2, 3, 5, 6]) == 4
puts find_peak_element([5, 4, 3, 2, 1]) == 0
puts find_peak_element([1, 2, 1]) == 1
puts find_peak_element([2, 1, 2]) == 2
puts find_peak_element([3, 1, 3]) == 2
puts find_peak_element([3]) == 0
puts find_peak_element([3, 2]) == 0
puts find_peak_element([]) == nil
