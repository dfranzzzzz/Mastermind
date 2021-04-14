module Display
  TOP_LEFT = "\u2554"
  TOP_RIGHT = "\u2557"
  BOTTOM_LEFT = "\u255a"
  BOTTOM_RIGHT = "\u255d"
  HOR = "\u2550"
  VER = "\u2551"
  T_DOWN = "\u2566"
  T_UP = "\u2569"
  T_RIGHT = "\u2560"
  T_LEFT = "\u2563"
  T_ALL = "\u256c"
  SHORT_HOR = HOR * 3
  LONG_HOR = HOR * 11
  CHOICES = ['r', 'g', 'y', 'b', 'p', 'c']

  def top_row
    TOP_LEFT + SHORT_HOR + T_DOWN + LONG_HOR + T_DOWN + SHORT_HOR + TOP_RIGHT
  end

  def middle_row
    T_RIGHT + SHORT_HOR + T_ALL + LONG_HOR + T_ALL + SHORT_HOR + T_LEFT
  end

  def bottom_row
    BOTTOM_LEFT + SHORT_HOR + T_UP + LONG_HOR + T_UP + SHORT_HOR + BOTTOM_RIGHT
  end

  def empty_row
  "#{VER}   #{VER}#{get_peg}  #{get_peg}  #{get_peg}  #{get_peg} #{VER}   #{VER}"
  end

  def guess_row(guess, right_col, right_pos)
    "#{VER} #{right_col} #{VER}#{get_peg(guess[0])}  #{get_peg(guess[1])}  #{get_peg(guess[2])}  #{get_peg(guess[3])} #{VER} #{right_pos} #{VER}"
  end

  def answer_row
    "#{VER}   #{VER}right  code#{VER}   #{VER}"
  end

  def get_peg(color = 'w')
    {
      'r' => "\u2b24".red,
      'g' => "\u2b24".green,
      'y' => "\u2b24".yellow,
      'b' => "\u2b24".blue,
      'p' => "\u2b24".purple,
      'c' => "\u2b24".cyan,
      'w' => "\u2b24".white
    }[color]
  end

  def show_choices
    <<~HEREDOC
      Your choices:
      #{get_peg('r')} = r
      #{get_peg('g')} = g
      #{get_peg('y')} = y
      #{get_peg('b')} = b
      #{get_peg('p')} = p
      #{get_peg('c')} = c
    HEREDOC
  end
end

