# frozen_string_literal: true

require 'json'

class MySQRT
  # @param {Integer} x
  # @return {Integer}
  def call(x)
    left = 0
    right = x

    while left <= right
      middle_pos = (left + right) / 2

      if middle_pos * middle_pos == x
        return middle_pos
      elsif middle_pos * middle_pos < x
        left = middle_pos + 1
      else
        right = middle_pos - 1
      end
    end

    right
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = MySQRT.new

data.each do |key, example|
  puts "RUN #{key.inspect} with x: #{example["x"].inspect}"
  result = test_object.call(example["x"])
  puts "RESULT #{result.inspect}"
end
