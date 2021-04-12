require_relative 'input'
require_relative 'display'
require_relative 'colors'
require_relative 'human'
require_relative 'board'

class Game
  include Input
  include Display
  attr_reader :role, :player, :code, :guess
  attr_accessor :num_chance, :board

  def initialize
    puts intro
  end

  def game_mode
    @role = prompt_role(print_text('role'))
    role == 'c' ? @player = Computer.new : @player = Human.new
  end

  def chance
    @num_chance = prompt_chance(print_text('chance'))
  end

  def decrease_chance
    @num_chance -= 1
  end

  def no_chance?(message)
    return false if num_chance > 0
    puts message
    puts @code
    return true
  end

  def guess_right?(message)
    return false unless guess == code
    puts message
    return true
  end

  def num_chance?
    puts "You have #{num_chance} number of chances"
  end

  def same_elements
    same = guess.split('') & code.split('')
    same.length
  end

  def same_position
    a = guess.split('')
    b = code.split('')
    c = a.zip(b).count { |a,b| a == b }
    c
  end

  def create_board
    @board = Board.new(@num_chance)
  end

  def show_board
    a = same_elements
    b = same_position
    puts top_row
    @num_chance.times {
      puts game_row(a, b)
    }
    puts bottom_row
  end

  def game_loop
    @guess = ''

    while true
      clear_screen
      show_board
      num_chance?
      @guess = player.get_guess
      break if guess_right?(print_text('guess_right'))
      decrease_chance
      break if no_chance?(print_text('no_chances'))
    end
  end

  def game_flow
    game_mode
    chance
    clear_screen
    create_board
    @code = player.set_code
    game_loop
  end
end

Game.new.game_flow