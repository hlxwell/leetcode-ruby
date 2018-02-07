require 'benchmark'
require "pp"

### RUBY WAY
def two_sum(nums, target)
  Hash[(0...nums.size).to_a.combination(2).to_a.zip(nums.combination(2))].each do |k, v|
    return k if v.inject(0) {|total, n| total += n} == target
  end
end
puts Benchmark.measure {
  two_sum([2,3,5,7,9,11,4], 12) # [1, 4]
}

### FAST WAY
def two_sum(nums, target)
  num_with_index = {}
  nums.each_with_index do |num, i|
    matched_num_index = num_with_index[target - num]
    if !matched_num_index.nil?
      return [i, matched_num_index]
    end
    num_with_index[num] = i
  end
end
puts Benchmark.measure {
  two_sum([2,3,5,7,9,11,4], 12) # [1, 4]
}

