# frozen_string_literal: true

def adjacent_value(arr)
  result = -1
  cache = {}
  arr.each_with_index do |item, i| # O(n)
    cache[item] ||= []
    cache[item] << i
  end
  sorted_uniq_keys = cache.keys.sort # O(n*ln(n))
  0.upto(sorted_uniq_keys.size - 2) do |i| # O(n)
    a = cache[sorted_uniq_keys[i]]
    b = cache[sorted_uniq_keys[i + 1]]
    result = (a[0] - b[-1]).abs if (a[0] - b[-1]).abs > result
    result = (a[-1] - b[0]).abs if (a[-1] - b[0]).abs > result
  end

  result
end

puts adjacent_value [0, 3, 3, 7, 5, 3, 11, 1] # => 7
puts adjacent_value [1, 4, 7, 3, 3, 5] # => 4
