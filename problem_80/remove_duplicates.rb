# frozen_string_literal: true

require 'json'

class RemoveDuplicates
  # @param {Integer[]} nums
  # @return {Integer}
  def call(nums)
    hash = {}
    index = 0
    while index < nums.length
      if hash.key?(nums[index]) && hash[nums[index]] < 2
        hash[nums[index]] += 1
      elsif hash.key?(nums[index]) && hash[nums[index]] > 1
        nums.delete_at(index)
        index -= 1
      else
        hash[nums[index]] = 1
      end
      index += 1
    end

    nums.length
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = RemoveDuplicates.new

data.each do |key, example|
  puts "RUN #{key.inspect} with nums: #{example["nums"].inspect}"
  result = test_object.call(example["nums"])
  puts result.inspect
end
