require "pp"
require "benchmark"

def binary_search(s, e, num)
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

# @arr = (1..100000000).to_a
# puts Benchmark.measure { binary_search 0, @arr.size - 1, 999999 }
# puts Benchmark.measure { @arr.bsearch { |n| n == 999999 } } # Ruby Native Binary Search

def find_index(arr, target)
  s, e = 0, arr.size - 1

  while s < e
    mid = s + ((e - s) / 2.0).ceil
    if target < arr[mid]
      e = mid
    elsif target > arr[mid]
      s = mid
    else
      return mid
    end
  end
  return -1
end

puts find_index([1, 2, 3, 4, 5, 6], 5)
