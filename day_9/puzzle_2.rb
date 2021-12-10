# frozen_string_literal: true

def lowest_points(array)
  row_size = array[0].length
  column_size = array.length

  result = []
  column_size.times do |x|
    row_size.times do |y|
      left = x - 1 < 0 || array[x][y] < array[x-1][y]
      right = x + 1 >= column_size || array[x][y] < array[x+1][y] 
      up = y - 1 < 0 || array[x][y] < array[x][y-1]
      down = y + 1 >= row_size || array[x][y] < array[x][y+1]
      result << [x, y] if left && right && up && down
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

lowests = lowest_points(array)

def same_group(array, point, open_path, close_path)
  x = point[0]
  y = point[1]

  return if close_path.include?(point)

  close_path << [x, y]

  open_path << [x-1, y] if x > 0 && array[x-1][y] != 9 && !open_path.include?([x-1, y]) && !close_path.include?([x-1, y])
  open_path << [x+1, y] if x < array.length - 1 && array[x+1][y] != 9 && !open_path.include?([x+1, y]) && !close_path.include?([x+1, y])
  open_path << [x, y-1] if y > 0 && array[x][y-1] != 9 && !open_path.include?([x, y-1]) && !close_path.include?([x, y-1])
  open_path << [x, y+1] if y < array[0].length - 1 && array[x][y+1] != 9 && !open_path.include?([x, y+1]) && !close_path.include?([x, y+1])

  if(open_path.any?)
    same_group(array, open_path.shift, open_path, close_path)
  end
  close_path
end

result = []
lowests.each do |point|
  open_path = []
  close_path = []
  result << same_group(array, point, open_path, close_path).count
end


hash = result.sort.reverse.tally
step = 0
number = 1
hash.each do |h|
  break if step >= 3
  number *= h[0]
  step += 1
end

puts number
