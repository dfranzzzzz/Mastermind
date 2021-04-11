module Input
  def print_text(message)
    {
      'role' => "Choose your role ( c = Coder || d = Decoder ): ",
      'chance' => "Enter number of chances the decoder can guess (1-15): ",
      'guess' => "Enter your guess: " 
    }[message]
  end

  def prompt_role(message)
    role = ''
    until role == 'c' || role == 'd'
      print message
      role = gets.chomp.downcase
    end
    role
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
    print message
    guess = gets.chomp
  end

  def clear_screen
    system('clear')
  end

  def show_board
    puts 'board'
  end

  def intro
    <<~HEREDOC 
      #{"This is MASTERMIND Console!".bold.italic}

      #{'Mastermind'.bold} is a codebreaking game for two players with different roles:
        1. The #{'CODER'.bold.red}, who will set a combination of four colors.
        2. The #{'DECODER'.bold.blue}, who will guess the combination the coder has come up with.

      In the game, the coder will be given 7 colors to choose from to formulate the 
      combination that has to be decoded.
        1. #{"\u2b24".red} - Red
        2. #{"\u2b24".green} - Green
        3. #{"\u2b24".yellow} - Yellow
        4. #{"\u2b24".blue} - Blue
        5. #{"\u2b24".purple} - Purple
        6. #{"\u2b24".cyan} - Cyan
        7. #{"\u2b24".white} - White

      The chances that the #{'DECODER'.bold.blue} will be given will also be decided in the beginning
      of the game. If the the #{'DECODER'.bold.blue} fails to guess the combination under the given 
      number of chances, the #{'CODER'.bold.red} wins. If the #{'DECODER'.bold.blue} has successfully guessed the
      right combination of colors and in the right order within the number of chances 
      given to him, the #{'DECODER'.bold.blue} wins.

      The #{'DECODER'.bold.blue} will be given hints along the game to help him come up with the right
      combination. After the #{'DECODER'.bold.blue} makes a guess of the combination, it will be shown
      to him the number of correct colors, as well as the number of colors that are in the right places 
      present in his latest guess. 
    HEREDOC
  end

end