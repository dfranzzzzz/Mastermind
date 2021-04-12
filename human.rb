require_relative 'input'

class Human
  include Input

  def initialize
    puts 'decoder'
  end

  def set_code
    code = "#{rand(1...7)}#{rand(1...7)}#{rand(1...7)}#{rand(1...7)}"
    code
  end

  def get_guess
    guess = prompt_guess(print_text('guess'))
    guess
  end
end