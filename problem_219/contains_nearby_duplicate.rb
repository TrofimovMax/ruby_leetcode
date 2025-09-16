# frozen_string_literal: true

require 'json'

class ContainsNearbyDuplicate
  # @param {Integer[]} nums
  # @param {Integer} k
  # @return {Boolean}
  def call(nums, k)
    hash_map = {}

    nums.each_with_index do |num, i|
      if hash_map.key?(num)
        j = hash_map[num]
        (i - j).abs <= k ? return true : hash_map[num] = i
      else
        hash_map[num] = i
      end
    end

    false
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = ContainsNearbyDuplicate.new

data.each do |key, example|
  puts "RUN #{key.inspect} with nums: #{example["nums"]}, k = #{example["k"]}"
  result = test_object.call(example["nums"], example["k"])
  puts "RESULT #{result.inspect}"
end