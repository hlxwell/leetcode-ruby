@solutions = []

def iterate_arr(arr)
  if arr.none? { |elem| elem.is_a? Array }
    @solutions << arr
    return
  end

  # byebug
  arr.each_with_index do |elem, i|
    if elem.is_a? Array
      new_arr = arr.dup
      elem.each do |n|
        new_arr[i] = n

        iterate_arr(new_arr)
      end
      return
    end
  end
end

iterate_arr [1, 2, [3, 4], 5, [6, 7]]
pp @solutions
