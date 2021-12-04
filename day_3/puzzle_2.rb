# frozen_string_literal: true

def get_rate(arr, idx, prefer, method)
  target = get_target(arr, idx, prefer, method)
  new_arr = array_with(arr, idx, target)
  if new_arr.length == 1
    new_arr[0]
  else
    get_rate(new_arr, idx + 1, prefer, method)
  end
end

def get_target(arr, idx, prefer, method)
  trans = arr.transpose
  target = trans[idx].send(method) { |i| trans[idx].count(i) }

  # count the occurrence of the element
  count = trans[idx].map { |i| trans[idx].count(i) }.max
  target = prefer if count == (arr.length / 2)
  target
end

def array_with(arr, idx, value)
  arr.select { |sub_array| sub_array[idx] == value }
end

dir = File.dirname(__FILE__)
array = []

File.open("#{dir}/input.txt").each_line do |line|
  array << line.strip.chars
end

o2 = get_rate(array, 0, '1', :max_by).join
co2 = get_rate(array, 0, '0', :min_by).join

puts "o2: #{o2.to_i *2}"
puts "co2: #{co2.to_i *2}"

puts (o2.to_i *2) * (co2.to_i *2)
