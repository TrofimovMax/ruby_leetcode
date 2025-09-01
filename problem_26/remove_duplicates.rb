# frozen_string_literal: true

require 'json'

class RemoveDuplicates
  # @param {Integer[]} nums
  # @return {Integer}
  def call(nums)
    nums.uniq!
    nums.size
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = RemoveDuplicates.new

data.each do |key, example|
  # O(n) solution
  result = test_object.call(example["nums"])
  puts result.inspect
end
