# frozen_string_literal: true

def fuel(hash, target)
  hash.map do |point, count|
    distance = (point - target).abs
    ((distance + 1) * distance) / 2 * count
  end.sum
end

def best_fuel(from, to, hash)
  prev = nil
  (from..to).to_a.each do |target|
    (prev = fuel(hash, target)) && next if prev.nil?
  
    current = fuel(hash, target)
    return prev if current > prev
    
    prev = current
  end
end

input = []
dir = File.dirname(__FILE__)
input = File.read("#{dir}/input.txt").split(',').map(&:to_i)

mid = input.sort[input.length/2]
last = (input.max - mid).abs > mid ? input.max : 0

puts best_fuel(mid, last, input.tally)
