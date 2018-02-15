require 'benchmark'
require "pp"

# def three_sum(nums)
#   results = []
#   nums = nums.sort
#   index = 0
#   num_with_index = {}
#
#   nums.each_with_index {|n, i| num_with_index[n] = i }
#
#   nums.each_with_index do |num, i|
#     j = 0
#     while j++
#       low = num[i + 1] # low pointer
#       high = num[j)] # high pointer
#       if num_with_index[-(low + high)]
#         results << [num, low, high]
#       end
#     end
#   end
#   results
# end

# def three_sum(nums)
#   results = {}
#   nums = nums.sort
#   nums.combination(3).each do |combs|
#     results[combs] = 1 if (combs[0] + combs[1] + combs[2]) == 0
#   end
#   results.keys
# end
#
# puts Benchmark.measure {
#   three_sum([-1, 0, 1, 2, -1, -4])
# }


def test nums
  nums = nums.sort
  bound = (0...nums.size).bsearch { |i| nums[i] >= 0 }
  return [] if bound.nil?

  result = []
  0.upto(bound) do |ai|
    next if ai > 0 && nums[ai] == nums[ai - 1]

    subsum = - nums[ai]
    bi, ci = ai + 1, nums.size - 1
    next unless subsum >= (nums[bi] || 0) * 2

    while bi < ci
      case nums[bi] + nums[ci] <=> subsum
      when -1
        bi += 1
      when  1
        ci -= 1
      when  0
        result << [nums[ai], nums[bi], nums[ci]]
        bi += 1
        bi += 1 while bi < ci && nums[bi] == nums[bi - 1]
        ci -= 1
        ci -= 1 while bi < ci && nums[ci] == nums[ci + 1]
      end
    end
  end
  result
end

def three_sum(nums)
  results = []
  nums.sort!
  nums_size = nums.size

  0.upto(nums_size - 2).each do |i|
    next if i > 0 && nums[i] == nums[i - 1] # 防止两个相邻的数一样
    low_index = i + 1
    high_index = nums_size - 1
    expected_sum = - nums[i]

    while low_index < high_index
      if nums[low_index] + nums[high_index] > expected_sum
        high_index -= 1
      elsif nums[low_index] + nums[high_index] < expected_sum
        low_index += 1
      else
        results << nums.values_at(i, low_index, high_index)
        # 防止两个相邻的数一样
        low_index += 1 while low_index < high_index && nums[low_index] == nums[low_index + 1]
        # high_index -= 1 while low_index < high_index && nums[high_index] == nums[high_index - 1]

        low_index += 1
        high_index -= 1
      end
    end
  end
  results
end

puts Benchmark.measure {
  pp three_sum([-1, 0, 1, 0, 1, 2, 1, 2, -1, -4])
}
