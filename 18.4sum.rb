require 'benchmark'
require 'pp'

# [1, 0, -1, 0, -2, 2]
# [-3,-2,-1,0,0,1,2,3]
nums = [-3,-2,-1,0,0,1,2,3] * 1000
target = 0

def four_sum nums, target
  result = []
  nums.sort!
  0.upto(nums.size - 3 - 1).each do |p1|
    next if p1 > 0 && nums[p1] == nums[p1 - 1] # remove redundency

    (p1 + 1).upto(nums.size - 2 - 1).each do |p2|
      next if p2 > (p1 + 1) && nums[p2] == nums[p2 - 1] # remove redundency

      p3 = p2 + 1
      p4 = nums.size - 1

      while p3 < p4
        next p3 += 1 if p3 > (p2 + 1) && nums[p3] == nums[p3 - 1] # remove redundency
        next p4 -= 1 if p4 < (nums.size - 1) && nums[p4] == nums[p4 + 1] # remove redundency

        sum = nums[p1] + nums[p2] + nums[p3] + nums[p4]
        if sum > target # p4 move left
          p4 -= 1
        elsif sum < target # p3 move right
          p3 += 1
        else
          result.push [nums[p1], nums[p2], nums[p3], nums[p4]]

          p3 += 1
          p4 -= 1
        end
      end
    end
  end
  result
end

puts Benchmark.measure { four_sum nums, target }

