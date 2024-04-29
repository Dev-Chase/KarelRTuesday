require_relative("../karel/ur_robot")
require_relative("../karel/robota")
require_relative("../mixins/chase_mixin.rb")
require_relative("ecrivain")

class EcrivainO < Ecrivain
  # Always Start at Right Street with Right Number of Beepers and in Right Direction
  def initialize(avenue)
    super(avenue, Robota::SOUTH, 12)
  end

  # Start at Top left
  def ecrit_lettre()
    # Make Left Side
    point_at(Robota::SOUTH) # Unnecessary
    put_beeper()
    advance_put_beeper_times(4)

    # Make Bottom Side
    point_at(Robota::EAST)
    advance_put_beeper_times(2)

    # Make Right Side
    point_at(Robota::NORTH)
    advance_put_beeper_times(4)

    # Make Top Side
    point_at(Robota::WEST)
    advance_put_beeper()

    # Go to Right of Letter
    point_at(Robota::EAST)
    move()
  end
end
