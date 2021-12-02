# frozen_string_literal: true

dir = File.dirname(__FILE__)

x = 0
y = 0
File.open("#{dir}/input.txt").each_line do |line|
  data = /([a-zA-Z]+) (\d+)/m.match(line)
  value = data[2].to_i
  case data[1]
  when 'forward'
    x += value
  when 'up'
    y -= value
  when 'down'
    y += value
  end
end

puts x * y
