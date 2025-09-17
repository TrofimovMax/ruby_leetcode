# frozen_string_literal: true

require 'json'

class IsValid
  # @param {String} s
  # @return {Boolean}
  def call(s)
    hash = {
      '{' => '}',
      '(' => ')',
      '[' => ']'
    }
    stack = []

    s.each_char do |char|
      if hash.has_key?(char)
        stack.push(char)
      elsif hash[stack.last] == char
        stack.pop
      else
        stack.push(char)
      end
    end

    stack.empty?
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = IsValid.new

data.each do |key, example|
  puts "RUN #{key.inspect} with s: #{example["s"]}"
  result = test_object.call(example["s"])
  puts "RESULT #{result.inspect}"
end
