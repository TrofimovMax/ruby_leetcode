# frozen_string_literal: true

require 'json'

class SearchInsert
  # @param {Integer[]} nums
  # @param {Integer} target
  # @return {Integer}
  def call(nums, target)
    left = 0
    right = nums.length - 1

    while left <= right
      middle_pos = (left + right) / 2

      if nums[middle_pos] == target
        return middle_pos
      elsif nums[middle_pos] < target
        left = middle_pos + 1
      else
        right = middle_pos - 1
      end
    end

    left
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = SearchInsert.new

data.each do |key, example|
  puts "RUN #{key.inspect} with nums: #{example["nums"].inspect}; target: #{example["target"].inspect}"
  result = test_object.call(example["nums"],example["target"])
  puts "RESULT #{result.inspect}"
end
