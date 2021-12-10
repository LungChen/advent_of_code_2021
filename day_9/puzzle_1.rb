# frozen_string_literal: true

def lowest_points(array)
  row_size = array[0].length
  column_size = array.row_length
  
  result = []
  column_size.times do |x|
    row_size.times do |y|
      left = x - 1 < 0 || array[x][y] < array[x-1][y]
      right = x + 1 >= column_size || array[x][y] < array[x+1][y] 
      up = y - 1 < 0 || array[x][y] < array[x][y-1]
      down = y + 1 >= row_size || array[x][y] < array[x][y+1]
      result << array[x][y] if left && right && up && down
    end
  end
  result
end

dir = File.dirname(__FILE__)
array = []
File.readlines("#{dir}/input.txt", chomp: true).each_with_index do |line, idx|
  array[idx] = []
  array[idx] = line.chars.map(&:to_i)
end
array = array.transpose

p array

p lowest_points(array).map{|i| i += 1}.sum

