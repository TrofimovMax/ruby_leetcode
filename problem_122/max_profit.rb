# frozen_string_literal: true

require 'json'

class MaxProfit
  # @param {Integer[]} prices
  # @return {Integer}
  def call(prices)
    # bad version
    # sum = 0
    # differences = prices.map.with_index do |price, i|
    #    i < prices.length-1 ? prices[i+1] - price : nil
    # end
    # differences.pop
    # puts differences.inspect
    # differences.each { |difference| sum += difference if difference > 0 }
    # sum
    prices.each_cons(2).sum { |a, b| [b - a, 0].max }
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = MaxProfit.new

data.each do |key, example|
  puts "RUN #{key.inspect} with prices: #{example["prices"].inspect}"
  result = test_object.call(example["prices"])
  puts result.inspect
end
