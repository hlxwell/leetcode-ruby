def find_median_sorted_arrays(nums1, nums2)
  return 0.0 if nums1.empty? && nums2.empty?

  all_nums = (nums1 + nums2).sort
  return all_nums.first.to_f if all_nums.size == 1

  if all_nums.size.odd?
    return all_nums[all_nums.size / 2] * 1.0
  else
    return (all_nums[(all_nums.size / 2).floor - 1] + all_nums[(all_nums.size / 2).floor]) / 2.0
  end
end

puts find_median_sorted_arrays([1, 2, 3], [2, 3, 4]).inspect
puts find_median_sorted_arrays([], [2, 3, 4]).inspect
puts find_median_sorted_arrays([], []).inspect
puts find_median_sorted_arrays([], [2, 3, 8]).inspect
puts find_median_sorted_arrays([1, 3], [2]).inspect
puts find_median_sorted_arrays([2], [1, 3]).inspect
