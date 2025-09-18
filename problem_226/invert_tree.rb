# frozen_string_literal: true

require 'json'
require './tree_node.rb'

class InvertTree
  # @param {TreeNode} root
  # @return {TreeNode}
  def call(root)
    if root.nil?
      []
    else
      stack = []
      stack.append(root)
      while stack.length > 0
        current_node = stack.pop
        unless current_node.nil?
          current_node.left, current_node.right = current_node.right, current_node.left
          unless current_node.right.nil?
            stack.append(current_node.right)
          end
          unless current_node.left.nil?
            stack.append(current_node.left)
          end
        end
      end

      root
    end
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = InvertTree.new

data.each do |key, example|
  puts "RUN #{key.inspect} with root: #{example["root"].inspect}"
  root = TreeNode.build(example["root"])
  result = test_object.call(root)
  puts "RESULT #{result.inspect}"
end
