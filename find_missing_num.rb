def missing_number(arr)
  return if arr.size == 0

  cache = {}
  max = arr.first
  arr.each do |item|
    max = item if item > max
    cache[item] = true
  end

  0.upto(max).each do |i|
    return i if !cache[i]
  end
  max + 1
end

# since it is from 0, so you can use math
# (first + last) * amount / 2
#
def missing_number_fast(arr)
  return 0 if arr.size == 0
  return 0 if arr.min != 0
  max = arr.max
  total = arr.sum
  correct_total = (0 + max) * (max + 1) / 2
  return max + 1 if total == correct_total
  correct_total - total
end

# puts missing_number([3,1,4,5,9])
# puts missing_number([0,1,2,3])

puts missing_number_fast([0,1,3,4]) == 2
puts missing_number_fast([0,1]) == 2
puts missing_number_fast([1]) == 0
puts missing_number_fast([1, 2]) == 0
puts missing_number_fast([0]) == 1
puts missing_number_fast([]) == 0

