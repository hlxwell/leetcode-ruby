def find_max_consecutive_ones(nums)
  result = []
  tmp = []
  while nums.size > 0
    num = nums.pop
    tmp << num if num == 1
    result = tmp if tmp.size > result.size
    tmp = [] if num == 0
  end
  result.size
end

p find_max_consecutive_ones [1,1,0,1]