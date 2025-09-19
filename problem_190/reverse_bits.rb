# frozen_string_literal: true

require 'json'

class ReverseBits
  # @param {Integer} n
  # @return {Integer}
  def call(n)
    num_bits = 32
    reversed_n = 0

    (0...num_bits).each do |i|
      bit = (n >> i) & 1
      reversed_n |= (bit << (num_bits - 1 - i))
    end
    reversed_n
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = ReverseBits.new

data.each do |key, example|
  puts "RUN #{key.inspect} with n: #{example["n"].inspect}"
  result = test_object.call(example["n"])
  puts "RESULT #{result.inspect}"
end
