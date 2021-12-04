# frozen_string_literal: true

dir = File.dirname(__FILE__)
array = []
File.open("#{dir}/input.txt").each_line do |line|
  array << line.strip.chars
end

target = ''
array.transpose.each do |a|
  target += a.max_by { |i| a.count(i) }
end

gama = target.to_i *2

last_idx = target.length - 1

# 10110 -> 01001
epsilon = last_idx.downto(0).map { |n| (~gama)[n] }.join.to_i *2

puts gama * epsilon
