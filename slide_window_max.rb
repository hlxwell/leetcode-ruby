def max_sliding_window(nums, k)
  return [] if k == 0 or nums.empty?
  0.upto(nums.size - k).map do |i|
    nums[i..i + k - 1].max
  end
end

puts max_sliding_window([], 0).inspect # => []
puts max_sliding_window([1, 3, -1, -3, 5, 3, 6, 7], 3).inspect # => [3,3,5,5,6,7]
