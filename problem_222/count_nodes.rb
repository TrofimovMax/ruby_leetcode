# frozen_string_literal: true

require 'json'
require './tree_node.rb'

class CountNodes
  # @param {TreeNode} root
  # @return {Integer}
  def call(root)
    if root.nil?
      0
    else
      stack = []
      count = 0
      stack.append(root)

      while stack.length > 0
        current_node = stack.pop
        count += 1
        stack.append(current_node.right) if current_node&.left
        stack.append(current_node.left) if current_node&.right
      end

      count
    end
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = CountNodes.new

data.each do |key, example|
  puts "RUN #{key.inspect} with root: #{example["root"].inspect}"
  root = TreeNode.build(example["root"])
  result = test_object.call(root)
  puts "RESULT #{result.inspect}"
end
