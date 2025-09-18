# frozen_string_literal: true

require 'json'
require './tree_node.rb'

class HasPathSum
  # @param {TreeNode} root
  # @param {Integer} target_sum
  # @return {Boolean}
  def call(root, target_sum)
    if root.nil?
      0
    else
      stack = []
      stack.append([root, 0])

      while stack.length > 0
        current_node, current_sum = stack.pop
        sum = current_sum + current_node&.val.to_i

        unless current_node.nil?
          if current_node.left.nil? && current_node.right.nil?
            return true if sum == target_sum
          end
          stack.append([current_node.right, sum]) unless current_node.right.nil?
          stack.append([current_node.left, sum]) unless current_node.left.nil?
        end
      end
    end

    false
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = HasPathSum.new

data.each do |key, example|
  puts "RUN #{key.inspect} with root: #{example["root"].inspect}; targetSum: #{example["target_sum"]}"
  root = TreeNode.build(example["root"])
  result = test_object.call(root, example["target_sum"])
  puts "RESULT #{result.inspect}"
end
