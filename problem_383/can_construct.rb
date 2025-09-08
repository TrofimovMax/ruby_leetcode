# frozen_string_literal: true

require 'json'

class CanConstruct
  # @param {String} ransom_note
  # @param {String} magazine
  # @return {Boolean}
  def call(ransom_note, magazine)
    puts "ransom_note: #{ransom_note.inspect}, magazine: #{magazine.inspect}"
    counts = magazine.chars.tally
    ransom_note.each_char do |char|
      if counts.key?(char) && counts[char] > 0
        counts[char] -= 1
      else
        return false
      end
    end

    true
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = CanConstruct.new

data.each do |key, example|
  result = test_object.call(example["ransom_note"], example["magazine"])
  pp result
end
