require_relative("../mixins/turner")
require_relative("../mixins/chase_mixin.rb")
require_relative("../mixins/turner")
require_relative("../karel/ur_robot")
require_relative("../karel/robota")

class RobotFaceNord < UrRobot
  include Turner
  include ChaseMixin

  def initalize(street, avenue, beepers)
    super(street, avenue, Robota::NORTH, beepers)
  end
end
