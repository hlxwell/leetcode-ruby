#
# @lc app=leetcode id=27 lang=ruby
#
# [27] Remove Element
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element_ruby_way(nums, val)
  nums.delete_if { |e| e == val }
  return nums.size
end

def remove_element_copy_way(nums, val)
  new_nums = nums.select { |n| n != val }
  new_nums.each_with_index { |n, i| nums[i] = n }
  new_nums.size
end

def remove_element(nums, val)
  i = j = 0

  if nums.size == 1
    return nums.first == val ? 0 : 1
  end

  0.upto(nums.size - 1) do |i|
    if nums[i] == val
      i.upto(nums.size - 1) do |j|
        if nums[j] != val
          nums[i], nums[j] = nums[j], nums[i]
        end
      end
    end
  end

  return nums.count { |n| n != val }
end

# @lc code=end

puts remove_element [0, 1, 2, 2, 3, 0, 4, 2], 2
