# frozen_string_literal: true

require 'json'

class ValidPalindrome
  # @param {String} s
  # @return {Boolean}
  def call(s)
    s = s.gsub(/[^a-zA-Z0-9]/, '').downcase
    s == s.reverse
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = ValidPalindrome.new

data.each do |key, example|
  result = test_object.call(example["string"])
  pp result
end
