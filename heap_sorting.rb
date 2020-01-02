class MaxHeap
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
    return @tree.pop if @tree.size <= 1

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
      if @tree[left] > @tree[parent]
        swap parent, left
        bottom_to_up_sort parent
      end
    else
      max_node = @tree[left] > @tree[right] ? left : right
      if @tree[max_node] > @tree[parent]
        swap parent, max_node
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
      if @tree[left] > @tree[parent]
        swap parent, left
        # no right, means already bottom, no need recurse
      end
    else
      max_node = @tree[left] > @tree[right] ? left : right
      if @tree[max_node] > @tree[parent]
        swap parent, max_node
        up_to_bottom_sort max_node
      end
    end
  end
end

# p sort [4, 1, 6, 8, 9, 2, 3]
nums = Array.new(rand(10)) { rand(100) }
heap = MaxHeap.new(nums)
heap.push 100
p heap.pop == 100
