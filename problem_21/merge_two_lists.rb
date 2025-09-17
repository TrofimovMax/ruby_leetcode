# frozen_string_literal: true

require 'json'
require 'set'
require './list_node.rb'

class MergeTwoLists
  # @param {ListNode} list1
  # @param {ListNode} list2
  # @return {ListNode}
  def call(list1, list2)
    if list1.is_a?(ListNode) && list2.is_a?(ListNode)
      dummy = ListNode.new(nil)
      current = dummy
      node1 = list1
      node2 = list2
      while node1 && node2
        if node1.val < node2.val
          current.next = node1
          node1 = node1.next
        else
          current.next = node2
          node2 = node2.next
        end
        current = current.next
      end
      if node1
        current.next = node1
      elsif node2
        current.next = node2
      end
      dummy.next
    elsif list1.is_a?(ListNode) && list2.nil?
      return list1
    elsif list1.nil? && list2.is_a?(ListNode)
      return list2
    else
      []
    end
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = MergeTwoLists.new

data.each do |key, example|
  list1 = ListNode.build(example["list1"])
  list2 = ListNode.build(example["list2"])
  puts "RUN #{key.inspect} with list1: #{example["list1"].inspect}, list2: #{example["list2"]}"
  result = test_object.call(list1, list2)
  puts "RESULT #{result.inspect}"
end
