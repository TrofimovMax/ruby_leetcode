# frozen_string_literal: true

require 'json'

class MaxProfit
  # @param {Integer[]} prices
  # @return {Integer}
  def call(prices)
    profit = 0
    min_price = 10**4 + 1

    prices.each do |price|
      if price < min_price
        min_price = price
      else
        new_profit = price - min_price
        profit = new_profit if new_profit > profit
      end
    end

    profit
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = MaxProfit.new

data.each do |key, example|
  # O(n) solution
  result = test_object.call(example["prices"])
  pp result
end
