# frozen_string_literal: true

require 'json'

class RemoveElement
  # @param {Integer[]} nums
  # @param {Integer} val
  # @return {Integer}
  def call(nums, val)
    nums.select! { _1 != val }
    nums.nil? or nums.size == 0 ? [].size : nums.size
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = RemoveElement.new

data.each do |key, example|
  # O(n) solution
  result = test_object.call(example["nums"], example["val"])
  puts result.inspect
end
