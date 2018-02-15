require 'pp'

# [1,4,3,2] => [1,2], [3,4] = 4
# [1,4,3,2,5,9] => [1,2], [3,4], [5,9] = 9

arr = [1,4,3,2,5,9]

def array_pair_sum nums
  nums.sort!
  pairs = []
  while nums.size > 0
    pairs << nums.pop(2)
  end
  pairs.inject(0) { |total, pair| total += pair.min }
end

pp array_pair_sum arr


