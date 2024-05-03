require_relative("../karel/robota")
require_relative("./better_init.rb")
require_relative("../mixins/chase_mixin.rb")


class T10Q3Robot < BetterInit
  @@N_COLS = 10
  def move()
    super() if front_is_clear?()
  end

  def pick_beeper()
    if next_to_a_beeper?()
      super()
    end
  end

  def wipe_board()
    i = 0
    while i < @@N_COLS do
      clear_line()
      next_line(@direction)
      i += 1
    end
  end

  def clear_line()
    while front_is_clear?() do
      pick_beeper()
      move()
    end
  end

  def next_line(start_dir)
    point_at(Robota::SOUTH)
    move()

    if start_dir == Robota::EAST
      point_at(Robota::WEST)
    else
      point_at(Robota::EAST)
    end
  end
end
