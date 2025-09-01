# frozen_string_literal: true

require 'json'

class StrStr
  # @param {String} haystack
  # @param {String} needle
  # @return {Integer}
  def call(haystack, needle)
    result = -1

    haystack.each_char.with_index do |char, index|
      if char == needle.chr
        jindex = 0
        while jindex < needle.length
          if haystack[index + jindex] == needle[jindex]
            jindex += 1
          else
            break
          end
        end
        if jindex == needle.length
          result = index
          break
        end
      end
    end

    result
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = StrStr.new

data.each do |key, example|
  # O(n) solution
  result = test_object.call(example["haystack"], example["needle"])
  puts result.inspect
end
