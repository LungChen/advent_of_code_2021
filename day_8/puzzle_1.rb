# frozen_string_literal: true

def get_output(pattern, output)
  hash = {}
  match = []
  match[1] = pattern.find { |p| p.length == 2 }
  match[4] = pattern.find { |p| p.length == 4 }
  match[6] = pattern.find { |p| p.length == 6 && (p.chars & match[1].chars).sort != match[1].chars.sort }
  match[7] = pattern.find { |p| p.length == 3 }
  match[8] = pattern.find { |p| p.length == 7 }
  match[9] = pattern.find { |p| p.length == 6 && (p.chars.sort & match[4].chars.sort == match[4].chars.sort) }
  match[0] = pattern.find { |p| p.length == 6 && p != match[9] && p != match[6] }

  hash['a'] = (match[7].chars - match[1].chars).join('')
  hash['c'] = (match[1].chars - match[6].chars).join('')
  hash['d'] = (match[9].chars - match[0].chars).join('')
  hash['e'] = (match[0].chars - match[9].chars).join('')
  hash['f'] = (match[1].chars - [hash['c']]).join('')

  hash['b'] = (match[4].chars - match[1].chars - [hash['d']]).join('')
  hash['g'] = (match[8].chars - hash.values).join('')
  
  match[2] = hash['a'] + hash['c'] + hash['d'] + hash['e'] + hash['g']
  match[3] = hash['a'] + hash['c'] + hash['d'] + hash['f'] + hash['g']
  match[5] = hash['a'] + hash['b'] + hash['d'] + hash['f'] + hash['g']

  result = output.map do |o|
    match.index { |m| m.chars.sort == o.chars.sort }
  end
end

dir = File.dirname(__FILE__)
arr = []
File.readlines("#{dir}/input.txt").each do |line|
  array = line.split('|')
  patterns = array[0].split(' ')
  outputs = array[1].split(' ')

  arr << get_output(patterns, outputs)
end


puts arr.flatten.count { |r| [1, 4, 7, 8].include?(r) }

