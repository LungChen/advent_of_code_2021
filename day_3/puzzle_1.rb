# frozen_string_literal: true

dir = File.dirname(__FILE__)
array = []
File.open("#{dir}/input.txt").each_line do |line|
  array << line.strip.chars
end

max_times = ''
array.transpose.each do |a|
  max_times += a.max_by { |i| a.count(i) }
end

gama = max_times.to_i *2

last_idx = max_times.length - 1
epsilon = last_idx.downto(0).map { |n| (~gama)[n] }.join.to_i *2

puts gama * epsilon
