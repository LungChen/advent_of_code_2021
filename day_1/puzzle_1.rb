# frozen_string_literal: true

i = 0
prev = nil
dir = File.dirname(__FILE__)
File.readlines("#{dir}/input.txt").map(&:to_i).each do |line|
  i += 1 if !prev.nil? && line > prev
  prev = line
end

puts i
