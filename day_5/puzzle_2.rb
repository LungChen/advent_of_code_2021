# frozen_string_literal: true

dir = File.dirname(__FILE__)
array = []

File.open("#{dir}/input.txt").each_line do |input_line|
  line = input_line.split('->')
  p1 = line[0].strip.split(',').map(&:to_i)
  p2 = line[1].strip.split(',').map(&:to_i)
  # puts "#{p1}, #{p2}"

  direct_x = p1[0] < p2[0] ? 'right' : 'left'
  direct_y = p1[1] < p2[1] ? 'down' : 'up'

  if p1[0] == p2[0]
    # y changed
    distance = (p2[1] - p1[1]).abs + 1
    distance.times do |i|
      y = direct_y == 'down' ? p1[1] + i : p1[1] - i
      array[p1[0]] = [] if array[p1[0]].nil?
      array[p1[0]][y] = (array[p1[0]][y] || 0) + 1
    end
  elsif p1[1] == p2[1]
    # x changed
    distance = (p2[0] - p1[0]).abs + 1
    distance.times do |i|
      x = direct_x == 'right' ? p1[0] + i : p1[0] - i
      array[x] = [] if array[x].nil?
      array[x][p1[1]] = (array[x][p1[1]] || 0) + 1
    end
  else
    # diagonal lines
    distance = (p2[0] - p1[0]).abs + 1
    distance.times do |i|
      x = direct_x == 'right' ? p1[0] + i : p1[0] - i
      y = direct_y == 'down' ? p1[1] + i : p1[1] - i

      array[x] = [] if array[x].nil?
      array[x][y] = (array[x][y] || 0) + 1
    end
  end
end

puts array.flatten.count { |item| !item.nil? && item >= 2 }
