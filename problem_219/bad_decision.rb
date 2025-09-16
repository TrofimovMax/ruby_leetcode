# frozen_string_literal: true

require 'json'

class ContainsNearbyDuplicate
  # @param {Integer[]} nums
  # @param {Integer} k
  # @return {Boolean}
  def call(nums, k)
    i = 0
    puts "START"
    while i < nums.length - 1
      j = i + 1
      while j <= nums.length
        # puts "i= #{i}, j= #{j}"
        # puts "#{nums[i]} == #{nums[j]} && ABS(#{i} - #{j}) <= #{k}"
        return true if nums[i] == nums[j] && (i - j).abs <= k
        j += 1
      end
      i += 1
    end
    false
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = ContainsNearbyDuplicate.new

data.each do |key, example|
  # puts "RUN #{key.inspect} with nums: #{example["nums"]}, k = #{example["k"]}"
  result = test_object.call(example["nums"], example["k"])
  puts "RESULT #{result.inspect}"
end