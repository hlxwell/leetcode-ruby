# ### Recursion way
# def rob(nums)
#   @result = 0
#   @nums = nums
#   dfs [], -1
#   @result
# end

# def dfs sub_arr, from_index
#   total = sub_arr.inject(:+) || 0
#   @result = total > @result ? total : @result
#   return if from_index > @nums.size - 1
#   (from_index + 1).upto(@nums.size - 1) do |i|
#     dfs sub_arr + [@nums[i]], i + 1
#   end
# end

# Core Forumla M(k) = [M(k−2) + k, M(k−1)].max
def rob(nums)
  return 0 if nums.nil? || nums.size == 0
  results = { 0 => nums[0] }
  1.upto(nums.size - 1) do |i|
    results[i] = [(results[i - 2] || 0) + nums[i], results[i - 1]].max
  end
  results[nums.size - 1]
end

# One line style
def rob(nums) 
  nums.inject([0,0]) { |result, n| [result[1], [result[0] + n, result[1]].max] }[1]
end

p rob [1,2,3,4,5]
# p rob [11,1,5,200,132]
# p rob [183,219,57,193,94,233,202,154,65,240,97,234,100,249,186,66,90,238,168,128,177,235,50,81,185,165,217,207,88,80,112,78,135,62,228,247,211]
