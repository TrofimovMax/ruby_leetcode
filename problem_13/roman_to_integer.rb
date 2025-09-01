# frozen_string_literal: true

require 'json'

class RomanToInteger
  ROMAN_NUMERALS = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }
  # @param {String} s
  # @return {Integer}
  def call(s)
    result = 0
    numerals = s.chars
    puts numerals.inspect
    numerals.each_with_index do |char, i|
      next_key = numerals[i + 1]
      current_value = ROMAN_NUMERALS["#{char}"]
      next_value = ROMAN_NUMERALS["#{next_key}"]

      if next_value
        result += current_value < next_value ? -current_value : current_value
      else
        result += current_value
      end
    end

    result
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = RomanToInteger.new

data.each do |key, value|
  # O(n) solution
  response = test_object.call(value["string"])
  puts response.inspect
end
