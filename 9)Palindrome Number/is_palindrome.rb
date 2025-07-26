# frozen_string_literal: true

require 'json'

class IsPalindrome
  # @param {Integer} x
  # @return {Boolean}
  def call(x)
    s = x.to_s
    s == s.reverse
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = IsPalindrome.new

data.each do |key, example|
  # O(n) solution
  result = test_object.call(example["x"])
  pp result
end
