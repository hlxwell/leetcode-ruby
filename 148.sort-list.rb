require 'pp'
require 'pry'
require_relative 'lib/linked_list_helper'

head = arr_to_linked_list [8,9,3,7]

def sort_list head
  return head if head.nil? or head.next.nil?

  # split list
  node = head
  list = []
  while node
    list.push node
    node = node.next
  end

  middle_index = (list.size / 2.0).ceil
  list1_head = list[0] # actually just head
  list[middle_index - 1].next = nil # cut the chain
  list2_head = list[middle_index]

  list1 = sort_list list1_head
  list2 = sort_list list2_head

  merge list1, list2
end

def merge head1, head2
  return head2 if head1.nil?
  return head1 if head2.nil?

  new_head = nil
  if head1.val > head2.val
    new_head = ListNode.new head2.val
    head2 = head2.next
  else
    new_head = ListNode.new head1.val
    head1 = head1.next
  end

  node = new_head
  while head1 && head2
    if head1.val > head2.val
      node.next = head2
      head2 = head2.next
    else
      node.next = head1
      head1 = head1.next
    end
    node = node.next
  end

  remaining_list = head1 || head2
  while remaining_list
    node.next = remaining_list
    node = node.next
    remaining_list = remaining_list.next
  end

  new_head
end

pp list_to_arr sort_list(head)
