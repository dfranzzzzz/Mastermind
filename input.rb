require_relative 'display'

module Input
  include Display

  def print_text(message)
    {
      'chance' => "Enter number of chances you will guess (1-15): ",
      'guess' => "Enter your guess(Pick 4 among the choices and without spaces): ",
      'no_chances' => "You lose. You have no more chances left.",
      'guess_right' => "You guessed it right! You win!",
    }[message]
  end

  def prompt_chance(message)
    chance = ''
    until (1..15).member?(chance)
      print message
      chance = gets.chomp.to_i
    end
    chance
  end

  def prompt_guess(message)   
    guess = ['a', 'b', 'c', 'd']
    until guess.all? { | str | CHOICES.include?(str) } && guess.length == 4
      print message
      guess = gets.chomp.split('')
    end
    guess
  end

  def clear_screen
    system('clear')
  end

  def intro
    <<~HEREDOC 
      #{"This is MASTERMIND Console!".bold.italic}

      #{'Mastermind'.bold} is a codebreaking game for two players with different roles:
        1. The #{'CODER'.bold.red}, who will set a combination of four colors.
        2. The #{'DECODER'.bold.blue}, who will guess the combination the coder has come up with.

      In the game, the coder will be given 6 colors to choose from to formulate the 
      combination that has to be decoded.
        1. #{"\u2b24".red} - Red
        2. #{"\u2b24".green} - Green
        3. #{"\u2b24".yellow} - Yellow
        4. #{"\u2b24".blue} - Blue
        5. #{"\u2b24".purple} - Purple
        6. #{"\u2b24".cyan} - Cyan

      The chances that the #{'DECODER'.bold.blue} will be given will also be decided in the beginning
      of the game. If the the #{'DECODER'.bold.blue} fails to guess the combination under the given 
      number of chances, the #{'CODER'.bold.red} wins. If the #{'DECODER'.bold.blue} has successfully guessed the
      right combination of colors and in the right order within the number of chances 
      given to him, the #{'DECODER'.bold.blue} wins.

      The #{'DECODER'.bold.blue} will be given hints along the game to help him come up with the right
      combination. After the #{'DECODER'.bold.blue} makes a guess of the combination, it will be shown
      to him the number of correct colors on the left side of the board, as well as the 
      number of colors that are in the right places, which will be shown on the right 
      side of the board. 

      For this program, the computer will serve as the #{'CODER'.bold.red} that would randomize the 
      set of colors, and the user will serve as the #{'DECODER'.bold.blue}

    HEREDOC
  end
end