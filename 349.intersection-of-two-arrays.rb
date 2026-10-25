require 'pp'
require 'set'

nums1 = [1,2,2,1]
nums2 = [2,2]

# # ruby way 1
# def intersection(nums1, nums2)
#   nums1 & nums2
# end

# # ruby way 2
# def intersection(nums1, nums2)
#   s1 = Set.new nums1
#   s2 = Set.new nums2
#   s1.intersection s2
# end

def intersection(nums1, nums2)
  s1 = arr_to_hash nums1
  s2 = arr_to_hash nums2

  result = []

  s1.each do |k, v|
    result << k if s2[k]
  end

  result
end

def arr_to_hash arr
  arr.inject(Hash.new) {|hash, n| hash[n] = n; hash}
end

pp intersection nums1, nums2