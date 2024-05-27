require_relative("../karel/robota")
require_relative("./t16_sommative_q2_robot.rb")

class GatheredRobot < Q2Robot
  def initialize(positions, colour=:green)
    super(positions, colour)
  end

  def at?(x, y)
    return x == get_x() && y == get_y()
  end
end
