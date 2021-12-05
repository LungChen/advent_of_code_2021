# frozen_string_literal: true

dir = File.dirname(__FILE__)
array = []

File.open("#{dir}/input.txt").each_line do |input_line|
  line = input_line.split('->')
  p1 = line[0].strip.split(',').map(&:to_i)
  p2 = line[1].strip.split(',').map(&:to_i)

  distance_x = p2[0] - p1[0]
  distance_y = p2[1] - p1[1]

  next unless distance_x.zero? || distance_y.zero?

  unit_x = distance_x.zero? ? 0 : distance_x / distance_x.abs
  unit_y = distance_y.zero? ? 0 : distance_y / distance_y.abs

  distance = [distance_x.abs, distance_y.abs].max + 1
  distance.times do |i|
    x = p1[0] + i * unit_x
    y = p1[1] + i * unit_y
    array[x] = [] if array[x].nil?
    array[x][y] = (array[x][y] || 0) + 1
  end
end

puts array.flatten.count { |item| !item.nil? && item >= 2 }
