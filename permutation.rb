# k elements in n permutation
def permute(nums, k)
  @result, @nums, @k = [], nums, k
  dfs []
  @result
end

def dfs(arr)
  @result << arr if arr.size == @k
  (@nums - arr).each { |n| dfs arr + [n] }
end

p permute [1, 2, 3, 4], 3
