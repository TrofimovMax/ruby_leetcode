# frozen_string_literal: true

require 'json'

class SingleNumber
  # @param {Integer[]} nums
  # @return {Integer}
  def call(nums)
    nums.reduce(0) { |acc, num| acc ^ num }
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = SingleNumber.new

data.each do |key, example|
  puts "RUN #{key.inspect} with nums: #{example["nums"].inspect}"
  result = test_object.call(example["nums"])
  puts "RESULT #{result.inspect}"
end
