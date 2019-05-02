values = [
  [1, 2, 3],
  [4],
  [5, 6, 7, 8, 9],
]

total = values.sum &:size
selected_index = rand(total)
selected_value = nil
tmp = 0

puts selected_index

values.each_with_index do |arr, i|
  if selected_index > arr.size
    selected_index -= arr.size
  else
    selected_value = arr[selected_index]
    break
  end
end

puts selected_value
