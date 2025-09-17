# frozen_string_literal: true

require 'json'
require './tree_node.rb'

class IsSameTree
  # @param {TreeNode} p
  # @param {TreeNode} q
  # @return {Boolean}
  def call(p, q)
    return true if p.nil? && q.nil?
    stack = []
    stack.append([p, q])
    while stack.length > 0
      node_p, node_q = stack.pop
      if node_p.val == node_q.val
        if node_p.right.nil? && !node_q.right.nil? || !node_p.right.nil? && node_q.right.nil?
          return false
        elsif node_p.right != nil && node_q.right != nil
          stack.append([node_p.right, node_q.right])
        end
        if node_p.left.nil? && !node_q.left.nil? || !node_p.left.nil? && node_q.left.nil?
          return false
        elsif node_p.left != nil && node_q.left != nil
          stack.append([node_p.left, node_q.left])
        end
      else
        return false
      end
    end
    true
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = IsSameTree.new

data.each do |key, example|
  puts "RUN #{key.inspect} with p: #{example["p"].inspect}; q: #{example["q"].inspect}"
  p = TreeNode.build(example["p"])
  q = TreeNode.build(example["q"])
  result = test_object.call(p, q)
  puts "RESULT #{result.inspect}"
end
