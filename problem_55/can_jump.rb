# frozen_string_literal: true

require 'json'

class CanJump
  # @param {Integer[]} nums
  # @return {Boolean}
  def call(nums)
    max_reach = 0
    nums.each_with_index do |num, i|
      if i > max_reach
        return false
      else
        max_reach = [max_reach, nums[i] + i].max
      end
    end

    max_reach >= nums.length - 1
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = CanJump.new

data.each do |key, example|
  puts "RUN #{key.inspect} with nums: #{example["nums"].inspect}"
  result = test_object.call(example["nums"])
  puts result.inspect
end
