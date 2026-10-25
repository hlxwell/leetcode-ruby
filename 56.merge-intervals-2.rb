def merge_intervals arr
  arr = arr.sort
  result = []
  while arr.size > 0
    item = arr.shift
    stack_top = result.last
    if result.empty?
      result << item
      next
    else
      if stack_top.last >= item.first && stack_top.last <= item.last
        result[result.size-1] = [stack_top.first, item.last]
      elsif stack_top.last < item.first
        result << item
      elsif stack_top.last > item.first
        # noops
      end
    end
  end
  result
end

puts merge_intervals([[1,3], [2,4], [16,18], [9, 20]]).inspect

