# frozen_string_literal: true

i = 0
dir = File.dirname(__FILE__)
array = File.readlines("#{dir}/input.txt").map(&:to_i)
array.each_with_index do |_, idx|
  next if idx.zero? || idx >= array.length - 2

  i += 1 if array[idx - 1] < array[idx + 2]
end

puts i
