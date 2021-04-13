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

  def top_row
    TOP_LEFT + HOR * 3 + T_DOWN + HOR * 12 + T_DOWN + HOR * 3 + TOP_RIGHT
  end

  def middle_row
    T_RIGHT + HOR * 3 + T_ALL + HOR * 12 + T_ALL + HOR * 3 + T_LEFT
  end

  def bottom_row
    BOTTOM_LEFT + HOR * 3 + T_UP + HOR * 12 + T_UP + HOR * 3 + BOTTOM_RIGHT
  end

  def empty_row
  "#{VER}   #{VER}            #{VER}   #{VER}"
  end

  def guess_row(guess, right_col, right_pos)
    guess = guess.split('')
    "#{VER} #{right_col} #{VER} #{guess[0]}  #{guess[1]}  #{guess[2]}  #{guess[3]} #{VER} #{right_pos} #{VER}"
  end

  def answer_row
    "#{VER}   #{VER}   answer   #{VER}   #{VER}"
  end
end

