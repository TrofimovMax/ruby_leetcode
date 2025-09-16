# frozen_string_literal: true

require 'json'

class IsHappy
  # @param {Integer} n
  # @return {Boolean}
  def call(n)
    slow = n
    fast = n

    while fast != 1
      slow = sum_of_squares(slow)
      fast = sum_of_squares(sum_of_squares(fast))
      puts "#{slow} == #{fast}}"
      if fast == 1
        return true
      elsif slow == fast && fast != 1
        return false
      end
    end
    true if fast == 1
  end

  private

  def sum_of_squares(n)
    sum = 0
    while n > 0
      sum += (n % 10)**2
      n = n / 10
    end

    sum
  end
end

file_path = File.join(__dir__, 'input.json')
data = JSON.parse(File.read(file_path))

test_object = IsHappy.new

data.each do |key, example|
  puts "RUN #{key.inspect} with #{example["n"]}"
  result = test_object.call(example["n"])
  puts "RESULT #{result.inspect}"
end