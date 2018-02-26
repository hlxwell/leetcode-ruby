def majority_element(nums)
  cache = {}
  nums.each do |n| 
    cache[n] ||= 0
    cache[n] += 1
  end
  pair = cache.detect do |k, v|
    v >= (nums.size / 2.0)
  end
  pair.first if pair
end

p majority_element [6,5,5]