# frozen_string_literal: true

require 'json'

class LongestCommonPrefix
  # @param {String[]} strs
  # @return {String}
  def call(strs)
    result = ""

    strs.first.size.times do |i|
      char = strs.first[i]
      break unless strs.all? { |word| word[i] == char }
      result += char
    end

    result
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = LongestCommonPrefix.new

data.each do |key, value|
  # O(n) solution
  response = test_object.call(value["strings"])
  puts response.inspect
end
