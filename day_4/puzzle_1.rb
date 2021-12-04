# frozen_string_literal: true

ELEMENTS_IN_ONE_ROW = 5
MAX_INDEX_IN_ONE_ROW = 4

def bingo?(board)
  0.upto(MAX_INDEX_IN_ONE_ROW) do |i|
    marked_in_one_row = 0
    marked_in_one_column = 0
    0.upto(MAX_INDEX_IN_ONE_ROW) do |j|
      row_idx = i * ELEMENTS_IN_ONE_ROW + j
      marked_in_one_row += 1 if board[row_idx] == -1

      col_idx = j * ELEMENTS_IN_ONE_ROW + i
      marked_in_one_column += 1 if board[col_idx] == -1
    end

    return true if marked_in_one_row == ELEMENTS_IN_ONE_ROW || marked_in_one_column == ELEMENTS_IN_ONE_ROW
  end
  false
end

dir = File.dirname(__FILE__)
array = File.open("#{dir}/input.txt").read.split(/\n{2,}/)

# first line for bingo number
bingo = array[0].split(',')
array.shift
boards = array.map { |sub_arr| sub_arr.split(' ') }
bingo.each do |value|
  boards.each do |board|
    idx = board.index(value)
    board[idx] = -1 unless idx.nil?
    next unless bingo?(board)

    puts board.map(&:to_i).reject { |n| n == -1 }.sum * value.to_i
    return
  end
end
