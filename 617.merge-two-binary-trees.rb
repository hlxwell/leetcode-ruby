require 'pp'
require 'pry'
require_relative "lib/tree_helper"

t1 = arr_to_tree [1,3,2,5]
t2 = arr_to_tree [2,1,3,nil,4,nil,7]

# slow method
def merge_trees_slow t1, t2
  t1_arr = tree_to_arr t1
  t2_arr = tree_to_arr t2

  if t1_arr.size > t2_arr.size
    bigger_arr = t1_arr
    smaller_arr = t2_arr
  else
    bigger_arr = t2_arr
    smaller_arr = t1_arr
  end

  merged_arr = bigger_arr.zip(smaller_arr).map do |pair|
    if pair.compact.size == 0
      nil
    else
      pair.inject(0) {|total, i| total += i.to_i}
    end
  end
  arr_to_tree merged_arr
end

def merge_trees t1, t2
  return nil if t1.nil? && t2.nil?
  return t1 if t2.nil?
  return t1 = t2.dup if t1.nil? && !t2.nil?

  t1.val += t2.val.to_i
  t1.left = merge_trees t1.left, t2.left
  t1.right = merge_trees t1.right, t2.right
  t1
end

pp tree_to_arr merge_trees t1, t2
