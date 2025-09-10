# frozen_string_literal: true

require 'json'

class WordPattern
  # @param {String} pattern
  # @param {String} s
  # @return {Boolean}
  def call(pattern, s)
    hash_map = {}
    reverse_hash_map = {}
    t = s.split(' ')

    return false if t.length != pattern.length

    pattern.each_char.with_index do |s_i, i|
      t_i = t[i]

      if hash_map.key?(s_i) && hash_map[s_i] != t_i
        return false
      end

      if reverse_hash_map.key?(t_i) && reverse_hash_map[t_i] != s_i
        return false
      end

      hash_map[s_i] = t_i
      reverse_hash_map[t_i] = s_i
    end

    true
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = WordPattern.new

data.each do |key, example|
  result = test_object.call(example["pattern"], example["s"])
  puts "RESULT #{result.inspect}"
end