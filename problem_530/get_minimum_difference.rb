# frozen_string_literal: true

require 'json'
require './tree_node.rb'

class GetMinimumDifference
  # @param {TreeNode} root
  # @return {Integer}
  def call(root)
    if root.nil?
      0
    else
      stack = []
      current = root
      prev = nil
      min_diff = Float::INFINITY

      while current != nil || !stack.empty?
        while current != nil
          stack.push(current)
          current = current.left
        end
        current = stack.pop()
        unless current.nil?
          unless prev.nil?
            min_diff = [min_diff, current.val.to_i - prev].min
          end
          prev = current.val

          current = current.right
        end
      end
      min_diff
    end
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = GetMinimumDifference.new

data.each do |key, example|
  # In-order traversal for BST
  puts "RUN #{key.inspect} with root: #{example["root"].inspect}"
  root = TreeNode.build(example["root"])
  result = test_object.call(root)
  puts "RESULT #{result.inspect}"
end
