nums = [1, 2, 3]

def permute(nums)
  @result = []
  dfs nums, []
  @result
end

def dfs nums, tmp
  @result << tmp if tmp.size == nums.size
  (nums - tmp).each { |n| dfs nums, tmp + [n] }
end

p permute nums