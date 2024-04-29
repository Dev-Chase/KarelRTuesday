require_relative("../karel/ur_robot")
require_relative("../karel/robota")
require_relative("../mixins/chase_mixin.rb")
require_relative("ecrivain")

class EcrivainE < Ecrivain
  # Always Start with Right Number of Beepers and in Right Direction
  def initialize(avenue)
    super(avenue, Robota::EAST, 11)
  end

  def make_horizontal_line()
    point_at(Robota::EAST)
    advance_put_beeper_times(2)
    back_up_times(2)
  end

  def go_to_next_horizontal_line()
    point_at(Robota::SOUTH)
    advance_put_beeper_times(2)
  end

  # Start at Top left
  def ecrit_lettre()
    # Make Top Line
    put_beeper()
    make_horizontal_line() # Top Line
    go_to_next_horizontal_line() # In between
    make_horizontal_line() # Middle Line
    go_to_next_horizontal_line() # In between
    make_horizontal_line() # Bottom Line
    advance_times(2) # Go back to Right Side of Letter
  end
end
