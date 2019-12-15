# Two numbers after xor will be 0
def single_number(nums)
  nums.inject(:^)
end

puts single_number([4, 1, 2, 1, 2])
