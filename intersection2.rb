require 'pp'

nums1 = [1, 2]
nums2 = [1, 1]

# ### Method 1
# def intersect(nums1, nums2)
#   result = []
#   return result if nums1.size == 0 or nums2.size == 0
#
#   sorted_nums1 = sort_array nums1
#   sorted_nums2 = sort_array nums2
#
#   long_nums = short_nums = nil
#   if sorted_nums1.size > sorted_nums2.size
#     long_nums = sorted_nums1
#     short_nums = sorted_nums2
#   else
#     long_nums = sorted_nums2
#     short_nums = sorted_nums1
#   end
#
#   next_long_i = 0
#   0.upto(short_nums.size - 1) do |short_i|
#     next_long_i.upto(long_nums.size - 1) do |long_i|
#       if short_nums[short_i] == long_nums[long_i]
#         next_long_i = long_i + 1
#         result << short_nums[short_i]
#         break
#       end
#     end
#   end
#
#   result
# end
#
# def sort_array arr
#   loop do
#     changed = false
#
#     0.upto(arr.size - 2) do |i|
#       if arr[i] > arr[i+1]
#         tmp = arr[i]
#         arr[i] = arr[i + 1]
#         arr[i + 1] = tmp
#         changed = true
#       end
#     end
#
#     break if !changed
#   end
#   arr
# end

# Method 2
def intersect nums1, nums2
  result = []
  return result if nums1.size == 0 or nums2.size == 0

  counter_cache = {}
  counter_cache = nums1.inject({}) { |result, n|
    result[n] ||= 0
    result[n] += 1
    result
  }

  nums2.each do |n|
    if counter_cache[n] and counter_cache[n] > 0
      result << n
      counter_cache[n] -= 1
    end
  end
  result
end

pp intersect nums1, nums2


## What if the given array is already sorted? How would you optimize your algorithm?
# - Then I won't sort input array

## What if nums1's size is small compared to nums2's size? Which algorithm is better?
# - remove the length comparason code

## What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
# 1. to build a tree to reduce the array size, then use array to find intersection
# 2. partition the array, and do map reduce. it will be n^2 complexity compare with load everything into memory
