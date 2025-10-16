# frozen_string_literal: true

require 'json'

class HIndex
  # @param {Integer[]} citations
  # @return {Integer}
  def call(citations)
    sorted = citations.sort.reverse
    h_index = 0

    sorted.each_with_index do |citation, i|
      if citation >= i + 1
        h_index = i + 1
      else
        break
      end
    end

    h_index
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = HIndex.new

data.each do |key, example|
  puts "RUN #{key.inspect} with citations: #{example["citations"].inspect}"
  result = test_object.call(example["citations"])
  puts result.inspect
end
