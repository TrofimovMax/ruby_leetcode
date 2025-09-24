# frozen_string_literal: true

require 'json'

class CanJump
  # @param {Integer[]} nums
  # @return {Boolean}
  def call(nums)
    jumps = 0
    current_end = 0
    farthest = 0
    n = nums.length

    (0..n-2).each do |index|
      farthest = [farthest, index + nums[index]].max
      if index == current_end
        jumps = jumps + 1
        current_end = farthest
      end
    end

    jumps
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
