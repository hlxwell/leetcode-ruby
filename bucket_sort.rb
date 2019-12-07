require "benchmark"

def insertion_sort arr
  return arr if arr.size <= 1
  result = []
  result.push arr.pop
  arr.each do |n|
    0.upto(result.size - 1) do |i|
      if n <= result[i]
        result.insert(i, n)
        break
      elsif n > result[i] and (i == (result.size - 1) or n < result[i+1])
        result.insert(i+1, n)
        break
      end
    end
  end
  result
end

def bucket_sort1(arr)
  arr_max = arr.max
  arr_size = arr.size
  bucket = Array.new(arr_size) { [] }
  arr.each_with_index do |n, i|
    bucket_index = n * arr_size / (arr_max + 1) # <<< The key formular.
    bucket[bucket_index] << n
  end
  bucket.map { |list| insertion_sort list }.flatten
end

def bucket_sort arr
  return arr if arr.size <= 1
  result = []
  mid_i = (arr.size / 2.0).ceil
  left_arr = bucket_sort(arr[0...mid_i])
  right_arr = bucket_sort(arr[mid_i..-1])
  while left_arr.size > 0 || right_arr.size > 0
    result += right_arr and break if left_arr.size == 0
    result += left_arr and break if right_arr.size == 0
    result << (left_arr.first <= right_arr.first ? left_arr.shift : right_arr.shift)
  end
  result
end

arr = 1000000.times.map { rand(100) }

puts Benchmark.measure { bucket_sort(arr) } # slowest
puts Benchmark.measure { bucket_sort1(arr) } # much better
puts Benchmark.measure { arr.sort } # native

# puts bucket_sort(arr) == bucket_sort1(arr)
