require_relative("../karel/ur_robot")
require_relative("../karel/robota")
require_relative("../mixins/chase_mixin.rb")
require_relative("ecrivain")

class EcrivainL < Ecrivain
  # Always Start at Right Street with Right Number of Beepers and in Right Direction
  def initialize(avenue)
    super(avenue, Robota::SOUTH, 7)
  end

  # Start at Top left
  def ecrit_lettre()
    # Make Vertical Line
    point_at(Robota::SOUTH) # Unnecessary
    put_beeper()
    advance_put_beeper_times(4)

    # Make Horizontal Line
    point_at(Robota::EAST)
    advance_put_beeper_times(2)
  end
end
