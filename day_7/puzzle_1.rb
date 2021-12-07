# frozen_string_literal: true

def fuel(hash, target)
  hash.map do |point, count|
    (point - target).abs * count
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
avg = input.sum / input.length

puts best_fuel(mid, avg, input.tally)
