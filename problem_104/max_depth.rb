# frozen_string_literal: true

require 'json'
require './tree_node.rb'

class MaxDepth
  # @param {TreeNode} root
  # @return {Integer}
  def call(root)
    return 0 if root.nil?
    stack = []
    depth = 1
    max_depth = depth
    stack.append([root, depth])
    while stack.length > 0
      current_node, depth = stack.pop
      max_depth = [max_depth, depth].max
      if current_node&.right != nil
        stack.append([current_node.right, depth+1])
      end
      if current_node&.left != nil
        stack.append([current_node.left, depth+1])
      end
    end
    max_depth
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = MaxDepth.new

data.each do |key, example|
  puts "RUN #{key.inspect} with root: #{example["root"].inspect}"
  root = TreeNode.build(example["root"])
  result = test_object.call(root)
  puts "RESULT #{result.inspect}"
end
