# frozen_string_literal: true

require 'json'
require './tree_node.rb'

class AverageOfLevels
  # @param {TreeNode} root
  # @return {Float[]}
  def call(root)
    if root.nil?
      []
    else
      result = []
      queue = [root]

      while queue.length > 0
        size = queue.length
        level_sum = 0
        size.times do
          node = queue.shift
          unless node.nil?
            level_sum += node.val.to_i
            children = [node.left, node.right].compact
            children.each do |child|
              queue.push(child)
            end
          end
        end
        average = level_sum.to_f / size
        result.append(average)
      end
    end

    result
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = AverageOfLevels.new

data.each do |key, example|
  # BFS algorithm
  # https://kirillshevch.medium.com/bfs-and-dfs-algorithms-in-ruby-9372e563fdd7#:~:text=BFS%20(Breadth%2Dfirst%20search)
  puts "RUN #{key.inspect} with root: #{example["root"].inspect}"
  root = TreeNode.build(example["root"])
  result = test_object.call(root)
  puts "RESULT #{result.inspect}"
end
