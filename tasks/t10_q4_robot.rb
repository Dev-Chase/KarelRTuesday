require_relative("../karel/robota")
require_relative("./t10_q3_robot.rb")
require_relative("../mixins/chase_mixin.rb")


class T10Q4Robot < T10Q3Robot
  def initialize(x, y, direction)
    super(x, y, direction, Robota::INFINITY)
  end

  def wipe_board()
    i = 0
    while i < @@N_COLS do
      is_corner = (i == 0 || i == @@N_COLS - 1)
      if is_corner
        place_beeper_times(3)
      end

      clear_line()
      if is_corner
        place_beeper_times(2)
      end

      next_line(@direction)

      i += 1
    end

  end
end
