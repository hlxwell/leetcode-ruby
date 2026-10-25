def max_subarray_len arr
    return arr.size if arr.size <= 2

    result = -1
    current_len = 1
    b_arr = arr[0..1]
    start_ptr, end_ptr = 0, 1
    1.upto(arr.size - 1) do |i|
        end_ptr = i

        if b_arr.include?(arr[end_ptr])
            current_len = (end_ptr - start_ptr) + 1
            result = current_len if current_len > result
        else
            start_ptr = i - 1
            current_len = 1
            b_arr = arr[start_ptr..end_ptr]
        end
    end
    result
end

puts max_subarray_len [1,2,1,2,1,2,3,4,3,4,4,4,3] # => 7
puts max_subarray_len [1,2,1,2,1,2,3,4,3,4] # => 6
puts max_subarray_len [2,2] # => 2
puts max_subarray_len [1,2,1] # => 3
puts max_subarray_len [1] # => 1
