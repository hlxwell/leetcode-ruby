require 'pp'
require "benchmark"

class NumArray
  def initialize(nums)
    @nums = nums
  end

  def update(i, val)
    @nums[i] = val
  end

  def sum_range(i, j)
    sum = (i..j).to_a.inject(0) {|total, n|
      total += @nums[n]
    }
    sum
  end
end

# Your NumArray object will be instantiated and called as such:
obj = NumArray.new([3,3,7,7,8,6,3,5,4,1])
obj.update(4, 3)
pp obj.sum_range(1, 4)
pp obj.sum_range(0, 4)
obj.update(0, -3)
pp obj.sum_range(0, 4)
