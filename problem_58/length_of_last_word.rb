# frozen_string_literal: true

require 'json'

class LengthOfLastWord
  # @param {String} s
  # @return {Integer}
  def call(s)
    s.split.last.size
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = LengthOfLastWord.new

data.each do |key, example|
  # O(n) solution
  result = test_object.call(example["string"])
  puts result.inspect
end
