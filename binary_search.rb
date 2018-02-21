require 'pp'
require 'benchmark'

@arr = (1..100000000).to_a

def binary_search s, e, num
  middle_index = s + (e - s) / 2
  return @arr[s] == num if (e - s) <= 1

  if num > @arr[middle_index]
    return binary_search middle_index, e, num
  elsif num < @arr[middle_index]
    return binary_search s, middle_index, num
  else
    return true
  end
end

puts Benchmark.measure { binary_search 0, @arr.size - 1, 999999 }
puts Benchmark.measure { @arr.bsearch {|n| n == 999999 } } # Ruby Native Binary Search
