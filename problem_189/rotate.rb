# frozen_string_literal: true

require 'json'

class Rotate
  # @param {Integer[]} nums
  # @param {Integer} k
  # @return {Void} Do not return anything, modify nums in-place instead.
  def call(nums, k)
    # best solution
    # nums.rotate!(-k)
    k.times do
      last = nums.pop
      nums.unshift(last)
    end
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = Rotate.new

data.each do |key, example|
  puts "RUN #{key.inspect} with nums: #{example["nums"].inspect}; k: #{example["k"]}"
  result = test_object.call(example["nums"], example["k"])
  puts result.inspect
end
