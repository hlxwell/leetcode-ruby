#
# @lc app=leetcode id=23 lang=ruby
#
# [23] Merge k Sorted Lists
#

def merge_k_lists(lists)
  return nil if lists.empty? || lists.size == 0
  return lists.first if lists.size == 1

  heap = MinHeap.new(lists.compact.select { |e| e.is_a? ListNode })
  head = current = ListNode.new(0)

  while el = heap.pop
    current.next = el
    current = current.next
    el = el.next
    if el.is_a? ListNode
      heap.push el
    end
  end
  head.next
end

class MinHeap
  attr_accessor :tree

  def initialize(nums)
    @tree = []
    nums.each { |num| self.push num }
  end

  # bottom to top recursively swap
  def push(num)
    @tree << num
    bottom_to_up_sort
  end

  # top to bottom recursively swap
  def pop
    return @tree.pop if @tree.size == 1

    top_node = @tree.shift
    last_node = @tree.pop
    @tree.unshift last_node
    up_to_bottom_sort
    top_node
  end

  def sorted_result
    result = []
    loop do
      num = pop
      break if num.nil?
      result << num
    end
    result
  end

  private

  def swap(a, b)
    @tree[a], @tree[b] = @tree[b], @tree[a]
  end

  # i always be the left/right leaf
  def bottom_to_up_sort(i = nil)
    i ||= @tree.size - 1
    return if i.zero?

    parent = ((i - 1) / 2).floor
    left = parent * 2 + 1
    right = left + 1

    if @tree[right].nil?
      if @tree[left].val < @tree[parent].val
        swap parent, left
        bottom_to_up_sort parent
      end
    else
      min_node = @tree[left].val < @tree[right].val ? left : right
      if @tree[min_node].val < @tree[parent].val
        swap parent, min_node
        bottom_to_up_sort parent
      end
    end
  end

  # i always be the root
  def up_to_bottom_sort(i = 0)
    return if i >= @tree.size

    parent = i
    left = parent * 2 + 1
    right = left + 1

    return if @tree[left].nil?

    if @tree[right].nil?
      if @tree[left].val < @tree[parent].val
        swap parent, left
        # no right, means already bottom, no need recurse
      end
    else
      min_node = @tree[left].val < @tree[right].val ? left : right
      if @tree[min_node].val < @tree[parent].val
        swap parent, min_node
        up_to_bottom_sort min_node
      end
    end
  end
end

# @lc code=end
