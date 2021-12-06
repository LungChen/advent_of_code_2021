# frozen_string_literal: true

def init(arr)
  # 倒數幾天生小魚array, idx:倒數天數, value:幾隻魚
  result = Array.new(9, 0)
  arr.each do |idx|
    result[idx] += 1
  end
  result
end

def after_days(array, days)
  days.times do 
    fish = array.shift
    array[6] += fish
    array << fish # new born
  end
  array.sum
end

input = []
dir = File.dirname(__FILE__)
input = File.read("#{dir}/input.txt").split(',').map(&:to_i)
array = init(input)

puts after_days(array, 256)
