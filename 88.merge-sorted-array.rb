#
# @lc app=leetcode id=88 lang=ruby
#
# [88] Merge Sorted Array
#

# @lc code=start
# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  arr1 = nums1.take(m)
  arr2 = nums2.take(n)
  i = 0

  while !arr1.empty? && !arr2.empty?
    if arr1.first < arr2.first
      nums1[i] = arr1.shift
    else
      nums1[i] = arr2.shift
    end
    i += 1
  end

  (arr1 + arr2).each do |x|
    nums1[i] = x
    i += 1
  end
end

# @lc code=end

nums1 = [1, 2, 3, 0, 0, 0]
merge(nums1, 3, [2, 5, 6], 3)
puts nums1
