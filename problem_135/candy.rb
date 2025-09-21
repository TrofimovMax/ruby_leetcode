# frozen_string_literal: true

require 'json'

class Candy
  # @param {Integer[]} ratings
  # @return {Integer}
  def call(ratings)
    n = ratings.length
    candies = Array.new(n, 1)

    take_candy_direction(1, ratings, candies, :right)
    take_candy_direction(n - 2, ratings, candies, :left)

    candies.sum
  end

  def take_candy_direction(index, ratings, candies, direction)
    step = direction == :right ? 1 : -1

    while index >= 0 && index < ratings.length
      neighbor = index - step
      if ratings[index] > ratings[neighbor]
        candies[index] = [candies[index], candies[neighbor] + 1].max
      end
      index += step
    end
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = Candy.new

data.each do |key, example|
  puts "RUN #{key.inspect} with ratings: #{example["ratings"].inspect}"
  result = test_object.call(example["ratings"])
  puts "RESULT #{result.inspect}"
end
