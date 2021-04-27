require_relative 'input'
require_relative 'display'

class Human
  include Input
  include Display

  def initialize
    puts "You are the " + 'DECODER'.bold.blue
  end

  def set_code
    code = "#{CHOICES.sample}#{CHOICES.sample}#{CHOICES.sample}#{CHOICES.sample}"
    code
  end

  def get_guess
    guess = prompt_guess(print_text('guess'))
    guess
  end
end