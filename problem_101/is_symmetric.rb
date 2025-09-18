# frozen_string_literal: true

require 'json'
require './tree_node.rb'

class IsSymmetric
  # @param {TreeNode} root
  # @return {Boolean}
  def call(root)
    if root.nil?
      true
    else
      stack = []
      stack.append([root.left, root.right])

      while stack.length > 0
        current_l, current_r = stack.pop
        next if current_l.nil? && current_r.nil?
        return false if current_l.nil? || current_r.nil?
        return false if current_l.val != current_r.val

        stack.append([current_l.left, current_r.right])
        stack.append([current_l.right, current_r.left])
      end

      true
    end
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = IsSymmetric.new

data.each do |key, example|
  puts "RUN #{key.inspect} with root: #{example["root"].inspect}"
  root = TreeNode.build(example["root"])
  result = test_object.call(root)
  puts "RESULT #{result.inspect}"
end
