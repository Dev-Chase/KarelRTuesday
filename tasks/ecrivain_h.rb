require_relative("../karel/ur_robot")
require_relative("../karel/robota")
require_relative("../mixins/chase_mixin.rb")
require_relative("ecrivain")

class EcrivainH < Ecrivain
  # Always Start with Right Number of Beepers and in Right Direction
  def initialize(avenue)
    super(avenue, Robota::SOUTH, 15)
  end

  # Start at Top left
  def ecrit_lettre()
    # Make Left Vertical Line
    point_at(Robota::SOUTH) # Unnecessary
    put_beeper()
    advance_put_beeper_times(4)

    # Set up for & Make Horizontal Line
    back_up_times(2)
    point_at(Robota::EAST)
    advance_put_beeper_times(3)
    move()

    
    # Set up for & Make Right Vertical Line
    point_at(Robota::NORTH)
    advance_times(3)
    point_at(Robota::SOUTH)
    advance_put_beeper_times(5)
  end
end
