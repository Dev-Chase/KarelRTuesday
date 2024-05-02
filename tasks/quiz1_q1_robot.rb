# Framework
require_relative("../karel/robota")
require_relative("../karel/ur_robot")

# Personal
require_relative("../mixins/chase_mixin.rb")

class Quiz1Q1Robot < UrRobot
  include ChaseMixin

  # Start with Correct State
  def initialize()
    super(8, 6, Robota::EAST, 26)
  end

  def next_line()
    if @street != 1
      point_at(Robota::SOUTH)
      move()
      point_at(Robota::EAST)
      while @avenue != 6 do
        back_up()
      end
    end
  end

  def create_line(length)
    if (length % 2 == 1)
      # Back up Half of Line Length minus the middle beeper
      back_up_times((length - 1) / 2)

      # Create Actual Line
      put_beeper_advance_times(length)

      # Go to Next Line
      next_line()
    else
      raise("Line Length must be Odd Number")
    end
  end
  
end
