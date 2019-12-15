def move_zeroes(nums)
  0.upto(nums.size - 2) do |i|
    next if nums[i] != 0
    i.upto(nums.size - 1) do |j|
      if nums[j] != 0
        nums[i], nums[j] = nums[j], nums[i]
        break
      end
    end
  end
  nums
end

puts move_zeroes([0, 1, 0, 3, 0, 12])
