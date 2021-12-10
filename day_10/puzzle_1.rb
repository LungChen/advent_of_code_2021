# frozen_string_literal: true

PAIR = {
  ')' => '(',
  ']' => '[',
  '}' => '{',
  '>' => '<'
}

SCORE = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25137
}

def corrupted(chars)
  open_path = []
  chars.each do |char|
    case char
    when '(', '[', '{', '<'
      open_path << char
    when ')', ']', '}', '>'
      record = open_path.pop
      p "record:#{record}, pair:#{PAIR[char]}, char:#{char}"
      return char if record != PAIR[char]
    end 
  end
end

def score(chars)
  SCORE[corrupted(chars)] || 0
end

dir = File.dirname(__FILE__)
result = 0
File.readlines("#{dir}/input.txt", chomp: true).each do |line|
  result += score(line.chars) 
end

puts result
