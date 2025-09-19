# frozen_string_literal: true

require 'json'

class AddBinary
  # @param {String} a
  # @param {String} b
  # @return {String}
  def call(a, b)
    (a.to_i(2) + b.to_i(2)).to_s(2)
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = AddBinary.new

data.each do |key, example|
  puts "RUN #{key.inspect} with a: #{example["a"].inspect}; b: #{example["b"].inspect}"
  result = test_object.call(example["a"],example["b"])
  puts "RESULT #{result.inspect}"
end
