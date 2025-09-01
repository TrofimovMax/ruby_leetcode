# frozen_string_literal: true

require 'json'

class Merge
  # @param {Integer[]} nums1
  # @param {Integer} m
  # @param {Integer[]} nums2
  # @param {Integer} n
  # @return {Void} Do not return anything, modify nums1 in-place instead.
  def call(nums1, m, nums2, n)
    nums1[0...m+n] = (nums1.take(m) + nums2.take(n)).sort
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = Merge.new

data.each do |key, example|
  # O(n) solution
  result = test_object.call(example["nums1"], example["m"], example["nums2"], example["n"])
  pp result
end
