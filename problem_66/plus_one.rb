# frozen_string_literal: true

require 'json'

class PlusOne
  # @param {Integer[]} digits
  # @return {Integer[]}
  def call(digits)
    size = digits.length - 1
    while size >= 0
      digits[size] += 1

      if digits[size] == 10
        digits[size] = 0
      else
        break
      end
      size -= 1
    end

    digits.first == 0 ? digits.unshift(1) : digits
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = PlusOne.new

data.each do |key, example|
  puts "RUN #{key.inspect} with digits: #{example["digits"].inspect}"
  result = test_object.call(example["digits"])
  puts "RESULT #{result.inspect}"
end
