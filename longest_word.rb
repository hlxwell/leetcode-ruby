require 'pp'
require_relative 'lib/tree_helper'

# words = ["a", "banana", "app", "appl", "ap", "apply", "apple"]
words = ["t","ti","tig","tige","tiger","e","en","eng","engl","engli","englis","english","h","hi","his","hist","histo","histor","history"]

################### None-Trie solution
# def longest_word words
#   dictionary = {}
#   words.sort! {|a, b| [b.size, a] <=> [a.size, b] }
#   words.each { |word| dictionary[word] = word }
#   words.detect do |word|
#     0.upto(word.size - 1).all? do |n|
#       !dictionary[word[0..n]].nil?
#     end
#   end
# end

################### Trie solution
def longest_word words
  root = TrieTreeNode.new nil
  dictionary = {}

  # build trie tree
  words.each do |word|
    dictionary[word] = word
    build_trie_for_word root, nil, word
  end

  bfs_trie root, dictionary
end

def build_trie_for_word node, parent_char, word
  return node if word.nil? or word.size == 0

  first_char = word[0]
  rest_chars = word[1..-1]
  parent_chars = "#{parent_char}#{first_char}"

  if node.nodes[first_char].nil?
    node.nodes[first_char] = TrieTreeNode.new(parent_chars)
  end

  if rest_chars.size > 0
    build_trie_for_word node.nodes[first_char], parent_chars, rest_chars
  end
end

# Breadth First Search
# 先遍历每个分支，直到最后相同长度的分支进行比较字符串的大小。
def bfs_trie root, dictionary
  return if root.nil?

  queue = root.nodes.values
  longest_word = ""

  while queue.size > 0
    node = queue.shift

    # 获得当前最长的词
    if !dictionary[node.val].nil? && node.val.size >= longest_word.size
      if node.val.size == longest_word.size
        longest_word = [node.val, longest_word].min
      else
        longest_word = node.val
      end
    end

    # 把子分支上的元素放到队列
    if !dictionary[node.val].nil? && node.nodes.values.size > 0
      queue.push *node.nodes.values
    end
  end

  longest_word
end

pp longest_word words