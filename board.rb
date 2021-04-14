require_relative 'display'

class Board
  include Display
  attr_accessor :board

  def initialize(rows)
    @rows = rows
    @board = empty_board(@rows)
  end

  def update_board(replace_row, guess, right_col, right_pos)
    board[replace_row] = guess_row(guess, right_col, right_pos)
  end

  def empty_board(num_rows)
    starting_board = [top_row, answer_row, bottom_row]
    num_rows.times {
      starting_board.insert(1, empty_row)
      starting_board.insert(2, middle_row)
    }
    starting_board
  end
end