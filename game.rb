require_relative 'input'
require_relative 'display'
require_relative 'colors'
require_relative 'human'

class Game
  include Input
  attr_reader :role, :player, :code, :guess
  attr_accessor :num_chance

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

  def dec_chance
    @num_chance -= 1
  end

  def no_chance?
    if num_chance > 0
      return true
    end

    puts "No more chances"
    return false
  end

  def guess_right?
    unless guess == code
      return false
    end
    
    puts "Guess Right! You win"
    return true
  end

  def game_loop
    @guess = ''

    while true
      clear_screen
      show_board

      puts "you have #{num_chance} number of chances"
      @guess = player.get_guess

      if guess_right?
        break
      end

      dec_chance

      unless no_chance?
        break
      end
    end
  end


  def game_flow
    game_mode
    chance
    clear_screen
    show_board
    @code = player.set_code
    game_loop
  end

end

Game.new.game_flow

