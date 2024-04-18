require_relative("../karel/ur_robot")
require_relative("../mixins/turner")

class ChaseRobot < UrRobot
  def turn_right()
    turn_left()
    turn_left()
    turn_left()
  end

  def recule()
    turn_left()
    turn_left()
    move()
    turn_left()
    turn_left()
  end
end