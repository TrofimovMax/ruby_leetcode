# frozen_string_literal: true

require 'json'

class TwoSum
  # @param {Integer[]} nums
  # @param {Integer} target
  # @return {Integer[]}
  def call(nums: [], target: 0)
    result = [0, target]
    hash_nums = nums.each_with_index.to_h
    nums.each_with_index do |num, index|
      first_num = num
      second_num = target - first_num

      if hash_nums.key?(second_num) && hash_nums[second_num] != index
        result = [index, hash_nums[second_num]]
        break
      end
    end
    result
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = TwoSum.new

data.each do |key, example|
  # O(n) solution
  test_object.call(nums: example["nums"], target: example["target"])
end
