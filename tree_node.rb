# frozen_string_literal: true

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end

    def self.build(array)
      return nil if array.empty?

      root = TreeNode.new(array[0])
      queue = [root]
      i = 1

      while i < array.length
        parent = queue.shift

        # left child
        if array[i]
          left_node = TreeNode.new(array[i])
          parent.left = left_node
          queue << left_node
        end
        i += 1

        # right child
        if i < array.length && array[i]
          right_node = TreeNode.new(array[i])
          parent.right = right_node
          queue << right_node
        end
        i += 1
      end

      root
    end
end
