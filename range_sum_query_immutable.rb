### O(n) => require O(1), also it will be called many times.
# class NumArray
#   def initialize(nums)
#     @nums = nums
#   end
#
#   def sum_range(i, j)
#     result = 0
#     i.upto(j) do |n|
#       result += @nums[n]
#     end
#     result
#   end
# end

class NumArray
  def initialize(nums)
    @nums = nums
    @cache = {0 => 0}
    0.upto(@nums.size - 1) do |i|
      @cache[i + 1] = @cache[i] + @nums[i]
    end
  end

  def sum_range(i, j)
    @cache[j + 1] - @cache[i]
  end
end

obj = NumArray.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
p obj.sum_range(1, 3)
