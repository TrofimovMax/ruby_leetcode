# frozen_string_literal: true

require 'json'

class ClimbStairs
  # @param {Integer} n
  # @return {Integer}
  def call(n)
    climb_stairs(n)
  end

  private

  def climb_stairs(n, memo = {})
    if n == 1
      1
    elsif n == 2
      2
    else
      return memo[n] if memo.key?(n)

      memo[n] = climb_stairs(n - 1, memo) + climb_stairs(n - 2, memo)
      memo[n]
    end
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = ClimbStairs.new

data.each do |key, example|
  puts "RUN #{key.inspect} with n: #{example["n"].inspect}"
  result = test_object.call(example["n"])
  puts "RESULT #{result.inspect}"
end
