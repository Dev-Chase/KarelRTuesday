require_relative("../karel/robota")
require_relative("../karel/ur_robot")
require_relative("../mixins/chase_mixin.rb")

class T10Q2Robot < UrRobot
  include ChaseMixin # includes SensorPack
  def move()
    super() unless !front_is_clear?()
  end
end
