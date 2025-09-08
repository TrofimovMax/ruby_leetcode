# frozen_string_literal: true

require 'json'

class IsSubsequence
  # @param {String} s
  # @param {String} t
  # @return {Boolean}
  def call(s, t)
    i = 0
    j = 0

    while i < s.length && j < t.length
      if s[i] == t[j]
        i += 1
      end
      j += 1
    end

    i == s.length
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = IsSubsequence.new

data.each do |key, example|
  # O(n) solution
  result = test_object.call(example["s"], example["t"])
  pp result
end
