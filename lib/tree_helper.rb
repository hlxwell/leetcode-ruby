# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# 广度优先搜索
def find_node_has_nil_subtree root
  queue = [root]

  while queue.size > 0
    # 检查本身
    pointer = queue.shift
    return pointer if pointer.left.nil? or pointer.right.nil?

    # 迭代
    queue.push pointer.left if pointer.left
    queue.push pointer.right if pointer.right
  end
end


def arr_to_tree arr
  tmp_arr = arr.dup
  root = TreeNode.new(tmp_arr.shift)

  tmp_arr.each do |val|
    next if val.nil?
    new_node = TreeNode.new(val)
    node = find_node_has_nil_subtree root

    if node.left.nil?
      node.left = new_node
    else
      node.right = new_node
    end
  end

  root
end


# LNR 深度优先搜索
def get_tree_values pointer
  str_of_tree = []
  str_of_tree << pointer.val
  str_of_tree << get_tree_values(pointer.left) if !pointer.left.nil?
  str_of_tree << get_tree_values(pointer.right) if !pointer.right.nil?
  str_of_tree.flatten
end

def set_greater_node node, greater_values_mapping
  node.val = greater_values_mapping[node.val]
  set_greater_node(node.left, greater_values_mapping) if !node.left.nil?
  set_greater_node(node.right, greater_values_mapping) if !node.right.nil?
  node
end

def tree_to_str root
  queue = [root]
  str = ''

  while queue.size > 0
    # 检查本身
    pointer = queue.shift
    val = pointer.val
    str.concat val ? ",#{val.to_s}" : '^'

    # 迭代
    queue.push pointer.left if pointer.left
    queue.push pointer.right if pointer.right
  end

  str.sub(/^,/, '')
end
