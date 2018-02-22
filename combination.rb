# def combine n, k
#   (0..n).to_a.combination(k).to_a
# end

def combine(n, k)
  @result = []
  dfs (1..n).to_a, [], k, 0
  @result
end

def dfs nums, tmp, comb_size, index
  @result << tmp if tmp.size == comb_size
  index.upto(nums.size - 1) do |i|
    dfs nums, tmp + [nums[i]], comb_size, i + 1
  end
end

p combine 10, 1