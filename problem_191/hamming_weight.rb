# frozen_string_literal: true

require 'json'

class HammingWeight
  # @param {Integer} n
  # @return {Integer}
  def call(n)
    count = 0
    n.to_s(2).each_char {  |char|  count += 1 if char == '1' }
    count
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = HammingWeight.new

data.each do |key, example|
  puts "RUN #{key.inspect} with n: #{example["n"].inspect}"
  result = test_object.call(example["n"])
  puts "RESULT #{result.inspect}"
end
