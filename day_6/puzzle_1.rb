# frozen_string_literal: true

def after_days(origin_arr, days)
  days.times do 
    spawn_count = 0
    origin_arr = origin_arr.map do |value|
      if value == 0
        spawn_count += 1
        value = 6
      else
        value -= 1
      end
    end

    spawn_count.times do |_|
      origin_arr << 8
    end
  end

  origin_arr.length
end

input = []
dir = File.dirname(__FILE__)
input = File.read("#{dir}/input.txt").split(',').map(&:to_i)

puts after_days(input, 80)
