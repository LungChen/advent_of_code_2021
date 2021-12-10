# frozen_string_literal: true

PAIR = {
  ')' => '(',
  ']' => '[',
  '}' => '{',
  '>' => '<'
}

SCORE = {
  ')' => 1,
  ']' => 2,
  '}' => 3,
  '>' => 4
}

MULTIPLY = 5

def uncomplet(chars)
  open_path = []
  chars.each do |char|
    case char
    when '(', '[', '{', '<'
      open_path << char
    when ')', ']', '}', '>'
      record = open_path.pop
      return nil if record != PAIR[char]
    end 
  end
  open_path
end

def score(chars)
  open_path = uncomplet(chars)
  s = 0
  return nil if open_path.nil?

  length = open_path.length
  length.times do |t|
    key = PAIR.key(open_path.pop)
    s = s * MULTIPLY + SCORE[key]
  end
  s
end

dir = File.dirname(__FILE__)
scores = []
File.readlines("#{dir}/input.txt", chomp: true).each do |line|
  s = score(line.chars)
  scores << s if !s.nil?
end

puts scores.sort[scores.length / 2]
