# frozen_string_literal: true

require 'json'

class MajorityElement
  # @param {Integer[]} nums
  # @return {Integer}
  def call(nums)
    nums.tally.max_by { |_, count| count }.first
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = MajorityElement.new

data.each do |key, example|
  # O(n) solution
  result = test_object.call(example["nums"])
  pp result
end
