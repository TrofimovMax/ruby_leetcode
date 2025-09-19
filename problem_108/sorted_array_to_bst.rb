# frozen_string_literal: true

require 'json'
require './tree_node.rb'

class SortedArrayToBST
  # @param {Integer[]} nums
  # @return {TreeNode}
  def call(nums)
    middle_size = nums.length / 2
    root = TreeNode.new(nums[middle_size])

    queue = Queue.new
    queue.push([root, 0, middle_size - 1])
    queue.push([root, middle_size + 1, nums.length - 1])

    until queue.empty?
      parent_node, left_idx, right_idx = queue.pop
      
      if left_idx <= right_idx
        middle_size = (left_idx + right_idx) / 2
        middle_node = TreeNode.new(nums[middle_size])
        
        if middle_node.val > parent_node.val
          parent_node.right = middle_node
        else 
          parent_node.left = middle_node
        end
        
        queue.push([middle_node, left_idx, middle_size - 1])
        queue.push([middle_node, middle_size + 1, right_idx])
      end
    end

    root
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = SortedArrayToBST.new

data.each do |key, example|
  puts "RUN #{key.inspect} with nums: #{example["nums"].inspect}"
  result = test_object.call(example["nums"])
  puts "RESULT #{result.inspect}"
end
