def quick_sort arr
  return arr if arr.size <= 1

  pivot_i = arr.size - 1
  left_i = 0
  right_i = pivot_i - 1

  while left_i < right_i
    left_i.upto(pivot_i) do |i|
      left_i = i
      break if arr[left_i] > arr[pivot_i]
    end

    right_i.downto(left_i) do |j|
      right_i = j
      break if arr[right_i] < arr[pivot_i]
    end

    arr[left_i], arr[right_i] = arr[right_i], arr[left_i]
  end

  # 1. left == right
  # 2. left == pivot
  if arr[left_i] > arr[pivot_i]
    arr[left_i], arr[pivot_i] = arr[pivot_i], arr[left_i]
  end

  pivot_i = left_i
  left_side = pivot_i == 0 ? [] : arr[0..(pivot_i-1)]
  right_side = arr[(pivot_i+1)..(arr.size-1)]

  quick_sort(left_side) + [arr[pivot_i]] + quick_sort(right_side)
end

# Better solution
def quick_sort(array)
  return array if array.size < 2
  left, right = array[1..-1].partition { |y| y <= array.first }
  quick_sort(left) + [array.first] + quick_sort(right)
end

arr = rand(10).times.map { rand(100) }
puts arr.inspect
puts quick_sort(arr).inspect
