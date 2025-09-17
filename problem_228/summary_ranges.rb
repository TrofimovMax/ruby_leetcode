# frozen_string_literal: true

require 'json'

class SummaryRanges
  # @param {Integer[]} nums
  # @return {String[]}
  def call(nums)
    return [] if nums.empty?
    start = nums.first
    prev = nums.first
    result = []

    (1...nums.length).each do |i|
      if nums[i] == prev + 1
        prev = nums[i]
      else
        result << (start == prev ? start.to_s : "#{start}->#{prev}")
        start = nums[i]
        prev = nums[i]
      end
    end
    result << (start == prev ? start.to_s : "#{start}->#{prev}")
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = SummaryRanges.new

data.each do |key, example|
  puts "RUN #{key.inspect} with nums: #{example["nums"]}"
  result = test_object.call(example["nums"])
  puts "RESULT #{result.inspect}"
end
