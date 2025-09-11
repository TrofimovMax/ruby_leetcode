# frozen_string_literal: true

require 'json'

class IsAnagram
  # @param {String} s
  # @param {String} t
  # @return {Boolean}
  def call(s, t)
    s.chars.tally == t.chars.tally
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = IsAnagram.new

data.each do |key, example|
  result = test_object.call(example["s"], example["t"])
  puts "RESULT #{result.inspect}"
end