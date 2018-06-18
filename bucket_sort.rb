arr = [9,1,8,2,7,3,6,4,5,0,10]

def bucket_sort(arr)
  result = []
  max = arr.max
  arr_size = arr.size
  bucket = Array.new(arr_size) { [] }
  
  arr.each_with_index do |n, i|
    bucket_index = n * arr_size / (max + 1) # <<< The key formular.
    bucket[bucket_index] << n
  end

  bucket.each do |list|
    list.each do |n|
      result << n
    end
  end

  result
end

p bucket_sort arr