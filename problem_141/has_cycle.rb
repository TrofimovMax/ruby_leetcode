# frozen_string_literal: true

require 'json'
require 'set'
require './list_node.rb'

class HasCycle
  # @param {ListNode} head
  # @return {Boolean}
  def call(head)
    cycle_set = Set.new
    node = head
    while node
      if !cycle_set.include?(node)
        cycle_set << node
        node = node.next
      else
        return true
      end
    end

    false
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = HasCycle.new

data.each do |key, example|
  head = ListNode.build(example["head"], example["pos"])
  puts "RUN #{key.inspect} with head: #{example["head"].inspect}, pos: #{example["pos"]}"
  result = test_object.call(head)
  puts "RESULT #{result.inspect}"
end
