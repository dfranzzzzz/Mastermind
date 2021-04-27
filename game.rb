require_relative 'input'
require_relative 'display'
require_relative 'human'
require_relative 'board'

class Game
  include Input
  include Display
  attr_reader :player, :code, :guess, :board
  attr_accessor :num_chance

  def initialize
    puts intro
    @player = Human.new
  end

  def chance
    @num_chance = prompt_chance(print_text('chance'))
  end

  def decrease_chance
    @num_chance -= 1
  end

  def no_chance?(message)
    return false if num_chance > 0
    board.update_board(-2, code, " ", " ")
    clear_screen
    puts board.board
    puts message
    return true
  end

  def guess_right?(message)
    return false unless guess.join('') == code
    board.update_board(-2, code, " ", " ")
    clear_screen
    puts board.board
    puts message
    return true
  end

  def num_chance?
    puts "You have #{num_chance} number of chances"
  end

  def same_elements
    same = guess & code.split('')
    same.length
  end

  def same_position
    a = guess
    b = code.split('')
    c = a.zip(b).count { |a,b| a == b }
    c
  end

  def create_board
    @board = Board.new(@num_chance)
  end

  def game_loop
    curr_row = 1

    while true
      clear_screen
      puts board.board
      num_chance?
      puts show_choices
      @guess = player.get_guess
      a = same_position
      b = same_elements - a
      b = 0 if b < 0 
      clear_screen
      board.update_board(curr_row, guess, b, a)
      puts board.board
      curr_row += 2
      break if guess_right?(print_text('guess_right'))
      decrease_chance
      break if no_chance?(print_text('no_chances'))
    end
  end

  def game_flow
    chance
    clear_screen
    create_board
    @code = player.set_code
    game_loop
  end
end